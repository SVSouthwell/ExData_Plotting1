#load data, make subset
filename <- "./data/household_power_consumption.txt"

data <- read.table(filename, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
data.subset <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

#Plot #1

global.active <- as.numeric(data.subset$Global_active_power)

png("plot1.png",
    height = 480, 
    width = 480)

hist(global.active,
    col = "red", 
    main = "Global Active Power",
    xlab = "Global Active Power (kilowatts)")

dev.off()


