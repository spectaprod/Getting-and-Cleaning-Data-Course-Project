---
title: "README"
output: github_document
---
## Getting and Cleaning Data Course Project

#### Before running run_analysis.R
The download method uses the "dplyr", data.table, and "downloader" packages. Download is available from CRAN If you have not yet installed this package please do so 1st. You can copy and paste this code if you wish:
```install.packages(downloader)```

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
