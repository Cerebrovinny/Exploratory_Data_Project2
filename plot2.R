## This first line will likely take a few seconds. Be patient!
if(!exists("NEI")){
  NEI <- readRDS("/Volumes/Hard/www/Exploratory_Data_Project2/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("/Volumes/Hard/www/Exploratory_Data_Project2/Source_Classification_Code.rds")
}

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

subsetNEI  <- NEI[NEI$fips=="24510", ]

aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)

png(file = "/Volumes/Hard/www/Exploratory_Data_Project2/plot2.png", width = 480, height = 480, units = "px")

barplot(height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' in the Baltimore City, MD emissions at various years'))
dev.off()