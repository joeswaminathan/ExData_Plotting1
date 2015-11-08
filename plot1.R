plot1 <- function() 
{
    library(datasets)
    library(data.table)

    fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileurl, destfile = "household_power_consumption.zip")
    unzip("household_power_consumption.zip")

    DT <- read.csv2("household_power_consumption.txt", sep=";")
    DT <- subset(DT, strptime(Date, "%d/%m/%Y") <= strptime("02/02/2007", "%d/%m/%Y") & strptime(Date, "%d/%m/%Y") >= strptime("01/02/2007", "%d/%m/%Y"))
    png("figure/plot1.png")
    DT <- within(DT, Global_active_power <- as.numeric(as.character(Global_active_power)))
    hist(DT$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
    #    hist(as.numeric(levels(DT$Global_active_power[1]))[DT$Global_active_power], main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
    dev.off()
}
