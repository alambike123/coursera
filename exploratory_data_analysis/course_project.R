## Question 1: Total Emissions
    ##Read necessary packages
    library(data.table)
    library(ggplot2)
    
    ## Create temporary directory and placeholder folder
    td = tempdir()
    tf = tempfile(tmpdir = td, fileext = ".zip")
   
    ## Download file into placeholder file in temp dir
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", tf)
    
    ## Get name of first file in zip archive
    fname = unzip(tf, list = TRUE)$Name[1]
    sname = unzip(tf, list = TRUE)$Name[2]
    
    ## Unzip files to temporary directory
    unzip(tf, files = fname, exdir = td, overwrite = TRUE)
    unzip(tf, files = sname, exdir = td, overwrite = TRUE)
   
    ## Read unzipped data into R
    NEI <- readRDS(file.path(td, sname))
    SCC <- readRDS(file.path(td, fname))
  
    ## Create dataframe containing emission sums by year
    dataframe1 <- NEI
    dataframe2 <- data.table(dataframe1)[, sum(Emissions), by = year]
    
    ## line qplot for total emissions by year
    ggplot(dataframe2, aes(year, V1)) + geom_point() + geom_smooth() + xlab("Year") + ylab("Emissions (tons)") + 
        ggtitle("PM25 Emissions by Year")
    
    ## Copy plot to png
    dev.copy(png, file = "plot1.png", width = 480, height = 480)
    dev.off()
    
## Question 2: Baltimore
    ## Create dataframe containing emission sums by year for Baltimore
    dataframe1 <- NEI[NEI$fips == "24510",]
    dataframe2 <- data.table(dataframe1)[, sum(Emissions), by = year]
    
    ## Create line plot showing Baltimore emissions by year
    ggplot(dataframe2, aes(year, V1)) + geom_point() + geom_smooth() + xlab("Year") + ylab("Emissions (tons)") +
        ggtitle("Baltimore PM25 Emissions by Year")
    
    ## Copy plot to png
    dev.copy(png, file = "plot2.png", width = 480, height = 480)
    dev.off()

## Question 3: Baltimore by Type   
    ## Create dataframe containing emission sums by year for Baltimore
    dataframe1 <- NEI[NEI$fips == "24510",]
    dataframe2 <- data.table(dataframe1)[, sum(Emissions), by = c("year","type")]
    
    ## Create line graph showing Baltimore emissions by year and type
    ggplot(dataframe2, aes(year, V1)) + geom_point() + geom_smooth() + xlab("Year") + ylab("Emissions (tons)") +
        ggtitle("Baltimore PM25 Emissions by Year and Type") + facet_grid(.~type)
    
    ## Copy plot to png
    dev.copy(png, file = "plot3.png", width = 480, height = 480)
    dev.off()

## Question 4: Coal Sources
    ## Create SCC dataframe limited to coal sources
    SCC.coal <- SCC[grepl("coal", SCC$SCC.Level.Three, ignore.case=TRUE) |
                             grepl("Lignite", SCC$SCC.Level.Three, ignore.case=TRUE),]
    
    ## Subset NEI for coal sources only
    NEI.coal <- subset(NEI, SCC %in% SCC.coal$SCC)
    
    ## Create dataframe containing coal emission sums by year
    dataframe1 <- NEI.coal
    dataframe2 <- data.table(dataframe1)[, sum(Emissions), by=c("year")]
    
    ## Create line graph showing coal emissions by year
    ggplot(dataframe2, aes(year, V1)) + geom_point() + geom_smooth() + xlab("Year") + ylab("Emissions (tons)") +
        ggtitle("PM25 Coal Emissions by Year")
    
    ## Copy plot to png
    dev.copy(png, file = "plot4.png", width = 480, height = 480)
    dev.off()
    
## Question 5: Baltimore Motor Vehicle
    ## Create SCC dataframe limited to motor sources
    SCC.motor <- SCC[grepl("Vehicle", SCC$EI.Sector, ignore.case=TRUE) |
                             grepl("Motor", SCC$EI.Sector, ignore.case=TRUE), ]
    
    ## Subset NEI for motor sources only
    NEI.motor <- subset(NEI, SCC %in% SCC.motor$SCC)
    
    ## Create dataframe containing motor emission sums by year
    # explore scalable way to assign values based on conditional
    dataframe1 <- NEI.motor[NEI.motor$fips=="24510",]
    dataframe2 <- data.table(dataframe1)[, sum(Emissions), by=c("year")]
    
    ## Create line graph showing motor emissions by year
    ggplot(dataframe2, aes(year, V1)) + geom_point() + geom_smooth() + xlab("Year") + ylab("Emissions(tons)") +
        ggtitle("Baltimore PM25 Motor Emissions by Year")
    
    ## Copy plot to png
    dev.copy(png, file = "plot5.png", width = 480, height = 480)
    dev.off()

## Question 6: Baltimore vs. LA Motor Vehicle 
    ## Create SCC dataframe limited to motor sources
    SCC.motor <- SCC[grepl("Vehicle", SCC$EI.Sector, ignore.case=TRUE) |
                              grepl("Motor", SCC$EI.Sector, ignore.case=TRUE), ]
    
    ## Subset NEI for motor sources only
    NEI.motor <- subset(NEI, SCC %in% SCC.motor$SCC)
    
    ## Create dataframe containing motor emission sums by year for Baltimore and LA
    dataframe1 <- NEI.motor[NEI.motor$fips %in%  c("24510","06037"),]
    dataframe2 <- data.table(dataframe1)[, sum(Emissions), by=c("year","fips")]
    dataframe$fips <- as.character(dataframe2$fips)
    dataframe2$fips[dataframe2$fips == "24510"] <- "Baltimore"
    dataframe2$fips[dataframe2$fips == "06037"] <- "LA"
    
    ## Create line graph showing total emissions by year with LA and Baltimore facets
    ggplot(dataframe2, aes(year, log(V1))) + geom_point() + geom_smooth() + xlab("Year") + ylab("Emissions (log)") +
        ggtitle("PM25 Motor Emissions by Year") + facet_grid(.~fips)
    
    ## Copy plot to png
    dev.copy(png, file = "plot6.png", width = 480, height = 480)
    dev.off()