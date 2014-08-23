# Getting and Cleaning Data
# Course project

# Read in the feature names
featureNames <- read.table("UCI HAR Dataset/features.txt",
                           colClasses="character")
colnames(featureNames) <- c("featureNumber","originalFeatureName")

# Convert the original feature names into syntactically valid variable names
featureNames$validFeatureName <- make.names(featureNames$originalFeatureName,
                                            unique=TRUE)

# Eliminate the multiple periods and eliminate periods at the ends of names to
# make clean, descriptive feature names

cleanFeatureName <- gsub("\\.{2,}","\\.",  featureNames$validFeatureName)
cleanFeatureName <- gsub("\\.+$","", cleanFeatureName)
featureNames$descriptiveFeatureName <- cleanFeatureName

# Select the features corresponding to the mean and standard deviation of each
# measurement
featureNames$select <- (grepl("mean\\(\\)",featureNames$originalFeatureName) |
                          grepl("std\\(\\)", featureNames$originalFeatureName))

# Read in the subject IDs for the training set
subject_train <- read.delim("UCI HAR Dataset/train/subject_train.txt",
                            header=FALSE,
                            sep="\t",
                            strip.white=TRUE,
                            colClasses="factor")
colnames(subject_train) <- c("subject")

# Read in the activity IDs for the training set
y_train <- read.delim("UCI HAR Dataset/train/y_train.txt",
                            header=FALSE,
                            sep="\t",
                            strip.white=TRUE,
                            colClasses="factor")
colnames(y_train) <- c("activity")

# Read in the features for the training set
X_train <- read.table("UCI HAR Dataset/train/X_train.txt",
                      colClasses="numeric")
colnames(X_train) <- featureNames$descriptiveFeatureName

# Select only the features corresponding to the mean and standard deviation of
# each measurement (we do this now and we do not retain the original features
# for memory reasons)
X_train <- X_train[,featureNames$select]

# Combine the the subject IDs, activity IDs, and feature data to make a complete
# training set
data.train <- cbind(subject_train, y_train, X_train)

# Remove the individual data sets to save memory
rm(subject_train,y_train,X_train)

# Read in the subject IDs for the test set
subject_test <- read.delim("UCI HAR Dataset/test/subject_test.txt",
                            header=FALSE,
                            sep="\t",
                            strip.white=TRUE,
                            colClasses="factor")
colnames(subject_test) <- c("subject")

# Read in the activity IDs for the test set
y_test <- read.delim("UCI HAR Dataset/test/y_test.txt",
                      header=FALSE,
                      sep="\t",
                      strip.white=TRUE,
                      colClasses="factor")
colnames(y_test) <- c("activity")

# Read in the features for the test set
X_test <- read.table("UCI HAR Dataset/test/X_test.txt",
                      colClasses="numeric")
colnames(X_test) <- featureNames$descriptiveFeatureName

# Select only the features corresponding to the mean and standard deviation of
# each measurement
X_test <- X_test[,featureNames$select]

# Combine the the subject IDs, activity IDs, and feature data to make a complete
# test set
data.test <- cbind(subject_test, y_test, X_test)

# Remove the individual data sets to save memory
rm(subject_test,y_test,X_test)

# Combine the training set and test set
data <- rbind(data.train,data.test)

# Remove the training and test sets and the feature names to save memory
rm(data.train, data.test, featureNames)

# Read in the activity labels
activityNames <- read.table("UCI HAR Dataset/activity_labels.txt",
                            colClasses="character")

# Add the activity labels to our data
levels(data$activity) <- activityNames[,2]

# Save the dataset
save(data, file="UCI HAR data.rda")

# Compute the average of each variable for each activity and each subject
data.summary <- aggregate(. ~ subject + activity, data=data, mean)

# Save the dataset summary
save(data.summary, file="UCI HAR data - summary.rda")

# Write the dataset summary to a text file (for submission to the course website)
write.table(data.summary, file="UCI HAR data - summary.txt", row.names=FALSE)
