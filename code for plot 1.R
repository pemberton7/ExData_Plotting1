##Set working directory to where data is stored
setwd("~/coursera")

##Unzip folder
dataset <- unzip("exdata_data_household_power_consumption.zip")

## Reading in file for data 
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "NA")

##subset by date
dates <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

##Change to numeric
data3 <- as.numeric(paste(dates$Global_active_power))

##Create histogram
hist(data3, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

##Put into png file
dev.copy(png, file = "plot1.png", width=480, height=480)
dev.off()

