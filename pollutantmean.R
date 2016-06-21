###Week#2 Quiz- Part 1###########
pollutantmean <- function(directory, pollutant, id1 = 1:332) {
    setwd(directory)
    file_list <- list.files()
    dataset <- head(read.csv(file_list[1], header = TRUE, sep = ","), n = 0)
    for (x in file_list){
        dataset <- rbind(dataset, read.csv(x, header = TRUE, sep = ","))
    }
    filtered_data <- subset(dataset, ID %in% c(id1))
    mean(filtered_data[, pollutant], na.rm = TRUE)
}