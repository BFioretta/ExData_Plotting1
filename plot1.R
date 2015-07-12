df <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", 
               colClasses=c("character", "character", rep("numeric",7)), na="?")
df$Time <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df <- subset(df, Date %in% as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d"))

png(filename="plot1.png", width=480, height=480)
hist(df$Global_active_power, 
     col="red", 
     xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")
dev.off()
