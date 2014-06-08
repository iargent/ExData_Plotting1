f<-"F:/personal/Mooc/Exploratory Data Analysis/Course Project 1/household_power_consumption.txt"
tab5rows<- read.table(f, T, nrows=5, sep=";", na.strings="?")
Classes <- sapply(tab5rows, class)
d<-read.table(f, T, nrows=100000, sep=";", na.strings="?", colClasses=Classes)
d$Time<-strptime(paste(as.Date(d$Date, "%d/%m/%Y"), d$Time), "%Y-%m-%d %H:%M:%S")
d$Date<-NULL
d<- subset(d, Time >= as.POSIXct('2007-02-01') & Time <=
                    as.POSIXct('2007-02-03'))
hist(d$Global_active_power, col="red", xlab="Global Active Power (kilowatts)",
     main="Global Active Power")
dev.copy(png, "plot1.png", width=480, height=480)
dev.off()