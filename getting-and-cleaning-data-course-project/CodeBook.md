###Course Project Codebook
####Raw Data and the Program Objective
1. The raw data has been provided in 3 different files- A. The main data with observations. B. The subject data C. The activity data(Only Codes).
2. The activity data needs to be enriched with the activity names, before it can be attached to main file. 
3. The 3 files listed above need to be converted to one single file for each of test and train datasets.
4. Once we have one file each for test and train data, then these need to be merged to a single file.

####Tidy data set
1. The tidy dataset has total 88 columns- 86 columns are the observations, one column is subject and one column is activity.
2. I have purposefully filtered the "std" and "mean" columns first (For both test and train datasets), before merging test and train datasets. This is done so that we remove the overhead of unnecessary columns while calling rbind function on 2 datasets.
3. Dimension of final data in file "tidy-data-set.txt" is: (40, 88).
4. The overall code schema and steps have been elaborated in file README.md.
 
