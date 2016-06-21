###Week#2 Quiz- Part 2###########
complete <- function(directory, id = 1:332){
    setwd(directory)
    file_list <- list.files()
    dataset <- head(read.csv(file_list[1], header = TRUE, sep = ","), n = 0)
    for (x in file_list){
        dataset <- rbind(dataset, read.csv(x, header = TRUE, sep = ","))
    }
    filtered_data <- subset(dataset, ID %in% c(id))
    complete_data = filtered_data[complete.cases(filtered_data), ]
    complete_data_df <- data.frame(table(complete_data$ID))
    colnames(complete_data_df) <- c("id", "nobs")
    complete_data_df
}

#######Test Cases
#> complete("/Users/abhishekdubey/abhishek-git-repos/datasciencecoursera/specdata",1)
#id nobs
#1  1  117

##This test case did not pass. The expected output should be ordered as 30, 29....25
#> complete("/Users/abhishekdubey/abhishek-git-repos/datasciencecoursera/specdata",30:25)
#id nobs
#1 25  463
#2 26  586
#3 27  338
#4 28  475
#5 29  711
#6 30  932
