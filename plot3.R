## open the data 
setwd("C:/Users/Yuhua/Desktop/Data Science/3") 

 
## get the data 
da<-read.table("household_power_consumption.txt",header=T,sep=";") 

 
## change the format of Date variable 
da$Date<-as.Date(da$Date,format="%d/%m/%Y") 
 
 
## subset the data 
dasub<-subset(da,da$Date>="2007-02-01" & da$Date<="2007-02-02") 
 
 
## convert columns to numeric  
dasub$Sub_metering_1<-as.numeric(as.character(dasub$Sub_metering_1))
dasub$Sub_metering_2<-as.numeric(as.character(dasub$Sub_metering_2))
dasub$Sub_metering_3<-as.numeric(as.character(dasub$Sub_metering_3)) 
 
## add and convert new variable date_time 
dasub$date_time<-paste(dasub$Date,dasub$Time) 
dasub$date_time<-as.POSIXct(strptime(dasub$date_time,format="%Y-%m-%d %H:%M:%S"))

## create png file
png(filename="plot3.png",width=480,height=480)

## plot 3
plot(dasub$Sub_metering_1~dasub$date_time,xlab="",ylab="Energy sub metering",type="l")
lines(dasub$Sub_metering_2~dasub$date_time,col="Red")
lines(dasub$Sub_metering_3~dasub$date_time,col="Blue")
legend("topright",col=c("Black","Red","Blue"),lty=1,lwd=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
