---
title: "README"
output: github_document
---
## Getting and Cleaning Data Course Project

### About run_analysis.R
My script executes the following steps to acheive the final tidy data output:

1. Create what I anticipate to be a unique directory and download and unzip the assigment dataset into this directory
2. Read the following files into R: activity_labels.txt, features.txt, X_test.txt, y_test.txt, subject_test.txt, X_train.txt, y_train.txt, and subject_train.txt
3. Join the test and train data sets with column headers
4. Extract the mean() and std() measures (I chose to not include meanFreq() measures after reading this [post about this assignment](http://www.site.com) by David Hood)
5. Join the complete data set to subject and activies
6. Grouping the dataset by subject and activity and then summarizing using mean to satisfy the criteria of a tidy data set (a single observation per row, and a single variable per column) for the completed assignment

### About CodeBook.md
CodeBook explains how each of the original files in the UCI HAR Dataset were used, describes the final dataset, and processes used to arrive at the final output.

### Packages utilizeds
* dplyr
* data.table
* downloader

### Files Utilized
Below is the list of files from the original data set used to construct my data table and and the explanation for how/why

* activity_labels.txt - this file contains the "friendly name" of the activities measurements were taken for. The contents of this file were included to meet the follow criteria from the project reco "Uses descriptive activity names to name the activities in the data set"
* features.txt - this file contains the variable names of the measurements and was used to create column headers.
* X_test.txt/train.txt - these files contain all the measurement data for the test/train data and were merged together to create a "complete" data set.
* y_test.txt/train.txt - these files contain the activity id for the corresponding measurements and were merged to the "X_" files.
* subject_test.txt/train.txt - these files contain the subject id for each activity measurement and were merged to the "X_" files.



