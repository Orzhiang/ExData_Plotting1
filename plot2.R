library(dplyr)

setwd("D:/Coursera/DS4 - Exploratory Data Analysis/DS4 - Coursework 1/")
par(mar=c(5,5,4,2))

Elect.Data<-read.table("household_power_consumption.txt",header=T,sep=";",
                       na.strings = "?")

Elect.Data.Sub<-tbl_df(Elect.Data)
Elect.Data.Sub$Date<-as.Date(Elect.Data$Date,format="%d/%m/%Y")
Elect.Data.Sub<-Elect.Data.Sub[Elect.Data.Sub$Date>=as.Date("2007-02-01",format="%Y-%m-%d")
                               & Elect.Data.Sub$Date<=as.Date("2007-02-02",format="%Y-%m-%d"),]
Elect.Data.Sub<-arrange(Elect.Data.Sub,Date,Time)
DaTi<-as.POSIXlt(paste(Elect.Data.Sub$Date, Elect.Data.Sub$Time, sep=" "))

# Plot 2
png(
  "plot2.png",
  width     = 480,
  height    = 480,
  units     = "px"
)
plot(y=Elect.Data.Sub$Global_active_power,x=DaTi,type="l",xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()
