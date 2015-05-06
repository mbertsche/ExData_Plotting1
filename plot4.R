plot4 <- function(){
      
      png('plot4.png', width = 480, height = 480)
      
      power <- read.table('household_power_consumption.txt', header=T,sep=';', 
                          na.string= '?', stringsAsFactors = F)
      
      powerSubset <- subset(power, power$Date =='2/2/2007' | power$Date == '1/2/2007')
      powerSubset$Date <- as.Date(powerSubset$Date, format = '%d/%m/%Y')
      
      powerSubset$Date_Time <- paste(powerSubset$Date, powerSubset$Time)
      powerSubset$Date_Time <- strptime(powerSubset$Date_Time, format="%Y-%m-%d %H:%M:%S")
      
      par(mfrow=c(2,2))
      
      with(powerSubset, plot(Date_Time, Global_active_power, 
                             type = 'l', xlab = '', 
                             ylab = "Global Active Power (kilowatts"))
      
      with(powerSubset, plot(Date_Time, Voltage, 
                             type = 'l', xlab = 'datetime', 
                             ylab = 'Volatage'))
      
      with(powerSubset, plot(Date_Time, Sub_metering_1,
                             type = 'l', xlab = '', 
                             ylab = 'Energy sub metering'))
      
      with(powerSubset, lines(Date_Time, Sub_metering_2, col = 'red'))
      
      with(powerSubset, lines(Date_Time, Sub_metering_3, col = 'blue'))
      
      legend("topright", 
             legend = c("Sub_metering_1",'Sub_metering_2','Sub_metering_3'), 
             col = c('black','red','blue'), lwd = 5, bty = 'n')
      
      with(powerSubset, plot(Date_Time, Global_reactive_power, 
                             type = 'l', xlab = 'datetime', 
                             ylab = "Global_reactive_power"))
                             
      
      dev.off()
}