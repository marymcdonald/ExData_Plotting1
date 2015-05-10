file<-"~/household_power_consumption.txt"
dataSet<-read.table(file, skip=66637, nrows=2880, sep=";", col.names=c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

library("lubridate")
dataSet["Date_time"]<-"NA"
dataSet["Date_time"]<-paste(dataSet$Date, dataSet$Time)
dataSet$Date_time<-dmy_hms(dataSet$Date_time)

png("plot2.png")
with(dataSet, plot(dataSet$Date_time, dataSet$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)") )
dev.off()