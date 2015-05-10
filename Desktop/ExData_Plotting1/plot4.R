file<-"~/Desktop/Coursera/household_power_consumption.txt"
dataSet<-read.table(file, skip=66637, nrows=2880, sep=";", col.names=c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
library("lubridate")
dataSet["Date_time"]<-"NA"
dataSet["Date_time"]<-paste(dataSet$Date, dataSet$Time)
dataSet$Date_time<-dmy_hms(dataSet$Date_time)

dataSet["Energy_submetering"]<-"NA"
dataSet["Energy_submetering"]<-mapply(max,dataSet$Sub_metering_1, dataSet$Sub_metering_2, dataSet$Sub_metering_3)

png("plot4.png")
par(mfcol=c(2,2))
with(dataSet, {
  #plot 1
  plot(dataSet$Date_time, dataSet$Global_active_power, type=“l”, xlab=“”, ylab=“Global Active Power”)
  
  #plot 2
  plot(dataSet$Date_time, dataSet$Energy_submetering, type="n", xlab="", ylab="Energy sub metering")
  lines(dataSet$Date_time, dataSet$Sub_metering_1, col="black")
  lines(dataSet$Date_time, dataSet$Sub_metering_2, col="red")
  lines(dataSet$Date_time, dataSet$Sub_metering_3, col="blue")
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
  
  #plot 3
  plot(dataSet$Date_time, dataSet$Voltage, type="l", xlab="datetime", ylab="Voltage")
  
  #plot 4
  plot(dataSet$Date_time, dataSet$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power") 
})

dev.off()