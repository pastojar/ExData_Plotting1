

data <- read.csv("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 69518-66637-1, header = F)
hlp <- as.character( read.csv("household_power_consumption.txt", sep = ";", nrows = 1, header = F, stringsAsFactors = F) [1, ] )
colnames(data) <- hlp


png( file = "plot1.png", width = 480, height = 480, units = "px" )
        hist(  data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power"  )
dev.off()
