###### Project 1 - Plot 1

## Extract Data from specific lines where date is between ( 2007-02-01 and 2007-02-02 )
fdurl <- "household_power_consumption.txt"
fdata <- read.table(fdurl,skip=66637, nrow=2880, na.strings = "?", sep = ";")
fdata$V1 <- as.Date(fdata$V1, format="%d/%m/%Y")

## Convert date/time
dtime <- paste(as.Date(fdata$V1), fdata$V2)
fdata$DTime <- as.POSIXct(dtime)

## Plot
plot(fdata$V3 ~ fdata$DTime, type = "l",xlab = "", ylab = "Global Active Power (kilowatts)")

## Save to PNG
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()