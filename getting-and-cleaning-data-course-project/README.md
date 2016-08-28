###Steps in run_analysis.R
1. Read features data file into a data frame
2. Read activity labels data into a data frame

#### Perform step 1 through 7 first for train data and then for test data.
1. Read X_train data. Assign column names to x_train data from features
2. Read subject_train data. Assign column names to subject_train data
3. Read y_train(activity) data. Merge y_train data with activity_labels data. Assign column names to merged data.
4. Remove columns with duplicate namesi from x_trains data. This is needed as dplyr SELECT functions gives ERROR with duplicate columns
5. Select columns with names containing "mean" or "std" from x_trains data. Filter data upfront.
6. Attach subject data to x_trains data.
7. Attach activity data to x_trains data.

####Merge test and train datasets and write to a text file
1. Merge train and test data
2. Create a second, independent tidy data set with the average of each variable for each activity and each subject.
3. Write the independent tidy data set to a text file named as "tidy-data-set.txt"
