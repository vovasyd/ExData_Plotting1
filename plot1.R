library(data.table) # for faster reading
epc_file <- "c:/git_local/household_power_consumption.txt"
col_classes = c("date", "NULL", "numeric", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL")
epc_raw <- fread(epc_file, sep = ";", na.strings = c("?"), colClasses = col_classes)
epc <- subset(epc_raw, Date == "1/2/2007" | Date == "2/2/2007")
png("plot1.png")
hist(epc$Global_active_power, 
     main = "Global active power", 
     xlab = "Global Active power (kilowatts)", 
     col = 'red')
dev.off()