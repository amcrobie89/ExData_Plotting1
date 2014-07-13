# Exploratory Data Analysis- Week 1 Project (Plot 3)

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

# Plot 3
png(filename="plot3.png")
with(finalset, plot(timestamps, Sub_metering_1, xlab="", ylab="Energy sub metering", type="l"))
with(finalset, lines(timestamps, Sub_metering_2, type="l", col="red"))
with(finalset, lines(timestamps, Sub_metering_3, type="l", col="blue"))
legend("topright", lty=1, col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()