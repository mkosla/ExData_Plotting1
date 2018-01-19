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


#plot2

png(filename = "plot2.png", width=480, height=480)
with(data, plot(Time, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=" "))

dev.off()