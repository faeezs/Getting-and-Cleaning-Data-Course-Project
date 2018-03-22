---
  title: "CodeBook.md"
output: html_document
---
  Codebook explaining the different variables used and any transformations applied in scripts for data cleaning project.

# run_analysis.R

## file names

- data_path             : parent folder containing data files 
- train_measurement_file       : training data
- test_measurement_file        : test data
- train_activity_file      : train label data
- test_activity_file       : test label data
- features_file         : file containing features name
- activilty_label_file  : file containing activity text labels 
- train_subject_file    : file for subject numbers for training observations
- test_subject_file     : file for subject numbers for test observations

## variables

- x       : contains joined train and test observations
- y     : contains joined labels for train and test observations
- subject   : contains joined list of subjects from train and test observations
- activity_labels : contains tabel mapping between activity code and text label
- mean_std : stores columns numbers and names to keep based on the criteria of features that only contains mean and standard deviation observations
- data   : contains total set of observations combined with activity labels and subject numbers
- averages : stores the final result grouped by activity and subject with average value of all features for each group.

## transformations
  - x with all features is filtered based on the given columns for mean and std values
  - y is transformed to text label by doing a lookup of values of y into activity_labels dataframe
  - data is prepared by doing column bind of subject, y and x
  - name of columns in data are replaced descriptive variable names
  - averages is obtained by using dplyr library and chaining the functions groupby and summarise_all
  