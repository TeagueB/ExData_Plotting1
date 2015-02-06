hpc_temp <- read.csv("C:/Users/bradley.b.teague/Documents/Data Science Courses/Exploratory Data Analysis/Project 1/exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
hpc_temp$DateTime <- strptime(paste(hpc_temp$Date,hpc_temp$Time), "%d/%m/%Y %H:%M:%S")
hpc_temp$Date <- as.Date(hpc_temp$Date, "%d/%m/%Y")
hpc <- subset(hpc_temp, hpc_temp$Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")))
rm(hpc_temp)
hpc$Weekday <- weekdays(hpc$Date)
png(filename = "Project1_Plot4.png", width = 480, height = 480)
par(mar=c(4, 4, 2, 2))
par(mfrow=c(2,2))
##Chart 1
plot(hpc$DateTime, hpc$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
##Chart 2
plot(hpc$DateTime, hpc$Voltage, type="l", xlab="datetime", ylab="Voltage")
##Chart 3
plot(hpc$DateTime, hpc$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(hpc$DateTime,y=hpc$Sub_metering_2,col="red")
lines(hpc$DateTime,y=hpc$Sub_metering_3,col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1), lwd=c(2.5,2.5,2.5),col=c("black","blue","red"), bty="n")
##Chart 4
plot(hpc$DateTime, hpc$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()