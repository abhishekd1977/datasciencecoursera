###Steps in run_analysis.R
1. Read features data file into a data frame
2. Read activity labels data into a data frame

#### Perform step 3 through 9 first for train data and then for test data.
3. Read X_train data. Assign column names to x_train data from features
4. Read subject_train data. Assign column names to subject_train data
5. Read y_train(activity) data. Merge y_train data with activity_labels data. Assign column names to merged data.
6. Remove columns with duplicate namesi from x_trains data. This is needed as dplyr SELECT functions gives ERROR with duplicate columns
7. Select columns with names containing "mean" or "std" from x_trains data. Filter data upfront.
8. Attach subject data to x_trains data.
9. Attach activity data to x_trains data.

#### Perform step 3 through 9 first for train data and then for test data. 
10. Merge train and test data
11. Create a second, independent tidy data set with the average of each variable for each activity and each subject.
12. Write the independent tidy data set to a text file named as "tidy-data-set.txt"
