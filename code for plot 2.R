## Set working directory to where the data is stored
setwd("~/coursera")

##Unzip folder
dataset <- unzip("exdata_data_household_power_consumption.zip")

##Read in the file
dataset <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows=2075259, 
                    check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

##Subset the dates wanted
dates <- subset(dataset, Date %in% c("1/2/2007", "2/2/2007"))

##Change time and date column class
dates2 <- as.Date(dates$Date, format="%d/%m/%Y")
date_time <- paste(as.Date(dates2), dates$Time)
dates$datetime <- as.POSIXct(date_time)

##Change margin size and make plot
par("mar" = c(4, 4, 2, 2))
with(dates, {plot(Global_active_power~datetime, type = "l", ylab = "Global Active Power (kilowatts)")})

##Make png file
dev.copy(png, file = "plot2.png", width=480, height=480)
dev.off()