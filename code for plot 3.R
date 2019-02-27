## Set working directory to where the data is stored
setwd("~/coursera")

## Reading in file for data 
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

##subset by date
dates <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

##Changing date and time variables and merging into the dataset
dates$Date <- as.Date(dates$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(dates$Date), dates$Time)
dates$Datetime <- as.POSIXct(datetime)

##Make the graph
with(dates, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub meeting", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") , col = c("black", "red", "blue"), lty = 1, 
       lwd = 1, cex = 0.80, pt.cex = cex)

##Put into png file
dev.copy(png, file = "plot3.png", width=480, height=480)
dev.off()