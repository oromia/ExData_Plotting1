
#file stored on local working directory
fileUrl <- "household_power_consumption.txt"
############################################################

#lod file to data table
tdt <- read.table(fileUrl, sep=";", nrows = 100, header=TRUE);
head(tdt)
classes <- sapply(initial,class)
dt <- read.table(fileUrl, sep=";", header=TRUE);
############################################################

#subset data by dates 2007-02-01 to 2007-02-02


