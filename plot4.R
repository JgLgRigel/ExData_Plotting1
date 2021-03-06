library(dplyr)
dataset<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.string="?")
dataset<-filter(dataset,dataset$Date=="1/2/2007"|dataset$Date=="2/2/2007")
dataset$Date_Time<-strptime(paste(dataset$Date,dataset$Time),format="%d/%m/%Y %H:%M:%S")
png("plot4.png")
par(mfrow=c(2,2))
plot(dataset$Date_Time,dataset$Global_active_power,type="l",xlab="",ylab="Global Active Power")
plot(dataset$Date_Time,dataset$Voltage,type="l",xlab="datetime",ylab="Global Active Power")
plot(dataset$Date_Time,dataset$Sub_metering_1,xlab="",ylab="Energy sub metering",type="n")
lines(dataset$Date_Time,dataset$Sub_metering_1,col="black")
lines(dataset$Date_Time,dataset$Sub_metering_2,col="red",xlab="",ylab="Energy sub metering")
lines(dataset$Date_Time,dataset$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
plot(dataset$Date_Time,dataset$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")
dev.off()