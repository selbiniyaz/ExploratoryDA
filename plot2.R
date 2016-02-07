data0102 <-read.table("household_power_consumption.txt", header = FALSE,sep=";", skip=grep("31/1/2007;23:59:00", readLines("household_power_consumption.txt")), na.strings = "?", nrows = 2880)
namesData <- names(read.table("household_power_consumption.txt", header = TRUE,sep=";", nrows = 1))
names(data0102) <- namesData

Sys.setlocale("LC_TIME", "English")
x <- paste(data0102$Date, data0102$Time)
x <- strptime(x, "%d/%m/%Y %H:%M:%S")
plot(x = x, y = data0102$Global_active_power, type ="l", xlab ="", ylab ="Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png",  width = 480, height = 480) 
dev.off() 

