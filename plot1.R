## open the data file
setwd("C:/Users/Yuhua/Desktop/Data Science/3")

## get the data
da<-read.table("household_power_consumption.txt",header=T,sep=";")

## change the format of Date variable
da$Date<-as.Date(da$Date,format="%d/%m/%Y")

## subset the data
dasub<-subset(da,da$Date>="2007-02-01" & da$Date<="2007-02-02")

## convert column Global_active_power to numeric
dasub$Global_active_power<-as.numeric(as.character(dasub$Global_active_power))

## create png file
png(filename="plot1.png",width=480,height=480)

## plot 1
hist(dasub$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power(kilowatts)",ylab="Frequency")
dev.off()
