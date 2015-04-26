#Getting and Cleaning Data Project

Repository for the submission of project for the Getting and Cleaning Data course provided by John Hopkins University.

##Overview

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for subsequent analysis.

The source data for the project can be found here:

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

##Prerequisite

IMPORTANT: You must have the "plyr" package installed for run_analysis.R to work correctly.

Extract the source data zip file and drop the run_analysis.R script into the folder "UCI HAR Dataset". Set the working directory in R or RStudio to the location where the files are located in your own directory. The structure of the working directory and exact files used for the project are listed below:

Input:

* run_analysis.R
* train/X_train.txt
* train/y_train.txt
* train/subject_train.txt
* test/X_test.txt
* test/y_test.txt
* test/subject_test.txt
* features.txt
* activity_labels.txt

Output:

* mean_data.txt

##Project Summary

The following is a summary of the project instructions:

You should create one R script called run_analysis.R that does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Additional Information

For additional information about the variables, data and transformations, please refer to the CodeBook.MD file.