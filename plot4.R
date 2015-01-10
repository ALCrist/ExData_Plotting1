setwd("C:/Users/Annette/Documents")
library("dplyr")
library("lubridate")
setwd("C:/Users/Annette/Documents")
data <- read.table("./data/household_power_consumption.txt", 
                   header=TRUE, na.string="?", sep=";",
                   stringsAsFactors=FALSE, colClasses=c("character", "character", "real",                                                 
                                                        "real", "real",
                                                        "real", "real",
                                                        "real", "real"))
data <- data[data$Date %in% c("1/2/2007","2/2/2007),]


par(mfrow = c(2,2),mar=c(4,4,2,1),oma = c(1,1,2,0),cex=0.4)
with(data, {
## Global Active Power Plot
    plot(dmy_hms(paste(data$Date,data$Time)),
                         Global_active_power,pch=NA_integer_,type="o",
                         ylab="Global Active Power (kilowatts)", xlab="")
## Voltage Plot
    plot(dmy_hms(paste(data$Date,data$Time)),
                         Voltage,pch=NA_integer_,type="o",
                         xlab="datetime",
                         ylab="Voltage")
## Energy Sub Metering Plot
    plot(dmy_hms(paste(data$Date,data$Time)),
                Sub_metering_1,pch=NA_integer_,type="o",
                ylab="Energy sub metering", xlab="")
        points(dmy_hms(paste(data$Date,data$Time)),
                Sub_metering_2,pch=NA_integer_,type="o",
                col="red")
        points(dmy_hms(paste(data$Date,data$Time)),
                Sub_metering_3,pch=NA_integer_,type="o",
                col="blue")
        legend("topright", lty=1, col=c("black","red","blue"),
            legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
## Global Reactive Power Plot
    plot(dmy_hms(paste(data$Date,data$Time)),
                         Global_reactive_power,pch=NA_integer_,type="o",
                         xlab="datetime",
                         ylab="Global Reactive Power")
})

dev.copy(png,file="plot4.png", width=480, height=480)
dev.off()