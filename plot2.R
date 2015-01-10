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
                         Global_active_power,pch=NA_integer_,type="o",
                         ylab="Global Active Power (kilowatts)", xlab=""))
dev.copy(png,file="plot2.png", width=480, height=480)
dev.off()