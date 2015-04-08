##R Script for Exploratory Data Analysis Course Project 1

##Plot 3

##load data
initial <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
initial$Date <- as.Date(initial$Date,"%d/%m/%Y")
data <- subset(initial,Date=="2007-02-01" | Date=="2007-02-02")
remove(initial)

##clean up col names
names(data) <- gsub("_","",names(data))
names(data) <- tolower(names(data))

##make variables appropriate classes
data$date <- as.character(data$date)
data$time <- as.character(data$time)
data$datetime <- with(data,paste(date,time))
data$datetime <- with(data,strptime(datetime,"%Y-%m-%d %H:%M:%S"))
data$submetering1 <- as.character(data$submetering1)
data$submetering2 <- as.character(data$submetering2)
data$submetering1 <- as.numeric(data$submetering1)
data$submetering2 <- as.numeric(data$submetering2)


##create plot 3
png(file="plot3.png",width=480, height=480)
with(data,plot(datetime,submetering1,type="l",xlab="",ylab="Energy sub metering"))
with(data,points(datetime,submetering2,col="red",type="l"))
with(data,points(datetime,submetering3,col="blue",type="l"))
legend("topright",pch="_",col=c("black","red","blue"),
       legend=c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"))
dev.off()