library(data.table)

setwd("H:\\training\\Exploratory Analysis")

#Open Data
data <- read.table("H:\\training\\Exploratory Analysis\\exdata_data_household_power_consumption\\household_power_consumption.txt", sep=";", header=TRUE)
#Fix date/time variables
data$Time <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y") 
#subset to daterange
data <- data[data$Date>="2007-02-01" & data$Date<="2007-02-02",]

#plot3

png(filename = "plot3.png", width=480, height=480)
with(data, {
	 plot(Time, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=" ")
	lines(Time, Sub_metering_2, col="red", xlab=NULL)
	lines(Time, Sub_metering_3, col="blue", xlab=NULL)
	})
legend("topright", lty=c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()