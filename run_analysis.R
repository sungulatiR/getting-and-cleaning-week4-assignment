#
# FILE
# run_analysis.R
#
# OVERVIEW
# Collect data  from the accelerometers from the Samsung Galaxy S  
# smartphone, tidy the data and make a clean data set, outputting the
# resulting tidy data to a file named "tidy_data.txt".
# See README.md for details.
#




# STEP 1 - Get data


# download data zip file (already downloaded in the desired directory)
datUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
datFile <- "UCI HAR Dataset.zip"

if (!file.exists(datFile)) {
  download.file(datUrl, datFile, mode = "wb")
}
# unzip zip file containing data if data directory doesn't already exist
dtPath <- "UCI HAR Dataset"
if (!file.exists(dtPath)) {
  unzip(datFile)
}


# STEP 2 - Read data


# training data
subject_train <- read.table(file.path(dtPath, "train", "subject_train.txt"))
x_train <- read.table(file.path(dtPath, "train", "X_train.txt"))
y_train <- read.table(file.path(dtPath, "train", "y_train.txt"))

# test data
subject_test <- read.table(file.path(dtPath, "test", "subject_test.txt"))
x_test <- read.table(file.path(dtPath, "test", "X_test.txt"))
y_test <- read.table(file.path(dtPath, "test", "y_test.txt"))

# features (no conversion to factors)
features <- read.table(file.path(dtPath, "features.txt"), as.is = TRUE)


# activity labels
activities <- read.table(file.path(dtPath, "activity_labels.txt"))
colnames(activities) <- c("activityId", "activityLabel")


# Step 1 - Merging the training data and the test data sets to create one data set

# concatenate individual data tables to make single data table
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
Merged_Data <- cbind(Subject, Y, X)

# save memory remove individual data tables
rm(subject_train, x_train, y_train, 
   subject_test, x_test, y_test)

# assign column names
colnames(Merged_Data) <- c("subject", features[, 2], "activity")


# Step 2 - Extract only the measurements on the mean and standard deviation
# for each measurement


# determine columns of data set to keep based on column name...
keep_colmns <- grepl("subject|activity|mean|std", colnames(Merged_Data))

TidyData <- Merged_Data %>% select(subject, activity, contains("mean"), contains("std"))


# ... and keep data in these columns only
Merged_Data <- Merged_Data[, keep_colmns]


# Step 3 - Use descriptive activity names to name the activities in the data set
# replace activity values with named factor levels
Merged_Data$activity <- factor(Merged_Data$activity, 
                               levels = activities[, 1], labels = activities[, 2])

# Step 4 - Appropriately label the data set with descriptive variable names
# get column names
Merged_DataCols <- colnames(Merged_Data)

# remove special characters
Merged_DataCols <- gsub("[\\(\\)-]", "", Merged_DataCols)

# expand abbreviations and clean up names
Merged_DataCols <- gsub("^f", "frequencyDomain", Merged_DataCols)
Merged_DataCols <- gsub("^t", "timeDomain", Merged_DataCols)
Merged_DataCols <- gsub("Acc", "Accelerometer", Merged_DataCols)
Merged_DataCols <- gsub("Gyro", "Gyroscope", Merged_DataCols)
Merged_DataCols <- gsub("Mag", "Magnitude", Merged_DataCols)
Merged_DataCols <- gsub("Freq", "Frequency", Merged_DataCols)
Merged_DataCols <- gsub("mean", "Mean", Merged_DataCols)
Merged_DataCols <- gsub("std", "StandardDeviation", Merged_DataCols)

# correct typo
Merged_DataCols <- gsub("BodyBody", "Body", Merged_DataCols)

# use new labels as column names
colnames(Merged_Data) <- Merged_DataCols


# Step 5 - Create a second, independent tidy set with the average of each
# variable for each activity and each subject
# group by subject and activity and summaries using mean
Merged_DataMeans <- Merged_Data %>% 
  group_by(subject, activity) %>%
  summarise_each(funs(mean))

# output to file "tidy_data.txt"
write.table(Merged_DataMeans, "tidy_data.txt", row.names = FALSE, 
            quote = FALSE)
