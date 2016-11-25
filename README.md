# Getting-and-Cleaning-Data-Course-Project
This repo hosts the R script and documents in the coursera project:Getting and cleaning data.
Here are the major steps about how the script work:
(1)Merge the training and the test sets using function cbind and rbind.
(2)Label the data set with descriptive variable names in 'feature.txt'.
(3)Subset only the measurements on the mean and standard deviation for each measurement using 'grepl' function and  regular expression.
(4)Create an independent tidy data set with the average of each variable for each activity and each subject.
(5)Use descriptive activity names in 'activity_labels' to name the activities in the data set.
(6)write the tidy data set called 'labeldata.txt' into R working directory.
