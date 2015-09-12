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

globalActivePower <- as.numeric(subSetDate$Global_active_power)

#Generate the Plot
png("plot1.png", 
    width=480, 
    height=480,
    units = "px", 
    bg = "transparent")

# set the labeling
hist(globalActivePower, 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

dev.off()