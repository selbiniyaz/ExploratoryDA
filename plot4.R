data0102 <-read.table("household_power_consumption.txt", header = FALSE,sep=";", skip=grep("31/1/2007;23:59:00", readLines("household_power_consumption.txt")), na.strings = "?", nrows = 2880)
namesData <- names(read.table("household_power_consumption.txt", header = TRUE,sep=";", nrows = 1))
names(data0102) <- namesData

png(filename="plot4.png")
par(mfcol=c(2, 2))   

Sys.setlocale("LC_TIME", "English")
x <- paste(data0102$Date, data0102$Time)
x <- strptime(x, "%d/%m/%Y %H:%M:%S")

plot(x = x, y = data0102$Global_active_power, type ="l", xlab ="", ylab ="Global Active Power (kilowatts)")

plot(x=x, data0102$Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering")
lines(x=x, data0102$Sub_metering_2, col='red')
lines(x=x, data0102$Sub_metering_3, col='blue')
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),bty="n")

plot(x=x, data0102$Voltage, xlab='datetime', ylab='Voltage', type = "l")

plot(x=x, data0102$Global_reactive_power, type = "l", xlab='datetime', ylab='Global_reactive_power')

dev.off() 

