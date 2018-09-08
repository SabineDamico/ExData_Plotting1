#check first if file exists already
if(!file.exists("./data")){dir.create("./data")}

#define the URL where download files are located
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

#download the file
download.file(fileUrl,destfile = "./data/exdata%2Fdata%2Fhousehold_power_consumption.zip")

#unzip the file that was downloaded
unzip(zipfile="./data/exdata%2Fdata%2Fhousehold_power_consumption.zip",exdir="./data")

#read the text file
file <- "./data/household_power_consumption.txt"
power <- read.csv2(file = file)

#view only the 
power1 <- power[ 66638:69518, ]


#view the first 100 rows
head(power1,100)


# Change date format
dates <- paste(power1$Date, power1$Time)
datetime <- strptime(dates, "%d/%m/%Y %H:%M:%S")

# Make two rows and two columns
par(mfrow=c(2,2))

# Second plot 
plot(datetime, as.numeric(power1$Global_active_power), type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")
#axis(1, at = c(1, 1441, 2880), labels=c("Thu", "Fri", "Sat"))
