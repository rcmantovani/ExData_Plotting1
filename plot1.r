## Coursera exdata-013 
## Asignment 1 
## Plot1.r

setwd("C:\\Classes\\Coursera\\exdata-013")
file="household_power_consumption.txt"

df=read.table(file,header=TRUE,sep=";")
head(df)
x <- paste(df$Date, df$Time)
df$datetime <- strptime(x, "%d/%m/%Y %H:%M:%S")
head(df)
summary(df)
dfsub<-subset(df,datetime>="2007-02-01 00:00:00" & datetime<= "2007-02-02 23:59:59")
head(df)
head(dfsub)

dfsub <- na.omit(dfsub)
dfsub$Global_active_power<-as.numeric(as.character(dfsub$Global_active_power))

png('plot1.png')
hist(dfsub$Global_active_power,col = "red", xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()



