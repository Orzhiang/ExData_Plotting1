library(dplyr)

# Set Directory
setwd("Set directory here.")

par(mar=c(5,5,4,2))

Elect.Data<-read.table("household_power_consumption.txt",header=T,sep=";",
                       na.strings = "?")

Elect.Data.Sub<-tbl_df(Elect.Data)
Elect.Data.Sub$Date<-as.Date(Elect.Data$Date,format="%d/%m/%Y")
Elect.Data.Sub<-Elect.Data.Sub[Elect.Data.Sub$Date>=as.Date("2007-02-01",format="%Y-%m-%d")
                               & Elect.Data.Sub$Date<=as.Date("2007-02-02",format="%Y-%m-%d"),]
Elect.Data.Sub<-arrange(Elect.Data.Sub,Date,Time)
DaTi<-as.POSIXlt(paste(Elect.Data.Sub$Date, Elect.Data.Sub$Time, sep=" "))

# Plot 1
png(
  "plot1.png",
  width     = 480,
  height    = 480,
  units     = "px"
)

hist(Elect.Data.Sub$Global_active_power,col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency")
#dev.copy(png, file = "plot1.png")
dev.off()
