## @author  Malcolm Chu
## @course  Data Science by John Hopkins University
## @class   Getting and Cleaning Data
## @task    Course Project
## @description Prepare a tidy dataset from the UCI HAR Dataset
## @url     https://class.coursera.org/getdata-013/human_grading/view/courses/973500/assessments/3/submissions


# Step 1: Merges the training and the test sets to create one data set.

# Read the training data set
measurementTrain <- read.table("train/X_train.txt")
activityTrain <- read.table("train/y_train.txt")
subjectTrain <- read.table("train/subject_train.txt")

# Read the test data set
measurementTest <- read.table("test/X_test.txt")
activityTest <- read.table("test/y_test.txt")
subjectTest <- read.table("test/subject_test.txt")

# Merge the training and test sets using row bind
measurementData <- rbind(measurementTrain, measurementTest)
activityData <- rbind(activityTrain, activityTest)
subjectData <- rbind(subjectTrain, subjectTest)


# Step 2: Extracts only the measurements on the mean and standard deviation for 
# each measurement. 

# Read in the list of supported features 
features <- read.table("features.txt")

# Search for "mean()" or "std()" in the list of supported features
desiredFeatures <- grep("(mean|std)\\(\\)", features[, 2])

# Subset the measurements with the desired features
measurementData <- measurementData[, desiredFeatures]


# Step 3: Uses descriptive activity names to name the activities in the data set.

# Read in the activity labels
activityLabels <- read.table("activity_labels.txt")

# Change the numeric labels to the corresponding activity labels
activityData[, 1] <- activityLabels[activityData[, 1], 2]


# Step 4: Appropriately labels the data set with descriptive variable names. 

# Label the column names of the measurement data set (with the feature name)
names(measurementData) <- features[desiredFeatures, 2]

# Label the column names of the label data set
names(activityData) <- c("activity")

# Label the column names of the subject data set
names(subjectData) <- c("subject")

# Combine the 3 data sets using column bind
data <- cbind(subjectData, activityData, measurementData)


# Step 5: From the data set in step 4, creates a second, independent tidy data 
# set with the average of each variable for each activity and each subject.
library(plyr)

# Split the data frame by subject and activity and perform column means on the 
# measurements from column 3 to 68
meanData <- ddply(data, .(subject, activity), function(x) colMeans(x[, 3:68]))

write.table(meanData, "mean_data.txt", row.name=FALSE)