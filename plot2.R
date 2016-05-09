#load data, make subset
filename <- "./data/household_power_consumption.txt"

data <- read.table(filename, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
data.subset <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

#Plot #2

date.time <- strptime(paste(data.subset$Date,
                            data.subset$Time,
                            sep = " "),
                      "%d/%m/%Y %H:%M:%S") 

global.active <- as.numeric(data.subset$Global_active_power)

png("plot2.png",
    heigh = 480,
    width = 480)

plot(date.time,
     global.active,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()
