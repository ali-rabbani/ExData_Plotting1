library(dplyr)


alldata <- read.table(file = "household_power_consumption.txt", header = T, na.strings = "?", sep = ";", stringsAsFactors = F)
data <- alldata[alldata$Date %in% c('2/2/2007', '1/2/2007'), ]
data$datetime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

png(file = "plot2.png")

with(data, plot(datetime, Global_active_power, type = 'line',xlab = NA, ylab = 'Global Active Power (kilowatts)'))

dev.off()