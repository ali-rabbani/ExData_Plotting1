library(dplyr)


alldata <- read.table(file = "household_power_consumption.txt", header = T, na.strings = "?", sep = ";", stringsAsFactors = F)
data <- alldata[alldata$Date %in% c('2/2/2007', '1/2/2007'), ]
data$datetime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

png(file = "plot1.png")

with(data, hist(Global_active_power, col = 'red', xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power'))

dev.off()

