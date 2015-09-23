library(plyr)

# Set working directory
setwd("~/Documents/Github/GettingAndCleaningData")
pathScript = getwd()

# Let Data directory
pathData <- file.path(pathScript, "UCI HAR Dataset")

# Download and unzip the dataset
fileName <- "UCI HAR Dataset.zip"
if (!file.exists(fileName)){
    fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileURL, fileName, method="curl")
}  
if (!file.exists("UCI HAR Dataset")) { 
    unzip(fileName) 
}

# Load train data and assign to dtSubject and dtActivity
dtSubjectTrain <- read.table(file.path(pathData, "train", "subject_train.txt"))
dtActivityTrain <- read.table(file.path(pathData, "train", "Y_train.txt"))
dtTrain <- read.table(file.path(pathData, "train", "X_train.txt"))

# Load test data and assign to dtSubject and dtActivity
dtSubjectTest <- read.table(file.path(pathData, "test", "subject_test.txt"))
dtActivityTest <- read.table(file.path(pathData, "test", "Y_test.txt"))
dtTest <- read.table(file.path(pathData, "test", "X_test.txt"))

# Load activity labels
dtActivityLabels <- read.table(file.path(pathData, "activity_labels.txt"))
dtActivityLabels[,2] <- as.character(dtActivityLabels[,2])

# Load features
dtFeatures <- read.table(file.path(pathData, "features.txt"))
# Extract only mean and standard deviation features
dtFeaturesMeanSd <- grep("mean\\(\\)|std\\(\\)", dtFeatures[,2])
# Polish names
dtFeaturesMeanSd.names <- dtFeatures[dtFeaturesMeanSd,2]
dtFeaturesMeanSd.names = gsub('^t', 'Time', dtFeaturesMeanSd.names)
dtFeaturesMeanSd.names = gsub('^f', 'Freq', dtFeaturesMeanSd.names)
dtFeaturesMeanSd.names = gsub('-mean', 'Mean', dtFeaturesMeanSd.names)
dtFeaturesMeanSd.names = gsub('-std', 'Sd', dtFeaturesMeanSd.names)
dtFeaturesMeanSd.names <- gsub('[-()]', '', dtFeaturesMeanSd.names)

# Binding columns. Only mean() and sd() data columns.
dtTrain <- dtTrain[dtFeaturesMeanSd]
dtTrain <- cbind(dtSubjectTrain, dtActivityTrain, dtTrain)
dtTest = dtTest[dtFeaturesMeanSd]
dtTest <- cbind(dtSubjectTest, dtActivityTest, dtTest)

# Create dataset as row binding of training and test
dtTidy <- rbind(dtTrain, dtTest)
# Column names
colnames(dtTidy) <- c("subject", "activity", dtFeaturesMeanSd.names)
# Replace idActivity with Activity description
dtTidy$activity <- factor(dtTidy$activity, levels = dtActivityLabels[,1], labels = dtActivityLabels[,2])
# Subject column as factor
dtTidy$subject <- as.factor(dtTidy$subject)

# Remove unusued variables
rm(dtSubjectTrain, dtActivityTrain, dtTrain)
rm(dtSubjectTest, dtActivityTest, dtTest)
rm(dtActivityLabels, dtFeatures, dtFeaturesMeanSd, dtFeaturesMeanSd.names )

# Column means grouped by subject and activity columns
dtTidyMeans <- ddply(dtTidy, .(subject, activity), function (x) colMeans(x[,-c(1,2)]))
names(dtTidyMeans)[-c(1,2)] <- paste0("Mean", names(dtTidyMeans)[-c(1,2)])

# Write file
write.table(dtTidyMeans, "AverageDataset.txt", row.names = FALSE)
