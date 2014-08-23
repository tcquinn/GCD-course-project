# Code book for data files produced by "run_analysis.R"

### UCI HAR data.rda

The file `UCI HAR data.rda` is a data file in R data format which contains tidy data from the [Human Activity RecognitionUsing Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) created by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto (all details about this dataset can be found at the link above).

To create `UCI HAR data.rda`, we carried out the following operations on the data from the link above:

1. Read the feature names from `features.txt` and converted them to syntactically valid, descriptive names

2. Read the subject IDs for the training set from `subject_train.txt`

3. Read the activity IDs for the training set from `y_train.txt`

4. Read the feature data for the training set from `X_train.txt`

5. Attached the descriptive features names from (1) to the feature data for the training set

6. Subsetted the feature data for the training set to include only the features corresponding to the mean and standard deviation of each measurement 

7. Combined the subject IDs, activity IDs, and subsetted feature data to make a complete training set

8. Repeated steps (2) through (7) for the test set (`subject_test.txt`, `y_test.txt`, and `X_test.txt`)

9. Combined the training set and test set to make a complete data set `data`

10. Saved `data` to a file `UCI HAR data.rda`

The data frame `data` consists of 10,299 observations of 68 variables. The variables are as follows.

`subject` is the subject ID

`activity` is the activity being performed by the subject

The remaining 66 features are various measurements performed by the smartphone, following the following naming conventions:

`t` designates time domain measurements and `f` designates frequency domain measurements.

`Acc` designates accelerometer measurements and `Gyro` designates gyroscope measurements.

`Gravity` desginates acceleration due to gravity (obtained by applying a low-pass filter) while `Body` designates acceleration due to the subject's body movement (obtained by subtracting off the `Gravity` signal)

`Jerk` designates that the signal was derived in time to produce the first derivative of acceleration.

`X`, `Y`, and `Z` designate the three spatial axes.

`Mag` designtes the magnitude over all three axes.

`mean` designates the average (in time or frequency space)

`std` designates the standard deviation (in time or frequency space)

These strings are combined in a self-explanatory way to produce the variable names. In a few cases, the `Body` designation is repeated (e.g., `fBodyBodyAccJerkMag.mean`). This repetition was present in the original data and does not appear to be explained by the accompanying code book. We suspect it is a typographical error, but we have preserved it here.

All features are normalized.

### UCI HAR data - summary.rda

The file `UCI HAR data - summary.rda` is a file containing the mean of each feature for each subject and activity. The columns are identical in structure to `UCI HAR data.rda`.

### UCI HAR data - summary.txt

The file `UCI HAR data - summary.txt`is just a text version of `UCI HAR data - summary.rda`, created by the command `write.table()` with `row.names=FALSE` and all other options default.
