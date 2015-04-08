##R Script for Exploratory Data Analysis Course Project 1

##Plot 2

##load data
initial <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
initial$Date <- as.Date(initial$Date,"%d/%m/%Y")
data <- subset(initial,Date=="2007-02-01" | Date=="2007-02-02")
remove(initial)

##clean up col names
names(data) <- gsub("_","",names(data))
names(data) <- tolower(names(data))

##make variables appropriate classes
data$globalactivepower <- as.character(data$globalactivepower)
data$globalactivepower <- as.numeric(data$globalactivepower)
data$date <- as.character(data$date)
data$time <- as.character(data$time)
data$datetime <- with(data,paste(date,time))
data$datetime <- with(data,strptime(datetime,"%Y-%m-%d %H:%M:%S"))

##create plot 2
png(file="plot2.png",width=480, height=480)
with(data, plot(datetime,globalactivepower,type="l",
                xlab="",ylab="Global Active Power (kilowatts)"))
dev.off()
