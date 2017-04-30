library(data.table) 
Sys.setlocale("LC_TIME", "English")
epc_file <- "c:/git_local/household_power_consumption.txt"
col_classes = c("character", "character", "number", "number", "number", "NULL", "numeric", "numeric", "numeric")

epc_raw <- fread(epc_file, sep = ";", na.strings = c("?"), colClasses = col_classes)
epc <- subset(epc_raw, Date == "1/2/2007" | Date == "2/2/2007")
x <- strptime(paste(epc$Date, epc$Time), format = "%d/%m/%Y %H:%M:%S")

xrange <- range(x)
yrange <- range(c(epc$Sub_metering_1, epc$Sub_metering_2, epc$Sub_metering_3))

png("plot4.png")

par(mfrow = c(2, 2))

plot(x = x, y = epc$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power")

plot(x = x, y = epc$Voltage, type = "l", 
     xlab = "datetime", ylab = "Voltage")

plot(xrange, yrange, type = "n", xlab = "", ylab = "Energy sub metering")
lines(x, epc$Sub_metering_1, type = "l", col = "black")
lines(x, epc$Sub_metering_2, type = "l", col = "red")
lines(x, epc$Sub_metering_3, type = "l", col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lwd = 1, 
       bty = "n",
       col = c("black", "red", "blue"))

plot(x = x, y = epc$Global_reactive_power, type = "l", 
     xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
