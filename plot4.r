## Coursera exdata-013 
## Asignment 1 
## Plot4.r

setwd("C:\\Classes\\Coursera\\exdata-013")
file="household_power_consumption.txt"

df=read.table(file,header=TRUE,sep=";")
head(df)
x <- paste(df$Date, df$Time)
df$datetime <- strptime(x, "%d/%m/%Y %H:%M:%S")

dfsub<-subset(df,datetime>="2007-02-01 00:00:00" & datetime<= "2007-02-02 23:59:59")
dfsub <- na.omit(dfsub)
rm(df)
dfsub$Global_active_power<-as.numeric(as.character(dfsub$Global_active_power))
dfsub$Global_reactive_power<-as.numeric(as.character(dfsub$Global_reactive_power))
dfsub$Voltage<-as.numeric(as.character(dfsub$Voltage))
dfsub$Sub_metering_1<-as.numeric(as.character(dfsub$Sub_metering_1))
dfsub$Sub_metering_2<-as.numeric(as.character(dfsub$Sub_metering_2))
dfsub$Sub_metering_3<-as.numeric(as.character(dfsub$Sub_metering_3))

png('plot4.png')
par(mfrow=c(2,2))

plot(dfsub$datetime,dfsub$Global_active_power,ylab="Global Active Power (kilowatts)",
     xlab="",type="l")

plot(dfsub$datetime,dfsub$Voltage,ylab="Voltage",xlab="datetime",
     type="l")

plot(dfsub$datetime,dfsub$Sub_metering_1,ylab="Energy sub metering",
     xlab="",type="l")
lines(dfsub$datetime,dfsub$Sub_metering_2, col="red")
lines(dfsub$datetime,dfsub$Sub_metering_3, col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), fill,lwd="1",
        col=c("black","red","blue"))

plot(dfsub$datetime,dfsub$Global_reactive_power,xlab="datetime",
     type="l")

dev.off()

