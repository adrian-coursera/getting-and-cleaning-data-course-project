library('dplyr')

features <- read.table('./UCI HAR Dataset/features.txt')
activity_labels <- read.table('./UCI HAR Dataset/activity_labels.txt')

y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")

y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")

subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")


#1 - Merges the training and the test sets to create one data set.
subjects <- rbind(subject_test, subject_train)
labels <- rbind(y_test, y_train)
set <- rbind(x_test,x_train)

#3 - Uses descriptive activity names to name the activities in the data set
labels <- inner_join(labels, activity_labels)


merged_data <- cbind(subjects, labels$V2, set)

#4 - Appropriately labels the data set with descriptive variable names.
colnames(merged_data) <- c('subject', 'activity', tolower(features$V2))

#2 - Extracts only the measurements on the mean and standard deviation for each measurement.
merged_data <- merged_data[,grepl('subject|activity|std\\(\\)|mean\\(\\)',names(merged_data))]

#5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
summary_data <- merged_data %>% group_by(subject,activity) %>% summarise_all(list(mean))

write.table(summary_data, file='./summary_data.txt', row.names = FALSE)
