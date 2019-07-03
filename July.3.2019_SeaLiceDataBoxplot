# Load required libraries
library("datasets")
library("ggplot2")

# Import DFO data
library(readr)
BurdwoodData <- read_csv("Desktop/R_directory/BurdwoodData.csv")
View(BurdwoodData)

# Something for grouping data
data(BurdwoodData)
BurdwoodData$Year <- as.factor(BurdwoodData$Year)

# Make la graph oo la la
RobGraph <- ggplot(BurdwoodData,aes(x=Year,y=AverageLsalmonismotilesperfish)) +
  geom_boxplot(color=c("red","orange","yellow","green","#33FFFF","blue","#9999FF","purple","pink"))+ 
  labs(title="Av. Lice/Fish, 2011-2019", 
       y="Average L. salmonis motile per fish",
       caption = "Based on data from DFO")+
  scale_x_discrete(name="Year",
                   labels=c("2011","2012","2013","2014","2015","2016","2017","2018","2019"))
RobGraph
