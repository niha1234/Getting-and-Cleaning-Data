library(dplyr)
#### Step1: Merges the training and the test sets to create one data set

## Reading data for test/train/subjects/features from the system
yDataTest<-read.table("./Data/UCI HAR Dataset/test/y_test.txt")

xDataTest<-read.table("./Data/UCI HAR Dataset/test/X_test.txt")

subjectTest<-read.table("./Data/UCI HAR Dataset/test/subject_test.txt")

yDataTrain<-read.table("./Data/UCI HAR Dataset/train/y_train.txt")

xDataTrain<-read.table("./Data/UCI HAR Dataset/train/X_train.txt")

subjectTrain<-read.table("./Data/UCI HAR Dataset/train/subject_train.txt")

features<-read.table("./Data/UCI HAR Dataset/features.txt")

## pulling test data into one data frame
testFrame<-data.frame(subjectTest,yDataTest,xDataTest)

## pulling train data into one data frame
trainFrame<-data.frame(subjectTrain,yDataTrain,xDataTrain)


## merging both data frames together
mergedData<-rbind(testFrame,trainFrame)

####Step 2: Extracts only the measurements on the mean and standard deviation
##        	for each measurement. Selection from Columns 



extractedData<-select(mergedData,V1,V1.1,V1.2:V3,V41:V43,V81:V83,V121:V123,V161:V163,V201,V214,
					   V227,V240,V253,V266:V268,V294:V296,V345:V347,V373:V375,V424:V426,V452:V454,
					   V503,V513,V516,V526,V529,V539,V542,V552,V4:V6,V44:V46,V84:V86,V124:V126,V164:V166,
					   V202,V215,V228,V241,V254,V269:V271,V348:V350,V427:V429,V504,V517,V530,V543)



####Step3: Uses descriptive activity names to name the activities in the data set
## Activity names are taken from activity_labels.txt file


extractedData$V1.1[extractedData$V1.1==1]<-"WALKING"
extractedData$V1.1[extractedData$V1.1==2]<-"WALKING_UPSTAIRS"
extractedData$V1.1[extractedData$V1.1==3]<-"WALKING_DOWNSTAIRS"
extractedData$V1.1[extractedData$V1.1==4]<-"SITTING"
extractedData$V1.1[extractedData$V1.1==5]<-"STANDING"
extractedData$V1.1[extractedData$V1.1==6]<-"LAYING"


####Step4: Appropriately labels the data set with descriptive variable names
## Descriptive names are taken from features.txt file for columns Means and Standard Deviations

colnames(extractedData)<-c("Subject","Activity","tBodyAccMeanX","tBodyAccMeanY","tBodyAccMeanZ","tGravityAccMeanX","tGravityAccMeanY",
				   "tGravityAccMeanZ","tBodyAccJerkMeanX","tBodyAccJerkMeanY","tBodyAccJerkMeanZ","tBodyGyroMeanX",
				   "tBodyGyroMeanY","tBodyGyroMeanZ","tBodyGyroJerkMeanX","tBodyGyroJerkMeanY","tBodyGyroJerkMeanZ",
				   "tBodyAccMagMean","tGravityAccMagMean","tBodyAccJerkMagMean","tBodyGyroMagMean","tBodyGyroJerkMagMean",
				   "fBodyAccMeanX","fBodyAccMeanY","fBodyAccMeanZ","fBodyAccMeanFreqX","fBodyAccMeanFreqY",
				   "fBodyAccMeanFreqZ","fBodyAccJerkMeanX","fBodyAccJerkMeanY","fBodyAccJerkMeanZ","fBodyAccJerkMeanFreqX",
				   "fBodyAccJerkMeanFreqY","fBodyAccJerkMeanFreqZ","fBodyGyroMeanX","fBodyGyroMeanY","fBodyGyroMeanZ",
				   "fBodyGyroMeanFreqX","fBodyGyroMeanFreqY","fBodyGyroMeanFreqZ","fBodyAccMagMean","fBodyAccMagMeanFreq",
				   "fBodyBodyAccJerkMagMean","fBodyBodyAccJerkMagMeanFreq","fBodyBodyGyroMagMean","fBodyBodyGyroMagMeanFreq",
				   "fBodyBodyGyroJerkMagMean","fBodyBodyGyroJerkMagMeanFreq","tBodyAccStdX","tBodyAccStdY","tBodyAccStdZ",
				   "tGravityAccStdX","tGravityAccStdY","tGravityAccStdZ","tBodyAccJerkStdX","tBodyAccJerkStdY",
				   "tBodyAccJerkStdZ","tBodyGyroStdX","tBodyGyroStdY","tBodyGyroStdZ","tBodyGyroJerkStdX",
				   "tBodyGyroJerkStdY","tBodyGyroJerkStdZ","tBodyAccMagStd","tGravityAccMagStd","tBodyAccJerkMagStd",
				   "tBodyGyroMagStd","tBodyGyroJerkMagStd","fBodyAccStdX","fBodyAccStdY","fBodyAccStdZ","fBodyAccJerkStdX",
				   "fBodyAccJerkStdY","fBodyAccJerkStdZ","fBodyGyroStdX","fBodyGyroStdY","fBodyGyroStdZ",
				   "fBodyAccMagStd","fBodyBodyAccJerkMagStd","fBodyBodyGyroMagStd","fBodyBodyGyroJerkMagStd")



####Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable 
##		for each activity and each subject.


tidyData <- ddply(extractedData, c('Subject','Activity'), numcolwise(mean)) 

write.table(tidyData, "./Data/tidyData.txt", sep="\t",row.names=FALSE)








