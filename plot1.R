plot1 <- function() {
  
  
  ##read the data -  it only reads data for 2007-02-01 and 2007-02-02
  data <- read.table("originaldata.txt", sep = ";", nrows = 2880, skip = 66637)  
  
  ##assign the original colnames
  colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
  
  ##graphic device png, creation, plot 1 and end of the graphic device
  png("plot1.png", width=480, height=480)
  hist(data[,3], col = "red", 
                 main = "Global Active Power", 
                 xlab = "Global Active Power (kilowatts)")
  dev.off()
  
}