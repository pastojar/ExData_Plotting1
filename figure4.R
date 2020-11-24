

data <- read.csv("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 69518-66637-1, header = F, stringsAsFactors = F)
hlp <- as.character( read.csv("household_power_consumption.txt", sep = ";", nrows = 1, header = F, stringsAsFactors = F) [1, ] )
colnames(data) <- hlp

data$DateTime <- paste0( data$Date, " ", data$Time )
data$DateTime <- lubridate::parse_date_time( data$DateTime, orders = "d/m/y H:M:S" )

png( file = "plot4.png", width = 480, height = 480, units = "px" )
        par( mfrow = c(2,2) )

        plot(   x = data$DateTime, 
                y = data$Global_active_power, 
                xlab = "",
                ylab = "Global Active Power",
                type = "l"   )
        
        
        plot(  x = data$DateTime, 
               y = data$Voltage, 
               xlab = "datetime",
               ylab = "Voltage",
               type = "l"  )
        
        plot(  x = data$DateTime, 
               y = data$Sub_metering_1, 
               xlab = "",
               ylab = "Energy sub metering",
               type = "l"  )
        lines(x = data$DateTime, 
              y = data$Sub_metering_2, col = "red")
        lines(x = data$DateTime, 
              y = data$Sub_metering_3, col = "blue")
        
        legend( "topright", lty = 1, col = c("black", "red", "blue"), legend = colnames(data)[c(7,8,9)], bty = "n" )
        
        
        plot(  x = data$DateTime, 
               y = data$Global_reactive_power, 
               xlab = "datetime",
               ylab = "Global_reactive_power",
               type = "l"  )
        
dev.off()
