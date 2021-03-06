# loading data
setwd("/Users/abbieho/Documents/CoursearR")
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp,method="curl")
data <- read.table(unz(temp, "household_power_consumption.txt"),header=T,sep=";", na.strings="?" ,colClasses=c(rep("character",2),rep("numeric",7)))
unlink(temp)

# Convert date
data$Date <- strptime(data$Date, "%d/%m/%Y")
data$Datetime <- strptime(paste(data$Date,data$Time, sep=" "), "%Y-%m-%d %H:%M:%S")
sub_data <- subset(data, as.Date(Date) == "2007-02-01" | as.Date(Date) == "2007-02-02")

# plot2
Sys.setlocale("LC_TIME", "en_US.UTF-8")
png("plot2.png", width = 480, height = 480)
plot(sub_data$Datetime,sub_data$Global_active_power, type="l",xlab="" , ylab = "Global Active Power (kilowatts)")
dev.off()