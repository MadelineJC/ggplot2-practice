# Load required libraries
library("ggplot2")

# Import DFO data
View(BurdwoodData)

# Make la graph oo la la
?ggplot
RobGraph <- ggplot(BurdwoodData,aes(x=Year,y=AverageLsalmonismotilesperfish)) +
  geom_point(size=2,shape=8,color="#FF6699")+ 
  labs(title="Av. Lice/Fish, 2011-2019", 
       y="Average L. salmonis motile per fish",
       caption = "Based on data from DFO")+
  scale_x_discrete(breaks=seq(2011,2019,by=1))
RobGraph
