##R Script for Exploratory Data Analysis Course Project 1

##Plot 1

##load data
initial <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
initial$Date <- as.Date(initial$Date,"%d/%m/%Y")
data2 <- subset(initial,Date=="2007-02-01" | Date=="2007-02-02")
remove(initial)

##clean up col names
names(data) <- gsub("_","",names(data))
names(data) <- tolower(names(data))

##make appropriate variables numeric
data$globalactivepower <- as.character(data$globalactivepower)
data$globalactivepower <- as.numeric(data$globalactivepower)

##create plot 1
png(file="plot1.png",width=480, height=480)
with(data, hist(globalactivepower, main="Global Active Power",
     xlab="Global Active Power (kilowatts)",col="red"))
dev.off()

