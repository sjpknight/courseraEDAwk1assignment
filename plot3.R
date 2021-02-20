# download data
# sourceURL = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
# download.file(sourceURL, destfile="./data/data.zip")
# unzip("./data/data.zip", exdir="./data/HPC")

hpc <- read.csv("./data/HPC/household_power_consumption.txt", sep=";")

# convert the Date & Time columns from 
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
hpc$Date_time <- with(hpc, as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M"))

# we are only interested in dates between 2007-02-01 & 2007-02-02
hpc <- subset(hpc, Date == "2007-02-01" | Date == "2007-02-02")

# create the plot
with(hpc, plot(Date_time, Sub_metering_1, type="l", ylab = "Energy stub metering", xlab=""))
with(hpc, lines(Date_time, Sub_metering_2, col="red"))
with(hpc, lines(Date_time, Sub_metering_3, col="blue"))
with(hpc, legend("topright", c("Sub_metering_1", 
                               "Sub_metering_2", "Sub_metering_3"), 
                 lwd = c(2), col = c("black", "red", "blue"),
                 y.intersp = 1.0, yjust = 2.0))