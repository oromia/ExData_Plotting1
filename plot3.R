# read data 
fileUrl <- "household_power_consumption.txt"
temp <- read.table(fileUrl, sep=";", nrows = 100, header=TRUE);
classes <- sapply(temp,class)
data <- read.table(fileUrl, sep=";", na.strings = "?", colClasses = classes, header=TRUE);

# add new dataTime column by merging date & time columns 
data$DateTime <- as.POSIXct(strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S"))

# get subset data for dates 2007-02-01 & 2007-02-02
data[,1]=as.Date(data$Date,"%d/%m/%Y")
subsetData = subset(data,data$Date %in% as.Date(c("2007-02-01","2007-02-02")))

# do plot 3 & save png
plot(   subsetData$DateTime
       ,ylab="Energy sub metering"
       ,subsetData[,7]
       ,type="l"
       ,xlab=" "  )
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("Black","Red","Blue"),lwd=1)
lines(col="Red",subsetData[,10],subsetData[,8])
lines(col="Blue",subsetData[,10],subsetData[,9])
dev.copy(png,file="plot3.png")
dev.off()

