#########
library(dplyr)
setwd("/Users/abhishekdubey/abhishek-git-repos/datasciencecoursera/UCI_HAR_Dataset")
##Read features data
features <- read.table(file = "features.txt", header = FALSE, stringsAsFactors = FALSE)
##Read activity labels data
activity_labels <- read.table(file = "activity_labels.txt", header = FALSE, stringsAsFactors = FALSE)

setwd("/Users/abhishekdubey/abhishek-git-repos/datasciencecoursera/UCI_HAR_Dataset/train")
##Read X_train data. Assign column names to x_train data from features
x_train <- read.table(file = "X_train.txt", header = FALSE, stringsAsFactors = FALSE)
colnames(x_train) <- features[,2]

##Read subject_train data. Assign column names to subject_train data
subject_train <- read.table(file = "subject_train.txt", header = FALSE, stringsAsFactors = FALSE)
colnames(subject_train) <- c("subject")

##Read y_train(activity) data. Merge y_train data with activity_labels data. Assign column names to merged data.
y_train <- read.table(file = "y_train.txt", header = FALSE, stringsAsFactors = FALSE)
y_train <- merge(y_train, activity_labels, by.x = "V1", by.y = "V1")
colnames(y_train) <- c("activity_id", "activity_name")

##Remove columns with duplicate names. This is needed as dplyr SELECT functions gives ERROR with duplicate columns
x_train <- x_train[ !duplicated(names(x_train))]

##Select columns with names containing test "mean" or "std". Filter data upfront.
##Attach subject data
##Attach activity data
##Attach a new column data_type with value="train" for all rows.
x_train <- x_train %>% 
    select(matches("std|mean")) %>% 
    cbind(subject_train) %>% 
    cbind(activity_name = y_train$activity_name) %>%
    cbind(data_type = c("train"))
