# nrows below is 48 hours x 60 min = 2880
data0102 <-read.table("household_power_consumption.txt", header = FALSE,sep=";", skip=grep("31/1/2007;23:59:00", readLines("household_power_consumption.txt")), na.strings = "?", nrows = 2880)

namesData <- names(read.table("household_power_consumption.txt", header = TRUE,sep=";", nrows = 1))
names(data0102) <- namesData

hist(data0102$Global_active_power, col="red", xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power') 
dev.copy(png, file = "plot1.png",  width = 480, height = 480) 
dev.off() 

