###### Project 1 - Plot 4

## Extract Data from specific lines where date is between ( 2007-02-01 and 2007-02-02 )
fdurl <- "household_power_consumption.txt"
fdata <- read.table(fdurl,skip=66637, nrow=2880, na.strings = "?", sep = ";")
fdata$V1 <- as.Date(fdata$V1, format="%d/%m/%Y")

## Convert date/time
dtime <- paste(as.Date(fdata$V1), fdata$V2)
fdata$DTime <- as.POSIXct(dtime)

## Plot 4
par(mfcol = c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0), cex = 0.7)
with(fdata, {
  plot(fdata$V3 ~ fdata$DTime, type = "l",xlab = "", ylab = "Global Active Power")
  plot(V7 ~ DTime, type = "l",xlab = "", ylab = "Energy sub metering")
  lines(V8 ~ DTime,col='red')
  lines(V9 ~ DTime,col='blue')
  legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         col = c("black","red","blue"), lty=1, lwd=2, bty = "n", cex = 0.75)
  
  plot(V5 ~ DTime, type = "l",xlab = "datetime", ylab = "Voltage")
  plot(V4 ~ DTime, type = "l",xlab = "datetime", ylab = "Global_reactive_power")
  
})

## Save to PNG
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()