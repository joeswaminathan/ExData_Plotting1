plot2 <- function() 
{
    library(datasets)
    library(data.table)

    fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileurl, destfile = "household_power_consumption.zip")
    unzip("household_power_consumption.zip")

    DT <- read.csv2("household_power_consumption.txt", sep=";")
    DT <- subset(DT, strptime(Date, "%d/%m/%Y") <= strptime("02/02/2007", "%d/%m/%Y") & strptime(Date, "%d/%m/%Y") >= strptime("01/02/2007", "%d/%m/%Y"))
    DT <- within(DT, datetime <- strptime(paste(Date, Time), "%d/%m/%Y %T"))
    DT <- within(DT, Global_active_power <- as.numeric(as.character(Global_active_power)))
    png("figure/plot2.png")
    plot(DT$datetime, DT$Global_active_power, type = "l", xlab ="", ylab="Global Active Power (kilowatts)")
    dev.off()
}
