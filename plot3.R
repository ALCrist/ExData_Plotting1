library(dplyr)
library(lubridate)
setwd("C:/Users/Annette/Documents")
data <- read.table("./data/household_power_consumption.txt", 
                   header=TRUE, na.string="?", sep=";",
                   stringsAsFactors=FALSE, colClasses=c("character", "character", "real",                                                 
                                                        "real", "real",
                                                        "real", "real",
                                                        "real", "real"))
data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
par(mar=c(4,5.5,4,4),cex=.5)
with(data, plot(dmy_hms(paste(data$Date,data$Time)),
                Sub_metering_1,pch=NA_integer_,type="o",
                ylab="Energy sub metering", xlab=""))
with(data, points(dmy_hms(paste(data$Date,data$Time)),
                Sub_metering_2,pch=NA_integer_,type="o",
                col="red"))
with(data, points(dmy_hms(paste(data$Date,data$Time)),
                Sub_metering_3,pch=NA_integer_,type="o",
                col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,file="plot3.png", width=480, height=480)
dev.off()