library(dplyr)
setwd("/Users/abhishekdubey/abhishek-git-repos/datasciencecoursera/exploratory-data-analysis")
mydata <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, na.strings = "?") %>% 
            filter(Date %in% c("1/2/2007", "2/2/2007"))
datetime = strptime(with(mydata, paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
mydata$datetime <- datetime

par(mfrow = c(2, 2), mar = c(5, 4, 2, 1))
plot(mydata$datetime, mydata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

plot(mydata$datetime, mydata$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(mydata$datetime, mydata$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(mydata$datetime, mydata$Sub_metering_2, type = "l", col = "red")
points(mydata$datetime, mydata$Sub_metering_3, type = "l", col = "blue")
legend("top", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, bty = "n", cex = 0.8)

plot(mydata$datetime, mydata$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png, file = "plot4.png")
dev.off()