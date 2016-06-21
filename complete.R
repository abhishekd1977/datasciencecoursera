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
    data.frame(table(complete_data$ID))
}