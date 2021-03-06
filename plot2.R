plot2 <- function() {
  
  ##read the data -  it only reads data for 2007-02-01 and 2007-02-02
  data <- read.table("originaldata.txt", sep = ";", nrows = 2880, skip = 66637)  
  
  ##assign the original colnames
  colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                      "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
  
  ##find unique values
  vector <- which(!duplicated(data[,1]))
  
  ##graphic device png, creation, plot 2 and end of the graphic device
  png("plot2.png", width=480, height=480)
  plot(data[,3], type = "l", xaxt = "n", 
       xlab = "", ylab = "Global Active Power (kilowatts)")
  axis(1, at = c(vector[1],vector[2],length(data[,1])), labels=c("Thu","Fri","Sat"))
  dev.off()
  
}