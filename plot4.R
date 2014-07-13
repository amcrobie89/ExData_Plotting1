# Exploratory Data Analysis- Week 1 Project (Plot 4)

# Note: set working directory first!!!!
setwd("~/Documents/Coursera/Data Science Specialization/4- Exploratory Data Analysis/Week 1")

# Read Data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                   na.strings="?")
# Create a timestamp variable by pasting Date and Time variables together
timestamp <- paste(data$Date,data$Time)
# Use strptime to convert into a timestamp
stamps <- strptime(timestamp, "%d/%m/%Y %H:%M:%S")
# Add timestamp variable to dataset
data$timestamps <- stamps
# Create two subsets for the two days required: 2/1/2007 and 2/2/2007
t1 <- subset(data,as.Date(timestamps,"%m/%d/%Y")==as.Date("2/1/2007","%m/%d/%Y"))
t2 <- subset(data,as.Date(timestamps,"%m/%d/%Y")==as.Date("2/2/2007","%m/%d/%Y"))
# Combine the subsets into a single dataset
finalset <- rbind(t1,t2)

# Plot 4
png(filename="plot4.png")
par(mfcol=c(2,2))
with(finalset, {
  # Top Left Plot (Plot 2)
  plot(timestamps, Global_active_power, type="l", xlab="",
       ylab="Global Active Power (kilowatts)")
  # Bottom Left Plot (Plot 3)
  plot(timestamps, Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")
  lines(timestamps, Sub_metering_2, type="l", col="red")
  lines(timestamps, Sub_metering_3, type="l", col="blue")
  legend("topright", pch=1, col=c("black", "red", "blue"),
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  # Top Right Plot
  plot(timestamps, Voltage, type="l", xlab="datetime",
       ylab="Voltage")
  # Bottom Right Plot
  plot(timestamps, Global_reactive_power, type="l", xlab="datetime")
})
dev.off()