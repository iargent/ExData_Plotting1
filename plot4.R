f<-"F:/personal/Mooc/Exploratory Data Analysis/Course Project 1/household_power_consumption.txt"
tab5rows<- read.table(f, T, nrows=5, sep=";", na.strings="?")
Classes <- sapply(tab5rows, class)
d<-read.table(f, T, nrows=100000, sep=";", na.strings="?", colClasses=Classes)
d$Time<-strptime(paste(as.Date(d$Date, "%d/%m/%Y"), d$Time), "%Y-%m-%d %H:%M:%S")
d$Date<-NULL
d<- subset(d, Time >= as.POSIXct('2007-02-01') & Time <=
                   as.POSIXct('2007-02-03'))

par(mfrow=c(2,2))

plot(d$Time, d$Global_active_power, type="n",
     xlab="",
     ylab="Global Active Power",
     main="")
lines(d$Time, d$Global_active_power)


plot(d$Time, d$Voltage, type="n",
     xlab="datetime",
     ylab="Voltage",
     main="")
lines(d$Time, d$Voltage)


plot(d$Time, d$Sub_metering_1, type="n",
     xlab="",
     ylab="Energy sub metering",
     main="")
lines(d$Time, d$Sub_metering_1, col="black")
lines(d$Time, d$Sub_metering_2, col="red")
lines(d$Time, d$Sub_metering_3, col="blue")
legend("topright", lty=c(1,1,1),
       cex=0.7, bty="n",
       col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(d$Time, d$Global_reactive_power, type="n",
     xlab="datetime",
     ylab="Global Reactive Power",
     main="")
lines(d$Time, d$Global_reactive_power)



dev.copy(png, "plot4.png", width=480, height=480, res=55)
dev.off()