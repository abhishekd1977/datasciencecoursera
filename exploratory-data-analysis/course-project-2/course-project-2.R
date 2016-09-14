## Read file
library(dplyr)
library(ggplot2)
setwd("/Users/abhishekdubey/abhishek-git-repos/datasciencecoursera/exploratory-data-analysis/course-project-2")
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## 1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
pm25summary <- select(NEI, year, Emissions) %>% group_by(year) %>% summarize(EmissionsSum = sum(Emissions))
plot(pm25summary$year, pm25summary$EmissionsSum, type = "l", lwd = 2, xlab = "Year", ylab = "Total Emissions Across All Sources")
dev.copy(png, file = "plot1.png")
dev.off()

## 2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
## Use the base plotting system to make a plot answering this question.
pm25Baltimore <- filter(NEI, fips == "24510") %>% select(year, Emissions) %>% group_by(year) %>% summarize(EmissionsSum = sum(Emissions))
plot(pm25Baltimore$year, pm25Baltimore$EmissionsSum, type = "l", lwd = 2, xlab = "Year", ylab = "Total Emissions Across All Sources for Baltimore City")
dev.copy(png, file = "plot2.png")
dev.off()

## 3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
## which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
## Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.
pm25SumBySources <- select(NEI, year, Emissions, type) %>% group_by(year, type) %>% summarize(EmissionsSum = sum(Emissions))
g <- ggplot(pm25SumBySources, aes(year, EmissionsSum, colour = as.factor(type)))
g + geom_point() + geom_smooth(method="lm", se=FALSE, col="steelblue") + facet_grid(. ~ type)
dev.copy(png, file = "plot3.png")
dev.off()

## 4. Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
sectorData <- filter(SCC, EI.Sector %in% c("Fuel Comb - Electric Generation - Coal", 
                                           "Fuel Comb - Comm/Institutional - Coal", 
                                           "Fuel Comb - Industrial Boilers, ICEs - Coal")) %>% select(SCC, EI.Sector)
pm25summary <- merge(NEI, sectorData, by.x = "SCC", by.y = "SCC") %>% select(year, Emissions, EI.Sector) %>%
                group_by(year, EI.Sector) %>% summarize(EmissionsSum = sum(Emissions))
g <- ggplot(pm25summary, aes(year, EmissionsSum, colour = as.factor(EI.Sector)))
g + geom_point() + geom_line(aes(group = EI.Sector))
dev.copy(png, file = "plot4.png")
dev.off()

## 5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
sectorDataVehicles <- filter(SCC, EI.Sector %in% c("Mobile - On-Road Gasoline Heavy Duty Vehicles", 
                                                   "Mobile - On-Road Diesel Light Duty Vehicles", 
                                                   "Mobile - On-Road Gasoline Light Duty Vehicles", 
                                                   "Mobile - On-Road Diesel Heavy Duty Vehicles")) %>% select(SCC, EI.Sector)
pm25summary <- merge(NEI, sectorDataVehicles, by.x = "SCC", by.y = "SCC") %>% select(year, Emissions, EI.Sector) %>%
                group_by(year, EI.Sector) %>% summarize(EmissionsSum = sum(Emissions))
g <- ggplot(pm25summary, aes(year, EmissionsSum, colour = as.factor(EI.Sector)))
g + geom_point() + geom_line(aes(group = EI.Sector))
dev.copy(png, file = "plot5.png")
dev.off()

## 6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in 
## Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?
sectorDataVehicles <- filter(SCC, EI.Sector %in% c("Mobile - On-Road Gasoline Heavy Duty Vehicles", 
                                                   "Mobile - On-Road Diesel Light Duty Vehicles", 
                                                   "Mobile - On-Road Gasoline Light Duty Vehicles", 
                                                   "Mobile - On-Road Diesel Heavy Duty Vehicles")) %>% select(SCC, EI.Sector)
pm25summary <- merge(NEI, sectorDataVehicles, by.x = "SCC", by.y = "SCC") %>% 
                filter(fips == "24510" | fips == "06037") %>%
                select(year, Emissions, EI.Sector, fips) %>%
                group_by(year, EI.Sector, fips) %>% summarize(EmissionsSum = sum(Emissions))
g <- ggplot(pm25summary, aes(year, EmissionsSum, colour = as.factor(fips, EI.Sector)))
g + geom_point() + geom_line(aes(group = c("fips", "EI.Sector")))
dev.copy(png, file = "plot5.png")
dev.off()




