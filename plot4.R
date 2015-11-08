plot4 <- function() 
{
    library(datasets)
    library(data.table)

    fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileurl, destfile = "household_power_consumption.zip")
    unzip("household_power_consumption.zip")

    DT <- read.csv2("household_power_consumption.txt", sep=";")
    DT <- subset(DT, strptime(Date, "%d/%m/%Y") <= strptime("02/02/2007", "%d/%m/%Y") & strptime(Date, "%d/%m/%Y") >= strptime("01/02/2007", "%d/%m/%Y"))
    DT <- within(DT, { datetime <- strptime(paste(Date, Time), "%d/%m/%Y %T")
    Sub_metering_1 <- as.numeric(as.character(Sub_metering_1))
    Sub_metering_2 <- as.numeric(as.character(Sub_metering_2))
    Sub_metering_3 <- as.numeric(as.character(Sub_metering_3))
    Voltage <- as.numeric(as.character(Voltage))
    Global_active_power <- as.numeric(as.character(Global_active_power))
    Global_reactive_power <- as.numeric(as.character(Global_reactive_power))
    }
    )
    png("figure/plot4.png")
    par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
    with(DT, {
        plot(DT$datetime, DT$Global_active_power, type = "l", xlab ="", ylab="Global Active Power (kilowatts)")
        plot(DT$datetime, DT$Voltage, type = "l", xlab ="datetime", ylab="Voltage")
        plot(DT$datetime, DT$Sub_metering_1, type="l", xlab ="", ylab="Energy Sub Metering")
        lines(DT$datetime, DT$Sub_metering_2, type = "l", xlab ="", ylab="", col="red")
        lines(DT$datetime, DT$Sub_metering_3, type = "l", xlab ="", ylab="", col="blue")    
        legend("topright", border="black", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1, col=c("black","red","blue"))
        plot(DT$datetime, DT$Global_reactive_power, type = "l", xlab ="datetime", ylab="Global Reactive Power")
    })
    dev.off()
}
