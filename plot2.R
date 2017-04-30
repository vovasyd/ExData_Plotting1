library(data.table) 

epc_file <- "c:/git_local/household_power_consumption.txt"
col_classes = c("character", "character", "numeric", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL")

epc_raw <- fread(epc_file, sep = ";", na.strings = c("?"), colClasses = col_classes)
epc <- subset(epc_raw, Date == "1/2/2007" | Date == "2/2/2007")
x <- strptime(paste(epc$Date, epc$Time), format = "%d/%m/%Y %H:%M:%S")

png("plot2.png")
plot(x = x, y = epc$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
