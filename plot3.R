# Set the working part
setwd("C:/Users/Violet/Documents/OnlineCourse/DataSc/Module4/Assignment1")

#Read the datafile
dataFile <- "./household_power_consumption.txt"

data <- read.table(dataFile, 
                   header=TRUE, 
                   sep=";", 
                   stringsAsFactors=FALSE, 
                   dec=".")
# set the date format
subSetDate <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subSetDate$Date, 
                           subSetDate$Time, 
                           sep=" "), "%d/%m/%Y %H:%M:%S")

globalActivePower <- as.numeric(subSetDate$Global_active_power)

subMetering1 <- as.numeric(subSetDate$Sub_metering_1)
subMetering2 <- as.numeric(subSetDate$Sub_metering_2)
subMetering3 <- as.numeric(subSetDate$Sub_metering_3)

#Generate the Plot
png("plot3.png", 
    width=480, 
    height=480,
    units = "px", 
    bg = "transparent")

# set the labeling
plot(datetime, 
     subMetering1, 
     type="l", 
     ylab="Energy Submetering", 
     xlab="")

lines(datetime, 
      subMetering2, 
      type="l", 
      col="red")

lines(datetime, 
      subMetering3, 
      type="l", 
      col="blue")

# set the Legend for the Plot
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()