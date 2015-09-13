************************************
*** Data input and manipulation ****
************************************



setwd("~/R/courseraEDA/Project1")

data <- read.table("power.txt",  	#pre-extracted data for specified dates with grep
	comment.char="#",sep=";",
	stringsAsFactors = FALSE,
	col.names = c("date","time","active","reactive","voltage","intensity","sm1","sm2","sm3"))


	 
data$date <- as.Date(data$date,format="%d/%m/%Y")            #convert date to Date class
dateTime <- paste(data$date,data$time,sep=",")
newDateTime <- strptime(dateTime,format='%Y-%m-%d,%H:%M:%S')	#convert date & time to POSIXlt




************************************
*** Plot 1 *************************
************************************

png("plot1.png",    				# create PNG for the heat map        
  	width = 480,        			# dimensions in pixels
  	height = 480,
  ) 

hist(data$active,col="red",xlab="Global Active Power (kilowatts)",
	main ="Global Active Power",
	font.main=2)

dev.off()               			# close the PNG device



