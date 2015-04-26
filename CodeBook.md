#Getting and Cleaning Data Project

##Description

One of the most exciting areas in all of data science right now is wearable computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/). Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

##Source Data

The source data for the project can be found here:

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

##Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

##Attribute Information

The following are provided for each record in the dataset:

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

###Step 1. Merges the training and the test sets to create one data set.

Read into tables the measurement, activity and subject data sets for both training and test. Combine them using row bind into separate data sets.

measurementData

- 'train/X_train.txt': Training set.
- 'test/X_test.txt': Test set.

activityData

- 'train/y_train.txt': Training labels.
- 'test/y_test.txt': Test labels.

subjectData

- 'train/subject_train.txt': Training subject.
- 'test/subject_test.txt': Test subject.

###Step 2. Extracts only the measurements on the mean and standard deviation for each measurement.

Read into tables the list of supported features from 'features.txt'. Perform a search using grep to find those whose name contains "mean()" or "std()". Grep returns a vector of the indices of the elements in the supplied vector that yielded a match. Subset measurementData by the vector returned by grep to keep only the required columns.

###Step 3. Uses descriptive activity names to name the activities in the data set

Read into tables the activity labels from 'activity_labels.txt' and change the numeric labels in activityData to the descriptive equivalent.

###Step 4. Appropriately labels the data set with descriptive variable names

Use the feature names in Step 2 to replace the column names of measurementData. Give the column name "activity" and "subject" to activityData and subjectData respectively. Combine the 3 data sets into 1 data set using column bind in this order:

1. subjectData
2. activityData
3. measurementData

###Step 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Using the ddply function in the plyr package, split the final data set in Step 4 by subject and activity. Perform the colMeans function for the rest of the columns and write the results into a text file 'mean_data.txt'.