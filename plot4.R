## open the data 
setwd("C:/Users/Yuhua/Desktop/Data Science/3") 

 
## get the data 
da<-read.table("household_power_consumption.txt",header=T,sep=";") 

 
## change the format of Date variable 
da$Date<-as.Date(da$Date,format="%d/%m/%Y") 

 
## subset the data 
dasub<-subset(da,da$Date>="2007-02-01" & da$Date<="2007-02-02") 

 
## convert columnS to numeric  
dasub$Global_active_power<-as.numeric(as.character(dasub$Global_active_power))  
dasub$Sub_metering_1<-as.numeric(as.character(dasub$Sub_metering_1))
dasub$Sub_metering_2<-as.numeric(as.character(dasub$Sub_metering_2))
dasub$Sub_metering_3<-as.numeric(as.character(dasub$Sub_metering_3))
dasub$Global_reactive_power<-as.numeric(as.character(dasub$Global_reactive_power))
dasub$Voltage<-as.numeric(as.character(dasub$Voltage))
 
## add and convert new variable date_time 
dasub$date_time<-paste(dasub$Date,dasub$Time) 
dasub$date_time<-as.POSIXct(strptime(dasub$date_time,format="%Y-%m-%d %H:%M:%S")) 

## create png file
png(filename="plot4.png",width=480,height=480)

## plot 4
par(mfrow=c(2,2))
plot(dasub$Global_active_power~dasub$date_time,xlab="",ylab="Global active power",type="l")
plot(dasub$Voltage~dasub$date_time,xlab="datetime",ylab="Voltage",type="l")
plot(dasub$Sub_metering_1~dasub$date_time,xlab="",ylab="Energy sub metering",type="l")
lines(dasub$Sub_metering_2~dasub$date_time,col="Red")
lines(dasub$Sub_metering_3~dasub$date_time,col="Blue")
legend("topright",col=c("Black","Red","Blue"),lty=1,lwd=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")
plot(dasub$Global_reactive_power~dasub$date_time,xlab="datetime",ylab="Global_reactive_power",type="l")
dev.off()
