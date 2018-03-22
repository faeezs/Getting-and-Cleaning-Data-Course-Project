library(dplyr)

# This script,run_analysis.R, does the following.
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with 
#    the average of each variable for each activity and each subject.

## Downloading the data 
if (!file.exists("data")) {
  dir.create("data")
}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/Dataset.zip")
unzip("./data/Dataset.zip", exdir = "./data/")

## Reading data from downloaded files
# data path
data_path = "./data/UCI HAR Dataset"
# train and test measurements
train_measurement_file = read.table(file.path(data_path,"train/X_train.txt"))
test_measurement_file = read.table(file.path(data_path,"test/X_test.txt"))
# train and test activities
train_activity_file = read.table(file.path(data_path,"train/y_train.txt"))
test_activity_file = read.table(file.path(data_path,"test/y_test.txt"))
# train and test subjects
train_subject_file = read.table(file.path(data_path,"train/subject_train.txt"))
test_subject_file = read.table(file.path(data_path,"test/subject_test.txt"))
#activity text labels
activity_labels_file = read.table(file.path(data_path,"activity_labels.txt"))
#features
features_file = read.table(file.path(data_path,"features.txt"))

## Merging training and test data
# train and test measurements
x <- rbind(train_measurement_file, test_measurement_file)
# train and test activities
y <- rbind(train_activity_file, test_activity_file)
# train and test subjects merged
subject <- rbind(train_subject_file, test_subject_file)

## from features.txt find the X-variables related to mean and std
mean_std <- list(grep("mean()|std()", features_file$V2), grep("mean()|std()", features_file$V2, value = TRUE))
x <- subset(x, select = mean_std[[1]])

# change the integer labels with text labels
y$V1 <- activity_labels_file[match(y$V1, activity_labels_file[, 1]),2]

# Give descriptive names to variables
names(x) = mean_std[[2]]
names(subject) <- "subject"
names(y) <- "activity"

# Combine activity labels with subjects and measurements
data <- cbind(subject, y, x)

# average of each variable for each activity and each subject
averages = data %>% group_by(activity, subject) %>% summarise_all(mean)
