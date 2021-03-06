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

# do plot 1 & save png
hist(   subsetData$Global_active_power
       ,col="red"
       ,xlab="Global Active Power (kilowatts)"
       ,main="Global Active Power"              )
dev.copy(png,file="plot1.png")
dev.off()