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

##Plot line graph
with(data, plot(datetime, Global_active_power, type = "l", 
                ylab = "Global Active Power (killowatts)", xlab = ""))

##Copy plot to png
dev.copy(png, file = "plot2.png", width = 480, height = 480)