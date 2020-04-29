# getting-and-cleaning-data-course-project
Getting and Cleaning Data Course Project


This code works by first parsing each of these dataset files:
- features.txt
- activity_labels.txt
- ./test/Y_test.txt
- ./test/X_test.txt
- ./train/Y_train.txt
- ./train/X_train.txt
- ./test/subject_test.txt
- ./train/subject_train.txt


1. Combines the subject data for the test and train datasets (subject_test and subject_train)
2. Combines the activity data for the test and train datasets (Y_test and Y_train)
3. Combines the variable data for the test and train datasets (X_test and X_train)
4. Joins the activity_labels data with the activity data to get descriptive activity names in the activity data set
5. Merge subject, activity and measurement data
6. label columns appropriately 
7. filter out variable data that is not mean or std
8. creates a second, independent tidy data set with the average of each variable for each activity and each subject.


