# Please note that household_power_consumption.txt should be in working directory
# If not please download it from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# And unpack to working directory

Sys.setlocale("LC_TIME","English")
par(mfrow = c(1,1),mar = c(4,4,2,1), oma = c(0,0,2,0))
png(file="plot1.png",width=480,height=480)

filePath <- "household_power_consumption.txt"
tabAll <- read.csv(filePath, sep = ";", header = TRUE, na.strings = "?", comment.char = "")
date1 <- tabAll$Date == "1/2/2007"
date2 <- tabAll$Date == "2/2/2007"
date <- date1 | date2
tabAll<- tabAll[date,]

hist(tabAll$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.off()