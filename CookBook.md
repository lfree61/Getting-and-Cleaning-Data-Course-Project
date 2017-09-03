CookBook
========================================

Input data:
========================================
Download UCI Human Activity Recognition Using Smartphones Data Set from the following link: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Output data: 
========================================
The run_analysis.R code will result in two datasets-- tidy_data1.txt and tidy_data2.txt. 
The variables within both of these files include only the mean and standard deviation variables for the 
measurement variables described in the features_info.txt file in the downloaded dataset. 

Data Analysis: 
========================================
The run_analysis.R script, does the following: 
- Loads the necessary files from the UCI dataset (includes test data, train data, and feature/activity lables). 
- Merges the data into one dataset. 
- Creates a new dataset with only variables that determine the mean/standard deviation for each measurement. 
- Uses descriptive activity names and variable names. 
- Creates a second dataset that calculates the average of each variable for each activity and subject.
