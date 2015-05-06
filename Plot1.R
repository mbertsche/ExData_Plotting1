plot1 <- function(){
      
      png('plot1.png', width = 480, height = 480)
      power <- read.table('household_power_consumption.txt', header=T,sep=';', 
                          na.string= '?')
      
      powerSubset <- subset(power, power$Date =='2/2/2007' | power$Date == '1/2/2007')
      
      with(powerSubset, hist(Global_active_power,breaks = 20, freq= T, 
                             col= 'red', main = 'Global Active Power', 
                             xlab = 'Global Active Power (kilowatts)'))
      
      dev.off()
}