# Getting and Cleaning Data
The present directory contains the solutions for the project on cleaning-and-getting-data 05.

## Course Project 

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Project setup
1. Download the ```UCI HAR Dataset``` and extract it under the directory ```data```. The ```run_analysis.R``` script assumes all the relevant data is placed in this directory.
2. Place the  ```run_analysis.R``` script in the parent directory of the ```data``` directory and set it as your working directory using ```setwd()```.
3. Use ```source("run_analysis.R")``` to run the script. The tidy dataset is going to be automatically stored as ```tidydata.txt``` file in the ```data``` directory.
