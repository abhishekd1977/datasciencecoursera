library(dplyr)
setwd("/Users/abhishekdubey/abhishek-git-repos/datasciencecoursera/exploratory-data-analysis")
mydata <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, na.strings = "?") %>% 
            filter(Date %in% c("1/2/2007", "2/2/2007"))
datetime = strptime(with(mydata, paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
mydata$datetime <- datetime
hist(mydata$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
