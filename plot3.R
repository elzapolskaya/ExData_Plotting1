plot3 <- function() {
        # Read file
        data<-read.table("household_power_consumption.txt", 
                         sep = ";", 
                         header = TRUE, 
                         na.strings = "?", 
                         stringsAsFactors = FALSE)
        
        # Converting column Date
        data$Date<-as.Date(data$Date, "%d/%m/%Y")
        adata<-data[data$Date>=as.Date("2007-02-01") & data$Date<=as.Date("2007-02-02"), ]
        dt<-as.POSIXlt(paste(adata$Date, adata$Time, sep = " "), tz = "GMT")
        
        # Create PNG file
        png("plot3.png", width = 480, height = 480, bg = "transparent")
        # Create plot
        plot(dt, 
             adata$Sub_metering_3, 
             type = "n", 
             xlab = " ", 
             ylab = "Energy sub metering", 
             ylim=c(0, max(adata$Sub_metering_1, adata$Sub_metering_2, adata$Sub_metering_3)))
        lines(dt, adata$Sub_metering_1, col = "black")
        lines(dt, adata$Sub_metering_2, col = "red")
        lines(dt, adata$Sub_metering_3, col = "blue")
        
        legend("topright", 
               lwd=1, 
               col = c("black", "red", "blue"), 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        # Close the PNG file device
        dev.off()
}