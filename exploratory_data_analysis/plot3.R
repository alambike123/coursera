##Read Data
data <- read.table(file = "household_power_consumption.txt", 
                   sep = ";", 
                   skip = 66637,
                   nrows = 2880,
                   col.names = c("Date", "Time", "Global_active_power",
                                 "Global_reactive_power", "Voltage", "Global_intensity",
                                 "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Create datetime field
data$datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

#Set as png
png(filename = "plot3.png", width = 480, height = 480)

##Plot line graph
with(data, plot(datetime, Sub_metering_1, type = "l", 
                ylab = "Energy sub metering", xlab = ""))
with(data, points(datetime, Sub_metering_2, type = "l", col = "Red"))
with(data, points(datetime, Sub_metering_3, type = "l", col = "Blue"))

##Create legend
legend("topright", legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       pch = '-', col = c("Black", "Red", "Blue"))

dev.off()