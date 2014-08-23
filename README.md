# README

The `run_analysis.R` script performs the following operations on the [Human Activity RecognitionUsing Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) created by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto (all details about this dataset can be found at the link above):

1. Reads the feature names from `features.txt` and converts them to syntactically valid, descriptive names

2. Reads the subject IDs for the training set from `subject_train.txt`

3. Reads the activity IDs for the training set from `y_train.txt`

4. Reads the feature data for the training set from `X_train.txt`

5. Attaches the descriptive features names from (1) to the feature data for the training set

6. Subsets the feature data for the training set to include only the features corresponding to the mean and standard deviation of each measurement 

7. Combines the subject IDs, activity IDs, and subsetted feature data to make a complete training set

8. Repeats steps (2) through (7) for the test set (`subject_test.txt`, `y_test.txt`, and `X_test.txt`)

9. Combines the training set and test set to make a complete data set `data`

10. Saves `data` to a file `UCI HAR data.rda`

11. Summarizes the data in `data` by taking the mean of each feature for each subject and activity to make a new dataset `data.summary`

12. Saves `data.summary` to a file `UCI HAR data - summary.rda`

13. Saves `data.summary` to a text file `UCI HAR data - summary.txt` (for submission to the course website)

For the script to work properly, all of the original data files should be in a directory within the working directory called `UCI HAR Dataset` in exactly the same structure as the ZIP file from the link above.

