library(dplyr)
setwd("/Users/abhishekdubey/abhishek-git-repos/datasciencecoursera/exploratory-data-analysis")
mydata <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, na.strings = "?") %>% 
            filter(Date %in% c("1/2/2007", "2/2/2007"))
datetime = strptime(with(mydata, paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
mydata$datetime <- datetime
plot(mydata$datetime, mydata$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(mydata$datetime, mydata$Sub_metering_2, type = "l", col = "red")
points(mydata$datetime, mydata$Sub_metering_3, type = "l", col = "blue")
legend("top", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, bty = "n", cex = 0.8)
dev.copy(png, file = "plot3.png")
dev.off()