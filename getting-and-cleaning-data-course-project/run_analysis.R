#########
library(dplyr)
setwd("/Users/abhishekdubey/abhishek-git-repos/datasciencecoursera/UCI_HAR_Dataset")
features <- read.table(file = "features.txt", header = FALSE, stringsAsFactors = FALSE)
activity_labels <- read.table(file = "activity_labels.txt", header = FALSE, stringsAsFactors = FALSE)
setwd("/Users/abhishekdubey/abhishek-git-repos/datasciencecoursera/UCI_HAR_Dataset/train")
x_train <- read.table(file = "X_train.txt", header = FALSE, stringsAsFactors = FALSE)
colnames(x_train) <- features[,2]
subject_train <- read.table(file = "subject_train.txt", header = FALSE, stringsAsFactors = FALSE)
colnames(subject_train) <- c("subject")
x_train <- cbind(x_train, subject_train)

y_train <- read.table(file = "y_train.txt", header = FALSE, stringsAsFactors = FALSE)
y_train <- merge(y_train, activity_labels, by.x = "V1", by.y = "V1")
colnames(y_train) <- c("activity_id", "activity_name")
x_train <- cbind(x_train, activity_name = y_train$activity_name)

##Do these steps after test and train data has been merged
#colnames(x_train) <- features[,2]
##Remove columns with duplicate names
#x_train <- x_train[ !duplicated(names(x_train))]
#x_train <- select(x_train, matches("std|mean"))