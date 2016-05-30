# Getting, Reading and Formatting Data
usedata <- read.table("./household_power_consumption.txt",
                      header = TRUE,
                      sep = ";")
usedata$Date <- as.Date(usedata$Date, format("%d/%m/%Y"))
usedata <- subset(usedata, Date == "2007-02-01" | Date == "2007-02-02")

# plot 3
usedata$Sub_metering_1 <-  as.numeric(as.character(usedata$Sub_metering_1))
usedata$Sub_metering_2 <-  as.numeric(as.character(usedata$Sub_metering_2))
usedata$Sub_metering_3 <-  as.numeric(as.character(usedata$Sub_metering_3))
par(mfrow = c(1, 1))

# Converting time to POSIXct format
combdatetime <- paste(usedata$Date, usedata$Time)
combdatetime <- as.POSIXct(combdatetime)

# plotting the data
plot(
  combdatetime,
  usedata$Sub_metering_1,
  type = "n",
  xlab = "",
  ylab = "Energy sub metering"
)
lines(combdatetime, usedata$Sub_metering_1)
lines(combdatetime, usedata$Sub_metering_2, col = "blue")
lines(combdatetime, usedata$Sub_metering_3, col = "red")
legend(
  "topright",
  c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  lty = c(1, 1, 1),
  col = c("black", "blue", "red"),
  adj = c(0, 0)
)

# Copying Plot 3 to PNG file
dev.copy(png,
         file = "plot3.png",
         width = 480,
         height = 480)
dev.off()
