#Reads only the data of household power consumption
#from 01/02/2007 and 02/02/2007
my_data <- read.table("household_power_consumption.txt", sep = ";",
                      na.strings = "?", skip = 66637, nrow = 2880, 
                      colClasses = c("character", "character", 
                      rep("numeric", 7)), col.names = c("Date", "Time",
                      "Global_active_power", "Global_reactive_power",
                      "Voltage", "Global_intensity", "Sub_metering_1", 
                      "Sub_metering_2", "Sub_metering_3"))
#Creates a 10th column of date and time together with type Date
my_data$DateTime = paste(my_data$Date, my_data$Time, sep = " ")
my_data$DateTime <- strptime(my_data$DateTime, format = "%d/%m/%Y
                             %H:%M:%S")

#Make and save plot4 to file "plot4.png"
png(filename = "plot4.png")
par(mfrow = c(2,2), mar = c(5, 5, 1, 5))
with(my_data, plot(DateTime, Global_active_power, type = "l", ylab = 
                     "Global Active Power (kilowatts)", xlab = ""))
with(my_data, plot(DateTime, Voltage, type = "l"))
with(my_data, plot(DateTime, Sub_metering_1, type = "l", ylab = 
                     "Energy sub metering", xlab = "",col = "black"))
with(my_data, lines(DateTime, Sub_metering_2, col = "red"))
with(my_data, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", col = c("black", "red", "blue"), legend = 
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
          lwd = 1, bty = "n", cex = .5)
with(my_data, plot(DateTime, Global_reactive_power, type = "l", ylab = 
            "Global_reactive_Power", xlab = "datetime"))
dev.off()