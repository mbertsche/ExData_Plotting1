plot2 <- function(){
      
      png('plot2.png', width = 480, height = 480)
      power <- read.table('household_power_consumption.txt', header=T,sep=';', 
                          na.string= '?', stringsAsFactors = F)
      
      powerSubset <- subset(power, power$Date =='2/2/2007' | power$Date == '1/2/2007')
      powerSubset$Date <- as.Date(powerSubset$Date, format = '%d/%m/%Y')
      
      powerSubset$Date_Time <- paste(powerSubset$Date, powerSubset$Time)
      powerSubset$Date_Time <- strptime(powerSubset$Date_Time, format="%Y-%m-%d %H:%M:%S")
      
      with(powerSubset, plot(Date_Time, Global_active_power, 
                             type = 'l', xlab = '', 
                             ylab = "Global Active Power (kilowatts)"))
      
      dev.off()
}