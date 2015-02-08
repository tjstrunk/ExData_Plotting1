#Reads only the data from 01/02/2007 and 02/02/2007
my_data <- read.table("household_power_consumption.txt", sep = ";",
                      na.strings = "?", skip = 66637, nrow = 2880, 
                      colClasses = c("character", "character", 
                      rep("numeric", 7)), col.names = c("Date", 
                      "Time", "Global_active_power", 
                      "Global_reactive_power", "Voltage", 
                      "Global_intensity", "Sub_metering_1", 
                      "Sub_metering_2", "Sub_metering_3"))
#Creates a 10th column of date and time together with type Date
my_data$DateTime = paste(my_data$Date, my_data$Time, sep = " ")
my_data$DateTime <- strptime(my_data$DateTime, format = "%d/%m/%Y
                             %H:%M:%S")
#Makes histogram in file "plot1"
png(filename = "plot1.png")
hist(my_data$Global_active_power, breaks = 11, 
          col = "red", xlab = "Global Active Power (kilowatts)",
          main = "Global Active Power")
dev.off()