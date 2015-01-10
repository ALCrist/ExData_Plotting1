library("dplyr")
library("lubridate")
setwd("C:/Users/Annette/Documents")
data <- read.table("./data/household_power_consumption.txt", 
                   header=TRUE, na.string="NA", sep=";",
                   stringsAsFactors=FALSE)
data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
par(mar=c(4,5.5,4,4),cex=.5)
hist(as.numeric(data$Global_active_power),col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.copy(png,file="plot1.png", width=480, height=480)
dev.off()