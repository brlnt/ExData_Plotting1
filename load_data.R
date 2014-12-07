sourceURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
localZipFile <- "household_power_consumption.zip"
localTxtFile <- "household_power_consumption.txt"
preppedData <- "prepped_data.csv"

if(file.exists(preppedData)) {
  df <- read.csv(preppedData)
  df$DateTime <- strptime(df$DateTime, "%Y-%m-%d %H:%M:%S")
} else {
  
  if(!file.exists(localZipFile)) {
    download.file(sourceURL, destfile=localZipFile, method="curl")
  }    
  unzip(localZipFile, "household_power_consumption.txt")
  
  df <-   read.table('household_power_consumption.txt', header=TRUE,
                     sep=';', na.strings='?',
                     colClasses=c(rep('character', 2), 
                                  rep('numeric', 7)
                                  )
                     ) 
  
  df <- df[(df$Date == "1/2/2007") | (df$Date == "2/2/2007"),]
  
  df$DateTime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
  
  write.csv(df, preppedData)
  
}


