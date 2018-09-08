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

#Fourth plot 
#1st
plot(x = datetime, y = power1$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power")

#2nd
plot(x = datetime, y = power1$Sub_metering_1, type = "n", 
     xlab = "", ylab = "Energy sub metering")
lines(x = datetime, y = power1$Sub_metering_1)
lines(x = datetime, y = power1$Sub_metering_2, col = "red")
lines(x = datetime, y = power1$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, col = c("black", "red", "blue"), bty = "n")

#3rd
plot(x = datetime, y = power1$Voltage, type = "l", xlab = "datetime", 
     ylab = "Voltage")

#4th
plot(x = datetime, y = power1$Global_reactive_power, 
     type = "l", xlab = "datetime", ylab = "Global Reactive Power")
