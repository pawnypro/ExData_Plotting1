powerdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")
mydata <- subset(powerdata, Date == "2007-02-01" | Date == "2007-02-02")

mydata$datetime <- paste(as.character(mydata$Date), as.character(mydata$Time))
mydata$datetime <- strptime(mydata$datetime, format = "%Y-%m-%d %H:%M:%S")

mydata$Sub_metering_1 <- as.character(mydata$Sub_metering_1)
mydata$Sub_metering_1 <- as.numeric(mydata$Sub_metering_1)

mydata$Sub_metering_2 <- as.character(mydata$Sub_metering_2)
mydata$Sub_metering_2 <- as.numeric(mydata$Sub_metering_2)

mydata$Sub_metering_3 <- as.character(mydata$Sub_metering_3)
mydata$Sub_metering_3 <- as.numeric(mydata$Sub_metering_3)

with(mydata, plot(datetime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
with(mydata, points(datetime, Sub_metering_2, type = "l", col = "Red"))
with(mydata, points(datetime, Sub_metering_3, type = "l", col = "Blue"))

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1)

dev.copy(png, "plot3.png")
dev.off()