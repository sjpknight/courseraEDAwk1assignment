# download data
# sourceURL = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
# download.file(sourceURL, destfile="./data/data.zip")
# unzip("./data/data.zip", exdir="./data/HPC")

require(lubridate)

hpc <- read.csv("./data/HPC/household_power_consumption.txt", sep=";")
hpc$Date <- dmy(hpc$Date)
hpc$Time <- hms(hpc$Time)

# we are only interested in dates between 2007-02-01 & 2007-02-02
hpc <- subset(hpc, Date == 
                as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

# create the histogram
hist(as.numeric(hpc$Global_active_power), main = "Global Active Power", 
     col = "red", xlab = "Global Active Power kilowatts")


