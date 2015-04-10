## open the data
setwd("C:/Users/Yuhua/Desktop/Data Science/3")

## get the data
da<-read.table("household_power_consumption.txt",header=T,sep=";")

## change the format of Date variable
da$Date<-as.Date(da$Date,format="%d/%m/%Y")

## subset the data
dasub<-subset(da,da$Date>="2007-02-01" & da$Date<="2007-02-02")

## convert column Global_active_power to numeric 
dasub$Global_active_power<-as.numeric(as.character(dasub$Global_active_power)) 

## add and convert new variable date_time
dasub$date_time<-paste(dasub$Date,dasub$Time)
dasub$date_time<-as.POSIXct(strptime(dasub$date_time,format="%Y-%m-%d %H:%M:%S"))

## create png file
png(filename="plot2.png",width=480,height=480)

## plot 2
plot(dasub$Global_active_power~dasub$date_time,type="l",xlab="",ylab="Global Active Power(kilowatts)")
dev.off()
