library(plyr)
--------------------------------------------------------
## Merge the training and test sets to create data set
  
x_train <- read.table("train/X_train.txt") ## reading the x_train file inside R
y_train <- read.table("train/y_train.txt") ## reading the y_train file inside R
subject_train <- read.table("train/subject_train.txt") ## reading subject test file inside R
x_test <- read.table("test/X_test.txt") ## reading x_test file inside R
y_test <- read.table("test/y_test.txt") ## reading y_test file inside R
subject_test <- read.table("test/subject_test.txt") ## reading subject_text file inside R
x_data <- rbind(x_train, x_test) ## create x data set
y_data <- rbind(y_train, y_test) ## create y data set
subject_data <- rbind(subject_train, subject_test) ## create subject data set
------------------------------------------
## Extracting only the mean and standard deviation for each measurement
  
features <- read.table("features.txt") ## reading the features file inside R
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2]) ## get only mean and standard deviation
x_data <- x_data[, mean_and_std_features] ## subset the needed columns
names(x_data) <- features[mean_and_std_features, 2] ## correct coloumn names
------------------------------------------------------
## Uses descriptive activity names to name the activities in the data set
  
activities <- read.table("activity_labels.txt") ## reading the activity label file inside R
y_data[, 1] <- activities[y_data[, 1], 2] ## renaming the correct activity names
names(y_data) <- "activity" ## correct column names
----------------------------------------------------
## Appropriately labels the data set with descriptive variable names

names(subject_data) <- "subject" ## correct column name
single_dataset<-cbind(x_data, y_data, subject_data) ## binding all data in a single data set
------------------------------------------------------
## creates a second, independent tidy data set with the average of each variable for each activity and each subject
## create for all activities and subjects
## renaming the variable names in tidy data set to presentable form

AvgVar_TidyData <- ddply(single_dataset, .(subject, activity), function(x) colMeans(x[, 1:66])) ## tidy data set
names(AvgVar_TidyData)
names(AvgVar_TidyData) <- gsub("Acc", "Accelerator", names(AvgVar_TidyData))
names(AvgVar_TidyData) <- gsub("Mag", "Magnitude", names(AvgVar_TidyData))
names(AvgVar_TidyData) <- gsub("Gyro", "Gyroscope", names(AvgVar_TidyData))
names(AvgVar_TidyData) <- gsub("^t", "time", names(AvgVar_TidyData))
names(AvgVar_TidyData) <- gsub("^f", "frequency", names(AvgVar_TidyData))
names(AvgVar_TidyData)
write.table(AvgVar_TidyData, "AvgVar_TidyData.txt", row.name=FALSE) ## writing the file to local
------------------------------------------------------------------------------------------