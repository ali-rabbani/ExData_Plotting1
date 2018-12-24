library(dplyr)


alldata <- read.table(file = "household_power_consumption.txt", header = T, na.strings = "?", sep = ";", stringsAsFactors = F)
data <- alldata[alldata$Date %in% c('2/2/2007', '1/2/2007'), ]
data$datetime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

png(file = "plot3.png")

with(data, plot(datetime, Sub_metering_1, xlab = NA, ylab = "Energy sub metering", type = 'line', col = 'black'))
with(data, lines(datetime, Sub_metering_2, col = 'red'))
with(data, lines(datetime, Sub_metering_3, col = 'blue'))
legend("topright", col = c('black', 'red', 'blue'), lty = 1, legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

dev.off()
