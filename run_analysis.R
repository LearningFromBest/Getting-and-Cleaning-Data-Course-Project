##load tables into R and merge the training and the test sets 
Xtrain<-read.table("UCI HAR Dataset/train/X_train.txt")
Ytrain<-read.table("UCI HAR Dataset/train/y_train.txt")
Subjectrain<-read.table("UCI HAR Dataset/train/subject_train.txt")
train<-cbind(Ytrain,Xtrain)
train<-cbind(Subjectrain,train)

Xtest<-read.table("UCI HAR Dataset/test/X_test.txt")
Ytest<-read.table("UCI HAR Dataset/test/y_test.txt")
Subjectest<-read.table("UCI HAR Dataset/test/subject_test.txt")
test<-cbind(Ytest,Xtest)
test<-cbind(Subjectest,test)

data<-rbind(train,test)

##load features table
features <- read.table("UCI HAR Dataset/features.txt")

##load activity_labels table
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

##labels the data set with descriptive variable names
fe<-as.character(features[,2])
colnames(data)[3:563]<-fe
colnames(data)[1:2]<-c("subjectid","activityid")
colnames(activity_labels) <-c("activityid", "activity")

##Extracts only the measurements on the mean and standard deviation for each measurement. 
colNames <- colnames(data)
MeanStd <- (grepl("activityid" , colNames) | 
                   
                   grepl("subjectid" , colNames) | 
                   
                   grepl("mean.." , colNames) | 
                   
                   grepl("std.." , colNames) 
                 
)
subset <- data[ , MeanStd ]

##creates a independent tidy data set with the average of each variable for each activity and each subject
TidySet <- aggregate(. ~subjectid + activityid, subset, mean)

##Uses descriptive activity names to name the activities in the data set
labeldata <- merge(activity_labels, TidySet, by = 'activityid',all.x=TRUE)

##write the tidy data set into R working directory
write.table(labeldata, "labeldata.txt", row.name=FALSE)
write.csv(labeldata, "labeldata.csv")