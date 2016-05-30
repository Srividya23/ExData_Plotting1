# Getting, Reading and Formatting Data
usedata <- read.table("./household_power_consumption.txt",
             header = TRUE,
             sep = ";")
usedata$Date <- as.Date(usedata$Date, format("%d/%m/%Y"))
usedata <- subset(usedata, Date == "2007-02-01" | Date == "2007-02-02")

# plot 1
usedata$Global_active_power <- as.numeric(as.character(usedata$Global_active_power))
par(mfrow = c(1,1))
hist(
  usedata$Global_active_power,
  col = "Red",
  xlab = "Global Active Power (Kilowatts)",
  main = "Global Active Power"
)

# Copying Plot 1 to PNG file
dev.copy(png,
         file = "plot1.png",
         width = 480,
         height = 480)
dev.off()
