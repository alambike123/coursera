##1) Load necessary packages
library(plyr)
library(reshape2)

##2) Download data
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "C:/Users/Alan/Desktop/RWD/download.zip")

##3) Read in relevant data
features <- read.table("C:/Users/Alan/Desktop/RWD/UCI HAR Dataset/features.txt")
test_set <- read.table("C:/Users/Alan/Desktop/RWD/UCI HAR Dataset/test/X_test.txt")
test_labels <- read.table("C:/Users/Alan/Desktop/RWD/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("C:/Users/Alan/Desktop/RWD/UCI HAR Dataset/test/subject_test.txt")
train_set <- read.table("C:/Users/Alan/Desktop/RWD/UCI HAR Dataset/train/X_train.txt")
train_labels <- read.table("C:/Users/Alan/Desktop/RWD/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("C:/Users/Alan/Desktop/RWD/UCI HAR Dataset/train/subject_train.txt")
activity_labels <- read.table("C:/Users/Alan/Desktop/RWD/UCI HAR Dataset/activity_labels.txt")

##4) Transform features to vector
features.vector <- as.vector(features[[2]])

##5) Bind features, train, and test
untidy <- rbind(features.vector, train_set, test_set)

##6) Assign top row as header
colnames(untidy) = untidy[1, ]
untidy <- untidy[-1, ]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         

##7) Remove non-mean and non-std columns
temp1 <- untidy[, grep("mean", colnames(untidy))]
temp1 <- temp1[, -grep("meanFreq", colnames(temp1))]
temp2 <- untidy[, grep("std", colnames(untidy))]

##8) Create Subject and Activity variables
temp3 <- rbind(subject_train, subject_test)
colnames(temp3) = "Subject"
temp4 <- rbind(train_labels, test_labels)
colnames(temp4) = "Activity_ID"

##9) Bind columns to create untidy table
untidy <- cbind(temp3, temp4, temp1, temp2)

##10) Reclassify fields as numeric
for (i in c(1:ncol(untidy))){
        untidy[,i] <- as.numeric(as.character(untidy[,i]))
}

##11) Create second 'tidy' dataset containing average per variable
tidy <- melt(untidy, id = c("Subject", "Activity_ID"))
tidy <- dcast(tidy, Subject + Activity_ID ~ variable, fun.aggregate = mean, na.rm = FALSE)
tidy <- tidy[order(tidy$Subject, tidy$Activity_ID),]

##12) Merge on Activity_ID to add Activity
colnames(activity_labels) = c("Activity_ID", "Activity")
tidy <- merge(tidy, activity_labels, by = c("Activity_ID"))
tidy <- tidy[order(tidy$Subject, tidy$Activity_ID, tidy$Activity),]
tidy$Activity_ID <- NULL

##13) Rename variable names for improved descriptiveness
colnames(tidy) = c(
        "Subject",
        "Activity",
        "Body.Acceleration.Mean.X",
        "Body.Acceleration.Mean.Y",
        "Body.Acceleration.Mean.Z",
        "Gravity.Acceleration.Mean.X",
        "Gravity.Acceleration.Mean.Y",
        "Gravity.Acceleration.Mean.Z",
        "Body.Acceleration.Jerk.Mean.X",
        "Body.Acceleration.Jerk.Mean.Y",
        "Body.Acceleration.Jerk.Mean.Z",
        "Body.Gyroscopic.Mean.X",
        "Body.Gyroscopic.Mean.Y",
        "Body.Gyroscopic.Mean.Z",
        "Body.Gyroscopic.Jerk.Mean.X",
        "Body.Gyroscopic.Jerk.Mean.Y",
        "Body.Gyroscopic.Jerk.Mean.Z",
        "Body.Acceleration.Magnitude.Mean",
        "Gravity.Acceleration.Magnitude.Mean",
        "Body.Acceleration.Jerk.Magnitude.Mean",
        "Body.Gyroscopic.Magnitude.Mean",
        "Body.Gyroscopic.Jerk.Magnitude.Mean",
        "Frequency.Body.Acceleration.Mean.X",
        "Frequency.Body.Acceleration.Mean.Y",
        "Frequency.Body.Acceleration.Mean.Z",
        "Frequency.Body.Acceleration.Jerk.Mean.X",
        "Frequency.Body.Acceleration.Jerk.Mean.Y",
        "Frequency.Body.Acceleration.Jerk.Mean.Z",
        "Frequency.Body.Gyroscopic.Mean.X",
        "Frequency.Body.Gyroscopic.Mean.Y",
        "Frequency.Body.Gyroscopic.Mean.Z",
        "Frequency.Body.Acceleration.Magnitude.Mean",
        "Frequency.Body.Acceleration.Jerk.Magnitude.Mean",
        "Frequency.Body.Gyroscopic.Magnitude.Mean",
        "Frequency.Body.Gyroscopic.Jerk.Magnitude.Mean",
        "Body.Acceleration.StandardDev.X",
        "Body.Acceleration.StandardDev.Y",
        "Body.Acceleration.StandardDev.Z",
        "Gravity.Acceleration.StandardDev.X",
        "Gravity.Acceleration.StandardDev.Y",
        "Gravity.Acceleration.StandardDev.Z",
        "Body.Acceleration.Jerk.StandardDev.X",
        "Body.Acceleration.Jerk.StandardDev.Y",
        "Body.Acceleration.Jerk.StandardDev.Z",
        "Body.Gyroscopic.StandardDev.X",
        "Body.Gyroscopic.StandardDev.Y",
        "Body.Gyroscopic.StandardDev.Z",
        "Body.Gyroscopic.Jerk.StandardDev.X",
        "Body.Gyroscopic.Jerk.StandardDev.Y",
        "Body.Gyroscopic.Jerk.StandardDev.Z",
        "Body.Acceleration.Magnitude.StandardDev",
        "Gravity.Acceleration.Magnitude.StandardDev",
        "Body.Acceleration.Jerk.Magnitude.StandardDev",
        "Body.Gyroscopic.Magnitude.StandardDev",
        "Body.Gyroscopic.Jerk.Magnitude.StandardDev",
        "Frequency.Body.Acceleration.StandardDev.X",
        "Frequency.Body.Acceleration.StandardDev.Y",
        "Frequency.Body.Acceleration.StandardDev.Z",
        "Frequency.Body.Acceleration.Jerk.StandardDev.X",
        "Frequency.Body.Acceleration.Jerk.StandardDev.Y",
        "Frequency.Body.Acceleration.Jerk.StandardDev.Z",
        "Frequency.Body.Gyroscopic.StandardDev.X",
        "Frequency.Body.Gyroscopic.StandardDev.Y",
        "Frequency.Body.Gyroscopic.StandardDev.Z",
        "Frequency.Body.Acceleration.Magnitude.StandardDev",
        "Frequency.Body.Acceleration.Jerk.Magnitude.StandardDev",
        "Frequency.Body.Gyroscopic.Magnitude.StandardDev",
        "Frequency.Body.Gyroscopic.Jerk.Magnitude.StandardDev"
        )

##14) Write 'tidy' dataset to working directory as txt file
write.table(tidy, file = "C:/Users/alant/Desktop/RWD/tidy.txt", sep = "\t")

