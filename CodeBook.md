CODEBOOK FOR UCI HAR DATASET (averages)

SUMMARY: This is a codebook for an independent dataset derived from the UCI HAR dataset that contains observations of averages of means and standard deviations from each subject and activity combination.  In the original dataset experiements were carried out by a total of 30 volunteers wearing a smartphone who were given various activities.  The phone's internal gyroscope and accelerometer captured data based on the readings from these tools.  It is presented in the "narrow" form with only 4 columns. Each variable forms one column and each observation coressponds to one row. Variables include the subject conducting the tests, the activity, the variable being measured, and its respective value. 

Subject	1
	* ID corresponding to one of 30 participants
		* Numeric values (1-30)
	
Activity	2
	* Indicates action being performed
		* WALKING
		* WALKING_UPSTAIRS
		* WALKING_DOWNSTAIRS
		* SITTING
		* STANDING
		* LAYING

variable	3
	* Type of variable being measured
	
	* Prefix: t - time domain, f - frequency domain (FFT)
	* Body/Gravity: linear acceleration due to body/gravity
	* Acc/Gyro/Jerk: acceleration, angular velocity, jerk
	* Mag: magnitude of 3D signal calculated using Euclidean norm
	* mean()/std()/meanFreq(): mean, standard deviation, mean 	frequency
	* X,Y,Z: 3 axial signals/directions
		* tBodyAcc-mean()-X,Y,Z                        
		* tBodyAcc-std()-X,Y,Z       
		* tGravityAcc-mean()-X,Y,Z        
		* tGravityAcc-std()-X,Y,Z       
		* tBodyAccJerk-mean()-X,Y,Z      
		* tBodyAccJerk-std()-X,Y,Z       
		* tBodyGyro-mean()-X,Y,Z    
		* tBodyGyro-std()-X,Y,Z       
		* tBodyGyroJerk-mean()-X,Y,Z     
		* tBodyGyroJerk-std()-X,Y,Z      
		* tBodyAccMag-mean()             
		* tBodyAccMag-std()              
		* tGravityAccMag-mean()          
		* tGravityAccMag-std()           
		* tBodyAccJerkMag-mean()          
		* tBodyAccJerkMag-std()         
		* tBodyGyroMag-mean()             
		* tBodyGyroMag-std()           
		* tBodyGyroJerkMag-mean()        
		* tBodyGyroJerkMag-std()          
		* fBodyAcc-mean()-X,Y,Z        
		* fBodyAcc-std()-X,Y,Z         
		* fBodyAcc-meanFreq()-X,Y,Z    
		* fBodyAccJerk-mean()-X,Y,Z      
		* fBodyAccJerk-std()-X,Y,Z       
		* fBodyAccJerk-meanFreq()-X,Y,Z
		* fBodyGyro-mean()-X,Y,Z       
		* fBodyGyro-std()-X,Y,Z         
		* fBodyGyro-meanFreq()-X,Y,Z    
		* fBodyAccMag-mean()       
		* fBodyAccMag-std()               
		* fBodyAccMag-meanFreq()         
		* fBodyBodyAccJerkMag-mean()
		* fBodyBodyAccJerkMag-std()       
		* fBodyBodyAccJerkMag-meanFreq()
		* fBodyBodyGyroMag-mean()
		* fBodyBodyGyroMag-std()         
		* fBodyBodyGyroMag-meanFreq()
		* fBodyBodyGyroJerkMag-mean()   
		* fBodyBodyGyroJerkMag-std() 
		* fBodyBodyGyroJerkMag-meanFreq()

mean		4
	* Numeric value of mean of each measurement
	* Acc signals are measured in standard gravity units (g)
	* Gyro signals are measured in radians/second
	* Every signal is normalized and bounded within [-1,1]
		* {-1} U (-0.9999999999, 0.9999999999) U {1}
