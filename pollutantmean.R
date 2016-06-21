###Week#2 Quiz- Part 1###########
pollutantmean <- function(directory, pollutant, id = 1:332) {
    setwd(directory)
    file_list <- list.files()
    dataset <- head(read.csv(file_list[1], header = TRUE, sep = ","), n = 0)
    for (x in file_list){
        dataset <- rbind(dataset, read.csv(x, header = TRUE, sep = ","))
    }
    filtered_data <- subset(dataset, ID %in% c(id))
    mean(filtered_data[, pollutant], na.rm = TRUE)
}

######Test Cases
##pollutantmean("specdata", "sulfate", 1:10)
## [1] 4.064

##pollutantmean("specdata", "nitrate", 70:72)
## [1] 1.706

##pollutantmean("specdata", "nitrate", 23)
## [1] 1.281