plot2 <- function() {
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
        png("plot2.png", width = 480, height = 480, bg = "transparent")
        # Create plot
        plot(dt, 
             adata$Global_active_power, 
             type = "l", 
             xlab = " ", 
             ylab = "Global Active Power (kilowatts)")
       
        # Close the PNG file device
        dev.off()
}