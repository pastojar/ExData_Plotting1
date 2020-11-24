

data <- read.csv("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 69518-66637-1, header = F, stringsAsFactors = F)
hlp <- as.character( read.csv("household_power_consumption.txt", sep = ";", nrows = 1, header = F, stringsAsFactors = F) [1, ] )
colnames(data) <- hlp

data$DateTime <- paste0( data$Date, " ", data$Time )
data$DateTime <- lubridate::parse_date_time( data$DateTime, orders = "d/m/y H:M:S" )

png( file = "plot2.png", width = 480, height = 480, units = "px" )
        plot(  x = data$DateTime, 
               y = data$Global_active_power, 
               xlab = "",
               ylab = "Global Active Power (kilowatts)",
               type = "l"  )
dev.off()
