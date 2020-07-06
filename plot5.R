## This first line will likely take a few seconds. Be patient!
if(!exists("NEI")){
  NEI <- readRDS("/Volumes/Hard/www/Exploratory_Data_Project2/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("/Volumes/Hard/www/Exploratory_Data_Project2/Source_Classification_Code.rds")
}
# merge the two data sets 
if(!exists("NEISCC")){
  NEISCC <- merge(NEI, SCC, by="SCC")
}

library(ggplot2)

# Searching for ON-ROAD type in NEI
# Don't actually know it this is the intention, but searching for 'motor' in SCC only gave a subset (non-cars)
subsetNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)

png(file = "/Volumes/Hard/www/Exploratory_Data_Project2/plot5.png", width = 480, height = 480, units = "px")

g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle (type = ON-ROAD) in Baltimore City, Maryland (fips = "24510") from 1999 to 2008')
print(g)
dev.off()

