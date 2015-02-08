###### Project 1 - Plot 3

## Extract Data from specific lines where date is between ( 2007-02-01 and 2007-02-02 )
fdurl <- "household_power_consumption.txt"
fdata <- read.table(fdurl,skip=66637, nrow=2880, na.strings = "?", sep = ";")
fdata$V1 <- as.Date(fdata$V1, format="%d/%m/%Y")

## Convert date/time
dtime <- paste(as.Date(fdata$V1), fdata$V2)
fdata$DTime <- as.POSIXct(dtime)

## Plot 3
with(fdata, {
  plot(V7 ~ DTime, type = "l",xlab = "", ylab = "Energy sub metering")
  lines(V8 ~ DTime,col='red')
  lines(V9 ~ DTime,col='blue')
  legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty=1, lwd=2)
})

## Save to PNG
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()