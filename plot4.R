library(dplyr)

setwd("D:/Coursera/DS4 - Exploratory Data Analysis/DS4 - Coursework 1/")

Elect.Data<-read.table("household_power_consumption.txt",header=T,sep=";",
                       na.strings = "?")

Elect.Data.Sub<-tbl_df(Elect.Data)
Elect.Data.Sub$Date<-as.Date(Elect.Data$Date,format="%d/%m/%Y")
Elect.Data.Sub<-Elect.Data.Sub[Elect.Data.Sub$Date>=as.Date("2007-02-01",format="%Y-%m-%d")
                               & Elect.Data.Sub$Date<=as.Date("2007-02-02",format="%Y-%m-%d"),]
Elect.Data.Sub<-arrange(Elect.Data.Sub,Date,Time)
DaTi<-as.POSIXlt(paste(Elect.Data.Sub$Date, Elect.Data.Sub$Time, sep=" "))

par(mfcol=c(2,2),mar=c(5,5,2,3))

plot(y=Elect.Data.Sub$Global_active_power,x=DaTi,type="l",xlab="",
     ylab="Global Active Power")

plot(y=Elect.Data.Sub$Sub_metering_1,x=DaTi,
     type="l",xlab="",
     ylab="Energy sub metering",
     col="black")
lines(y=Elect.Data.Sub$Sub_metering_2,x=DaTi,col="red")
lines(y=Elect.Data.Sub$Sub_metering_3,x=DaTi,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"),bty="n")

plot(y=Elect.Data.Sub$Voltage,x=DaTi,type="l",xlab="datetime",
     ylab="Global Active Power")

plot(y=Elect.Data.Sub$Global_reactive_power,x=DaTi,type="l",xlab="datetime",
     ylab="Global Active Power")
dev.off()
