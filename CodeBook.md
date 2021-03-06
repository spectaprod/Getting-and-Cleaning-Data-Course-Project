---
title: "CodeBook"
output: github_document
---

## Getting and Cleaning Data Course Project


### Variables
* * *
#### Identifying variables
Each combination of subject and activity provide a unique set of measurements: 

* subject - each subject was assigned a unique id [1:30]
* activity - string indicating the activity performed for which measurements were gathered [WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING]

#### Measurement variables
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

*(per the instructions for the assigment, all the measurements included were summarized by taking the mean)*

* tBodyAcc-XYZ  
* tGravityAcc-XYZ  
* tBodyAccJerk-XYZ  
* tBodyGyro-XYZ  
* tBodyGyroJerk-XYZ  
* tBodyAccMag  
* tGravityAccMag  
* tBodyAccJerkMag  
* tBodyGyroMag  
* tBodyGyroJerkMag  
* fBodyAcc-XYZ  
* fBodyAccJerk-XYZ  
* fBodyGyro-XYZ  
* fBodyAccMag  
* fBodyAccJerkMag  
* fBodyGyroMag  
* fBodyGyroJerkMag  

The set of variables that were estimated from these signals are: 

* mean(): Mean value  
* std(): Standard deviation  

*(per the instructions for the assigment, only mean() and std() for the metrics are included)*

*(per the instructions for the assigment, all the data included was summarized by taking the mean of each measurement in the final dataset)*

### Tranformation Process
* * *
These are the steps the run_analysis.R runs through to produce the tidy data output.

1.  Download the files: this script does not assume the original data set is present in the working directory. It looks for a specific folder (named to be both friendly and unique to this project) and if the folder isn't present it is created, the files are downloaded, and the download folder is set as the working directory
2.  Files are read into R and assigned names. I used lapply technique ([I found here](http://www.ats.ucla.edu/stat/r/pages/read_multiple.htm)) to save on the steps to read all the files into R, and then assigned each element of the list a name used through the rest of the script.
3.  Data in X_test/train are merged using rbind (I placed "test" on top of "train", and maintained that position throughout the scrip)
4.  Assigned the list of feature names to the column names for the data set using names.
5.  Combined the subjects and activity lists for both test and train using cbind and rbind
6.  Joined the subjects and activity set to the activity labels using join_left
7.  Combined the data with the subject and activities using cbind to create a complete data table
8.  Dropped all the non-mean() and non-std() measurement and activity ID columns
9.  Grouped by subject and activity using group_by in preparation for the finished summary
10.  Summarized the data set using summarize_each and mean