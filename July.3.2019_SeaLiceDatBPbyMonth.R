# Loading required packages
library(ggplot2)
library(plotly)
library(readr)
BurdwoodData <- read_csv("Desktop/R_directory/Messing Around with ggplot2/BurdwoodData.csv")

# Making the boxplot
BurdwoodData$Month <- as.factor(BurdwoodData$Month)
ByMonthGraph<-ggplot(BurdwoodData, aes(Month, AverageLsalmonisfemalesperfish))+
  geom_boxplot(size=0.5,
               color=c("magenta","springgreen","turquoise","thistle","skyblue","cornflowerblue","salmon","plum","orangered","palevioletred","orchid","lightgoldenrod"),
               outlier.shape=4,
               outlier.size=3)+ 
  scale_x_discrete(name ="Month", 
                   labels=c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"))+
  labs(title="Lice Abundance on Fish by Month, 2011-2019", 
       y="Average L. salmonis females per fish")+
  geom_smooth(method=loess,formula="y~x",se=TRUE, color="tomato", aes(group=1),size=0.5)
ggplotly(ByMonthGraph,tooltip = c("AverageLsalmonisfemalesperfish"))

# See the interactive plot here: file:///Users/MaddieJC/Desktop/R_directory/Messing%20Around%20with%20ggplot2/SeaLiceBoxplotsByMonthInteractive.html
# The non-interactive version of this plot is in my ggplot2-practice repository.
