library(data.table) 
Sys.setlocale("LC_TIME", "English")
epc_file <- "c:/git_local/household_power_consumption.txt"
col_classes = c("character", "character", "NULL", "NULL", "NULL", "NULL", "numeric", "numeric", "numeric")

epc_raw <- fread(epc_file, sep = ";", na.strings = c("?"), colClasses = col_classes)
epc <- subset(epc_raw, Date == "1/2/2007" | Date == "2/2/2007")
x <- strptime(paste(epc$Date, epc$Time), format = "%d/%m/%Y %H:%M:%S")

xrange <- range(x)
yrange <- range(c(epc$Sub_metering_1, epc$Sub_metering_2, epc$Sub_metering_3))

png("plot3.png")

plot(xrange, yrange, type = "n", xlab = "", ylab = "Energy sub metering")
lines(x, epc$Sub_metering_1, type = "l", col = "black")
lines(x, epc$Sub_metering_2, type = "l", col = "red")
lines(x, epc$Sub_metering_3, type = "l", col = "blue")

legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lwd = 1, 
       col = c("black", "red", "blue"))

dev.off()
