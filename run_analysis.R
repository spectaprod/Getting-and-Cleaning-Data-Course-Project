library(downloader)
library(dplyr)
library(data.table)
## First check to if files exist in Working directory, if no, download and save files to directory
if (!dir.exists("./AssignmentDownloadFolder")){dir.create("./AssignmentDownloadFolder")}
setwd("./AssignmentDownloadFolder")
download("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",dest="assignmentData.zip", mode="wb")
unzip("assignmentData.zip")
## read files into R
f <- c("./UCI HAR Dataset/activity_labels.txt",
       "./UCI HAR Dataset/features.txt",
       "./UCI HAR Dataset/test/X_test.txt",
       "./UCI HAR Dataset/test/y_test.txt",
       "./UCI HAR Dataset/test/subject_test.txt",
       "./UCI HAR Dataset/train/X_train.txt",
       "./UCI HAR Dataset/train/y_train.txt",
       "./UCI HAR Dataset/train/subject_train.txt")
d <- lapply(f,read.table)
activities <- d[[1]]
features <- d[[2]]
testDF <- d[[3]]
testActs <- d[[4]]
testSubs <- d[[5]]
trainDF <- d[[6]]
trainActs <- d[[7]]
trainSubs <- d[[8]]
## rbind test and training data, change column names, and select mean() and std() columns
bigDF <- rbind(testDF,trainDF)
## to use select with dplyr, the column names need to be made unique
names(bigDF) <- make.unique(as.character(features$V2), sep = ".")
smlDF <- select(bigDF, matches("mean\\(\\)|std\\(\\)"))
## cbind test and training subjects to activity and change column names
obs <- rbind(cbind(testSubs,testActs),cbind(trainSubs,trainActs))
names(obs) <- c("subject","activityID")
## join with Activity lables
names(activities) <- c("activityID","activity")
o <- left_join(obs,activities)
## cbind subject table, Activity table, and data table (fulfills step 4)
tDF <- cbind(o,smlDF)
## select required variables, group by subject and activity, and summarize with mean (fulfills step 5 of project requirements)
tidyDF <- tDF %>% 
    select(-activityID,matches("mean\\(\\)|std\\(\\)")) %>% 
    group_by(subject,activity) %>%
    summarize_each(funs(mean))
View(tidyDF)
## 1) Merges the training and the test sets to create one data set.
## 2) Extracts only the measurements on the mean and standard deviation for each measurement.
## 3) Uses descriptive activity names to name the activities in the data  set
## 4) Appropriately labels the data set with descriptive variable names.
## 5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.