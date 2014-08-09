plot2 <- function(){
  
  ## Read the raw data set
  
  initialdataset <- read.table("household_power_consumption.txt",sep=";",header=T,na.strings=c("?"),colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
  
  
  ## Change the format of the Time column
  
  initialdataset$Time <- strptime(paste(initialdataset$Date,initialdataset$Time),"%d/%m/%Y %H:%M:%S")
  
  
  ## Change the format of the Date column
  
  initialdataset$Date <- as.Date(initialdataset$Date, "%d/%m/%Y")
  
  
  ## Extract data with date 2007-02-01 y 2007-02-02
  
  dataset1 <- initialdataset[initialdataset$Date=="2007-02-01",]
  dataset2 <- initialdataset[initialdataset$Date=="2007-02-02",]
  dataset <- rbind(dataset1,dataset2)
  
  
  ## Create the plot in the png file
  
  png(file="plot2.png",width=480,height=480)
  Sys.setlocale("LC_TIME", "English")
  with(dataset,plot(Time,Global_active_power,xlab="",ylab="Global Active Power (kilowatts)", pch=46, type="o"))
  dev.off()
  
}

