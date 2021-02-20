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
with(hpc, plot(Date_time, Global_active_power, type="l", ylab = "Global Active Power kilowatts", xlab = ""))



