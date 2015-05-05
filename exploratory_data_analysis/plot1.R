##Read Data
data <- read.table(file = "household_power_consumption.txt", 
                  sep = ";", 
                  skip = 66637,
                  nrows = 2880,
                  col.names = c("Date", "Time", "Global_active_power",
                                "Global_reactive_power", "Voltage", "Global_intensity",
                                "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Plot histogram
hist(data$Global_active_power, col="Red", xlab = 'Global Active Power (killowatts)',
main = 'Global Active Power')

##Copy plot to png
dev.copy(png, file = "plot1.png", width = 480, height = 480)