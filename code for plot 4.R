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

##Set parameter limits 
par(mfrow = c(2,2))

##Plot graph 1
par("mar" = c(4, 4, 2, 2))
with(dates, {plot(Global_active_power~datetime, type = "l", ylab = "Global Active Power")})

##Plot graph 2
with(dates, {plot(Voltage~datetime, type = "l", ylab = "Voltage", xlab = "datetime")})

##Plot graph 3, specify size of the legend that is doesn't cover the graph
with(dates, {
  plot(Sub_metering_1~datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
})
legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") , col = c("black", "red", "blue"), lty = 1, 
       lwd = 1, bty = "n", cex = 0.9, pt.cex = cex)

##Plot graph 4
with(dates, {plot(Global_reactive_power~datetime, type = "l", xlab = "datetime", ylab = "Global_reactive_power")})

##Make into a png file
dev.copy(png, file = "plot4.png", width=480, height=480)
dev.off()
