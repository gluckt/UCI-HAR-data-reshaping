## Thomas Glucksman
## function : run_analysis()  
## performs analysis on UCI HAR Dataset and generates a new independent, tidy dataset ready for analysis
run_analysis <- function() {
    #load necessary libraries
    library(dplyr); library(reshape2); library(doBy)
    
    # load in data
    subtest <- read.table("UCI HAR Dataset/test/subject_test.txt")
    ytest <- read.table("UCI HAR Dataset/test/y_test.txt")
    xtest <- read.table("UCI HAR Dataset/test/X_test.txt")
    
    subtrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
    ytrain <- read.table("UCI HAR Dataset/train/y_train.txt")
    xtrain <- read.table("UCI HAR Dataset/train/X_train.txt")
    
    # add subject and activity labels
    names(subtest)[1] <- "Subject"; names(subtrain)[1] <- "Subject"
    names(ytest)[1] <- "Activity"; names(ytrain)[1] <- "Activity"
    
    # merge respective data to form test and training sets
    test <- cbind(subtest, ytest, xtest)
    train <- cbind(subtrain, ytrain, xtrain)
    
    # merge test and training sets
    full <- rbind(test, train)
    
    # order by activity, then subject
    full <- arrange(full, Subject, Activity)
    
    # Get descriptions of each variable
    features <- read.table("UCI HAR Dataset/features.txt")
    
    # Extract only variables measuring mean or standard deviation
    index <- grep("-mean[a-zA-Z]*\\(\\)|-std[a-zA-Z]*\\(\\)", features$V2)
    meanstd <- select(full[,3:dim(full)[2]], index)
    full <- cbind(full[,1:2], meanstd)
    
    # Get activity labels
    labels <- read.table("UCI HAR Dataset/activity_labels.txt")
    
    # Update 'Activity' to contain descriptive variable names rather than numbers
    full$Activity <- as.character(full$Activity)
    for (i in 1:length(full$Activity)) {
        full$Activity[i] <- as.character(labels[full$Activity[i],2])
    }
    full$Activity <- as.factor(full$Activity)
    
    # Update all other variable labels to be descriptive
    varnames <- names(full)
    varnames2 <- gsub("[a-zA-Z]*", "", varnames)
    varnames3 <- as.numeric(varnames2)
    for (i in 1:length(varnames3)) {
        desc <- as.character(features[varnames3[i],2])
        varnames2[i] <- desc
    }
    names(full)[-(1:2)] <- varnames2[-(1:2)]
    
    # Create second data set of averages of each variable for each activity/subject combination
    # Transform data into narrow form
    collapse1 <- melt(full, id=c("Subject", "Activity"))
    
    # Collapse data by mean of each variable
    collapse2 <- summaryBy(value ~ Subject + Activity + variable, FUN=c(mean), data=collapse1)
    names(collapse2)[4] <- "mean"
    
    # Write tidy data to table
    write.table(collapse2, "HARtidy.txt")
}