#load data, make subset
filename <- "./data/household_power_consumption.txt"

data <- read.table(filename, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
data.subset <- data[data$Date %in% c("1/2/2007","2/2/2007"),]


#Plot #3
date.time <- strptime(paste(data.subset$Date,
                            data.subset$Time,
                            sep = " "),
                      "%d/%m/%Y %H:%M:%S") 

global.active <- as.numeric(data.subset$Global_active_power)

sub.meter.1 <- as.numeric(data.subset$Sub_metering_1)
sub.meter.2 <- as.numeric(data.subset$Sub_metering_2)
sub.meter.3 <- as.numeric(data.subset$Sub_metering_3)

png("plot3.png",
    height = 480,
    width = 480)

plot(date.time,
     sub.meter.1,
     type = "l",
     ylab = "Energy Submetering",
     xlab = "")

lines(date.time,
      sub.meter.2,
      type = "l",
      col = "red")
lines(date.time,
      sub.meter.3,
      type = "l",
      col = "blue")

legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1,
       lwd = 1,
       col = c("black", "red", "blue"))

dev.off()