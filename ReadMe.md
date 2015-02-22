==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.1
==========================================================
The tidied data set merges the original datasets
- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.




==========================================================

The "Run_analysis.R" merges the original datasets by following tidy data rules

1. One column per variable
2. Replaced redundant data by seperating columns for activity and replacing those with their descriptive names
3. Extracted all the data for Mean(47 variables) and Standard Deviation(32 variables) with total 79 variables from x_test and X_train which were merged in "extractedData" data frame
4. Giving descriptive names for each column in "extraxtedData" set
5. The tidied dataset is named as "tidyData.txt" has calculations that creates a independent tidy data set with the average of each variable for each activity and each subject.
6. The tidy data set has total 180 observations and 81 variables in wide tidy data.
