##R Script for Exploratory Data Analysis Course Project 1

##Plot 4

##load data
initial <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
initial$Date <- as.Date(initial$Date,"%d/%m/%Y")
data2 <- subset(initial,Date=="2007-02-01" | Date=="2007-02-02")
remove(initial)

##clean up col names
names(data) <- gsub("_","",names(data))
names(data) <- tolower(names(data))

##make variables appropriate classes
#Global active power
data$globalactivepower <- as.character(data$globalactivepower)
data$globalactivepower <- as.numeric(data$globalactivepower)
#Global reactive power
data$globalreactivepower <- as.character(data$globalreactivepower)
data$globalreactivepower <- as.numeric(data$globalreactivepower)
#date time
data$date <- as.character(data$date)
data$time <- as.character(data$time)
data$datetime <- with(data,paste(date,time))
data$datetime <- with(data,strptime(datetime,"%Y-%m-%d %H:%M:%S"))
#submetering
data$submetering1 <- as.character(data$submetering1)
data$submetering2 <- as.character(data$submetering2)
data$submetering1 <- as.numeric(data$submetering1)
data$submetering2 <- as.numeric(data$submetering2)
#voltage
data$voltage <- as.character(data$voltage)
data$voltage <- as.numeric(data$voltage)

##create plot series 4
png(file="plot4.png",width=480, height=480)
par(mfrow=c(2,2))
#plot 1
with(data, plot(datetime,globalactivepower,type="l",
                xlab="",ylab="Global Active Power"))
#plot 2
with(data, plot(datetime,voltage,type="l",
                ylab="Voltage"))
#plot 3
with(data,plot(datetime,submetering1,type="l",xlab="",ylab="Energy sub metering"))
with(data,points(datetime,submetering2,col="red",type="l"))
with(data,points(datetime,submetering3,col="blue",type="l"))
legend("topright",pch="_",col=c("black","red","blue"),
       legend=c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"))
#plot 4
with(data, plot(datetime,globalreactivepower,type="l",
                ylab="Global_reactive_power"))
dev.off()