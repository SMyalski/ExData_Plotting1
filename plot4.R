# Please note that household_power_consumption.txt should be in working directory
# If not please download it from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# And unpack to working directory

Sys.setlocale("LC_TIME","English")
par(mfrow = c(2,2),mar = c(4,4,2,1), oma = c(0,0,2,0))
png(file="plot4.png",width=480,height=480)

filePath <- "household_power_consumption.txt"
tabAll <- read.csv(filePath , sep = ";", header = TRUE, na.strings = "?", comment.char = "")
date1 <- tabAll$Date == "1/2/2007"
date2 <- tabAll$Date == "2/2/2007"
date <- date1 | date2
tabAll<- tabAll[date,]

tabAll$Date <- paste(tabAll$Date, tabAll$Time, sep = " ")
tabAll$Date <- strptime(tabAll$Date, format = "%d/%m/%Y %H:%M:%S")
par(mfrow = c(2,2),mar = c(4,4,2,1), oma = c(0,0,2,0))
with(tabAll, {
plot(Date, Global_active_power, type = "l", main = "", xlab = "", ylab = "Global Active Power (kilowatts)")
plot(Date, Voltage, type = "l", main = "", xlab = "datetime", ylab = "Voltage")
plot(Date, Sub_metering_1, type = "l", main = "", xlab = "", ylab = "Energy sub metering")
lines(Date, Sub_metering_2, col="red")
lines(Date, Sub_metering_3, col="blue")
legend("topright",lty=c(1,1,1),lwd=c(1.5,1.5,1.5),col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), box.lwd=FALSE,box.col="transparent",bg="transparent")
plot(Date, Global_reactive_power, type = "l", main = "", xlab = "datetime", ylab = "Global_reactive_power")
})
dev.off()