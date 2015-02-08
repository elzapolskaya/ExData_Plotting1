plot1 <- function() {
        # Read file
        data<-read.table("household_power_consumption.txt", 
                         sep = ";", 
                         header = TRUE, 
                         na.strings = "?", 
                         stringsAsFactors = FALSE)
        
        # Converting column Date
        data$Date<-as.Date(data$Date, "%d/%m/%Y")
        adata<-data[data$Date>=as.Date("2007-02-01") & data$Date<=as.Date("2007-02-02"), ]
        
        # Create PNG file
        png("plot1.png", width = 480, height = 480)
        # Histogram
        hist(adata$Global_active_power, 
             col = "red", 
             xlab = "Global Active Power (kilowatts)", 
             main = "Global Active Power")
        # Close the PNG file device
        dev.off()
}
