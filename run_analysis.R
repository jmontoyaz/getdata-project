# Getting and Cleaning Data Course Project:
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
# Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 



# checking if required packages are installed?
if (!require("data.table")) {
  install.packages("data.table")
}
require("data.table")

# reading the feature types.
features         <- read.table("./data/features.txt");
features4heading <- features$V2;

# reading the train dataset using descriptive names.
xTrain    <- read.table("./data/X_train.txt", col.names=features4heading);
yTrain    <- read.table("./data/y_train.txt", col.names=c("activity"));
subjTrain <- read.table("./data/subject_train.txt", col.names=c("subjectid"));

# reading the test dataset using descriptive names.
xTest    <- read.table("./data/X_test.txt", col.names=features4heading);
yTest    <- read.table("./data/y_test.txt", col.names=c("activity"));
subjTest <- read.table("./data/subject_test.txt", col.names=c("subjectid"));

# reading activity labels and converting them to lowercase.
activity     <- read.table("./data/activity_labels.txt");
activity_lab <- tolower(activity$V2);

## Uses descriptive activity names to name the activities in the data set
yTrain$activity  <- activity_lab[yTrain$activity];
yTest$activity   <- activity_lab[yTest$activity];

## Merges the training and the test sets to create one data set.
trainData <- cbind(xTrain, yTrain, subjTrain);
testData  <- cbind(xTest, yTest, subjTest);
allData   <- rbind(trainData, testData);

## Extracts only the measurements on the mean and standard deviation for each measurement.
measurePattern <- "mean|std|activity|subjectid";
allData        <- allData[,grep(measurePattern, names(allData), value=TRUE)];

## Appropriately labels the data set with descriptive variable names.
descNames      <- gsub("\\.+", ".", names(allData))
names(allData) <- descNames;

## Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
tidydata <- ddply(allData, .(activity, subjectid), numcolwise(mean));
write.table(tidydata, './data/tidydata.txt', sep="\t", eol="\n", col.names=TRUE);