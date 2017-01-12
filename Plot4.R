dataset <- read.table("household_power_consumption.txt",
                      sep = ";" , stringsAsFactors = FALSE,
                      skip = 66637, nrow = 2880,
                      col.names = names(read.table("household_power_consumption.txt",
                                                   sep = ";", header = TRUE,nrow = 1)))

dataset$Time <- strptime(paste(dataset$Date,dataset$Time),
                         format = "%d/%m/%Y %H:%M:%S")

dataset$Date <- as.Date(dataset$Date, format = "%d/%m/%Y")

png(filename = "Plot4.png",width = 480, height = 480)

par(mfrow = c(2,2),bg = NA)

with(dataset,plot(Time,Global_active_power,
     ylab = "Global Active Power",
     xlab = "",
     type = "l"))

with(dataset,plot(Time,Voltage,
        ylab = "Voltage",
        xlab = "Datetime",
        type = "l"))

plot(dataset$Time,dataset$Sub_metering_1, type = "l",
     ylab = "Energy sub Metering", xlab = "")
points(dataset$Time, dataset$Sub_metering_2, type = "l", col = "red")
points(dataset$Time, dataset$Sub_metering_3, type = "l", col = "blue")

legend("topright", lty = 1,lwd = 2, legend = c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_2"),
       col = c("black", "red", "blue"), box.lwd = NA)

with(dataset,plot(Time,Global_reactive_power,
                  ylab = "Global_reactive_power",
                  xlab = "Datetime",
                  type = "l"))

dev.off()