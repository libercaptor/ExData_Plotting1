plot4 <- function() {
  
  ##read the data -  it only reads data for 2007-02-01 and 2007-02-02
  data <- read.table("originaldata.txt", sep = ";", nrows = 2880, skip = 66637)  
  
  ##assign the original colnames
  colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                      "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
  
  ##find unique values
  vector <- which(!duplicated(data[,1]))
  
  ##graphic device png, creation, plot 4 and end of the graphic device
  png("plot4.png", width=480, height=480)
  
  par(mfrow=c(2, 2))
  
  plot(data[,3], type = "l", xaxt = "n", 
       xlab = "", ylab = "Global Active Power")
  axis(1, at = c(vector[1],vector[2],length(data[,1])), labels=c("Thu","Fri","Sat"))
  
  plot(data[,5], type = "l",  xaxt = "n", 
       xlab = "datetime", ylab = "Voltage")
  axis(1, at = c(vector[1],vector[2],length(data[,1])), labels=c("Thu","Fri","Sat"))
  
  plot(data[,7], type = "l", xaxt = "n", xlab = "", ylab = "Energy sub metering")
  lines(data[,8], col="red")
  lines(data[,9], col="blue")
  axis(1, at = c(vector[1],vector[2],length(data[,1])), labels=c("Thu","Fri","Sat"))
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         col= c("black", "red", "blue"), lty = c(1,1,1), bty = "n")
  
  plot(data[,4], type = "l", xaxt = "n", 
       xlab = "datetime", ylab = "Global_reactive_power")
  axis(1, at = c(vector[1],vector[2],length(data[,1])), labels=c("Thu","Fri","Sat"))
  
  dev.off()
  
}