---
  title: "README.md"

Output : a dataframe of averages in a grouped_df form with name "averages"

---
  Information about the R scripts used for the data cleaning project. The project is based on data collected from the accelerometers  from the samsung galaxy smarphone. Full description of the dataset is available at 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


# Run_analysis.R

This script is called to performed the cleaning and tidying of the dataset as described in the excercise and listed below.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

This file will download the required zip file and unzip it into a ./data folder
