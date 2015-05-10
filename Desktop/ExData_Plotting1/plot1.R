file<-"~/household_power_consumption.txt"
dataSet<-read.table(file, skip=66637, nrows=2880, sep=";", col.names=c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
library("lubridate")
dataSet$Date<-dmy(dataSet$Date)
dataSet$Time<-hms(dataSet$Time)
png("plot1.png")
with(dataSet, hist(dataSet$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
