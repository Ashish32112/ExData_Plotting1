dataset <- read.table("household_power_consumption.txt",
                      sep = ";" , stringsAsFactors = FALSE,
                      skip = 66637, nrow = 2880,
                      col.names = names(read.table("household_power_consumption.txt",
                                                   sep = ";", header = TRUE,nrow = 1)))

dataset$Time <- strptime(paste(dataset$Date,dataset$Time),
                         format = "%d/%m/%Y %H:%M:%S")

dataset$Date <- as.Date(dataset$Date, format = "%d/%m/%Y")

png(filename = "Plot2.png",width = 480, height = 480)

par(bg = NA)

plot(dataset$Time,dataset$Global_active_power,
     ylab = "Global Active Power(kilowatts)",
     xlab = "",
     type = "l")

dev.off()