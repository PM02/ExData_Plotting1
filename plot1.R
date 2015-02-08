###### Project 1 - Plot 1

## Extract Data from specific lines where date is between ( 2007-02-01 and 2007-02-02 )
fdurl <- "household_power_consumption.txt"
fdata <- read.table(fdurl,skip=66637, nrow=2880, na.strings = "?", sep = ";")

## Create the Histogram
hist(fdata$V3, col = "red",main="Global Active Power",  xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

## Save to PNG
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()