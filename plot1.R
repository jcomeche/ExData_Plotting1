plot1 <- function(){
  
  ## Read the raw data set
  
  initialdataset <- read.table("household_power_consumption.txt",sep=";",header=T,na.strings=c("?"),colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
  
  
  ## Change the format of the Date column
  
  initialdataset$Date <- as.Date(initialdataset$Date, "%d/%m/%Y")
  
  
  ## Extract data with date 2007-02-01 y 2007-02-02
  
  dataset1 <- initialdataset[initialdataset$Date=="2007-02-01",]
  dataset2 <- initialdataset[initialdataset$Date=="2007-02-02",]
  dataset <- rbind(dataset1,dataset2)
  
  
  ## Create the histogram in the png file
  
  png(file="plot1.png",width=480,height=480)
  hist(dataset$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
  dev.off()
  
}