


##setwd("~/datasciencecoursera/Exploratory Data Analysis/power_consumption")
##  Load data into R (assumes data file is in current working directory)

powerdata <- read.table("household_power_consumption.txt", header=TRUE, 
                          sep=";", na.strings="?")

#Concatenate date and time strings
powerdata$unique <- paste(powerdata$Date, powerdata$Time)

#Convert original Date variable to date class
powerdata$Date <- as.Date(powerdata$Date, format = "%d/%m/%Y")

#Select out rows for dates of interest
subpower <- subset(powerdata, powerdata$Date=="2007-02-01" | powerdata$Date=="2007-02-02")

#Convert "unique" variable to POSIXlt class
subpower$unique <- strptime(subpower$unique, format = "%d/%m/%Y %H:%M:%S")

#Open png driver, construct plot, close driver/device to write file
png(filename = "plot2.png", width=480, height=480)

plot(subpower$unique, subpower$Global_active_power, type="l", 
     xlab = "", ylab="Global Active Power (kilowatts)") 
    
dev.off()