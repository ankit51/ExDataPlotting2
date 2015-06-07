#Read Data
hpc <- read.csv("C:/Users/ankit/Downloads/household_power_consumption.txt", sep=";")

#Tidy Data
hpc$Date <- as.character(hpc$Date)

hpc1<-hpc[hpc$Date == "1/2/2007",]
hpc1$Date <- "2007-02-01"
hpc2<-hpc[hpc$Date == "2/2/2007",]
hpc2$Date <- "2007-02-02"
hpc3<-rbind(hpc1,hpc2)

hpc3$Global_active_power <- as.character(hpc3$Global_active_power)
hpc3$Global_active_power <- as.numeric(hpc3$Global_active_power)
hpc3$Global_reactive_power <- as.character(hpc3$Global_reactive_power)
hpc3$Global_reactive_power <- as.numeric(hpc3$Global_reactive_power)
hpc3$Voltage <- as.character(hpc3$Voltage)
hpc3$Voltage <- as.numeric(hpc3$Voltage)

hpc3$datetime <- paste(Date,Time, sep=' ')
hpc3$datetime <- strptime(hpc3$datetime, format="%Y-%m-%d %H:%M:%S")

#plot data
png(filename = "plot2.png",
    width = 480, height = 480, units = "px")
with(hpc3, plot(datetime, Global_active_power, type="l",ylab='Global Active Power (kilowatts)'))
dev.off()