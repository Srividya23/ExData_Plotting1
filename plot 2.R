# Getting, Reading and Formatting Data
usedata <- read.table("./household_power_consumption.txt",
                      header = TRUE,
                      sep = ";")
usedata$Date <- as.Date(usedata$Date, format("%d/%m/%Y"))
usedata <- subset(usedata, Date == "2007-02-01" | Date == "2007-02-02")

# Plot 2
  # Converting time to POSIXct format
combdatetime <- paste(usedata$Date, usedata$Time)
combdatetime <- as.POSIXct(combdatetime)
  # Plotting the data
plot(
  combdatetime,
  usedata$Global_active_power,
  type = "l",
  xlab = "",
  ylab = "Global Active Power (Kilowatts)"
)

# Copying Plot 2 to PNG file
dev.copy(png,
         file = "plot2.png",
         width = 480,
         height = 480)
dev.off()