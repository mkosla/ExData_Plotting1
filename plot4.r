library(data.table)

setwd("H:\\training\\Exploratory Analysis")

#Open Data
data <- read.table("H:\\training\\Exploratory Analysis\\exdata_data_household_power_consumption\\household_power_consumption.txt", sep=";", header=TRUE)
#Fix date/time variables
data$Time <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y") 
#subset to daterange
data <- data[data$Date>="2007-02-01" & data$Date<="2007-02-02",]

data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Voltage <- as.numeric(as.character(data$Voltage))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))


#Plot4

png(filename = "plot4.png", width=480, height=480)
par(mfrow = c(2,2))
with(data, {
	plot(Time, Global_active_power, type="l", ylab="Global Active Power", yaxt='n', xlab="")
	plot(Time, Voltage, type="l", ylab="Voltage",  xlab="datetime")
	plot(Time, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", yaxt='n')
		axis(side = 2, at = c(0,10,20,30))
		lines(Time, Sub_metering_2, col="red", xlab=NULL)

		lines(Time, Sub_metering_3, col="blue", xlab=NULL)
		legend("topright", lty=c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty='n')

	plot(Time, Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
	

	})



dev.off()
