powerdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")
mydata <- subset(powerdata, Date == "2007-02-01" | Date == "2007-02-02")

mydata$Global_active_power <- as.character(mydata$Global_active_power)
mydata$Global_active_power <- as.numeric(mydata$Global_active_power)

mydata$Voltage <- as.character(mydata$Voltage)
mydata$Voltage <- as.numeric(mydata$Voltage)

mydata$Sub_metering_1 <- as.character(mydata$Sub_metering_1)
mydata$Sub_metering_1 <- as.numeric(mydata$Sub_metering_1)
mydata$Sub_metering_2 <- as.character(mydata$Sub_metering_2)
mydata$Sub_metering_2 <- as.numeric(mydata$Sub_metering_2)
mydata$Sub_metering_3 <- as.character(mydata$Sub_metering_3)
mydata$Sub_metering_3 <- as.numeric(mydata$Sub_metering_3)

mydata$Global_reactive_power <- as.character(mydata$Global_reactive_power)
mydata$Global_reactive_power <- as.numeric(mydata$Global_reactive_power)

mydata$datetime <- paste(as.character(mydata$Date), as.character(mydata$Time))
mydata$datetime <- strptime(mydata$datetime, format = "%Y-%m-%d %H:%M:%S")

par(mfrow = c(2,2))

with(mydata, plot(datetime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))

with(mydata, plot(datetime, Voltage, type = "l", ylab = "Voltage"))

with(mydata, plot(datetime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
with(mydata, points(datetime, Sub_metering_2, type = "l", col = "Red"))
with(mydata, points(datetime, Sub_metering_3, type = "l", col = "Blue"))

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1, bty = "n")

with(mydata, plot(datetime, Global_reactive_power, type = "l"))

dev.copy(png, "plot4.png")
dev.off()
