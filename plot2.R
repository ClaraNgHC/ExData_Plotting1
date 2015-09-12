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

#Generate the Plot
png("plot2.png", 
    width=480, 
    height=480,
    units = "px", 
    bg = "transparent")

# set the labeling
plot(datetime, 
     globalActivePower, 
     type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")

dev.off()