BurdwoodData$Month <- as.factor(BurdwoodData$Month)
ByMonthGraph<-ggplot(BurdwoodData, aes(Month, AverageLsalmonisfemalesperfish))+
  geom_boxplot(size=0.5,
               color=c("magenta","springgreen","turquoise","thistle","skyblue","cornflowerblue","salmon","plum","orangered","palevioletred","orchid","lightgoldenrod"),
               outlier.shape=4,
               outlier.size=3)+ 
  scale_x_discrete(name ="Month", 
                   labels=c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"))+
  labs(title="Lice Abundance on Fish by Month, 2011-2019", 
       y="Average L. salmonis females per fish")
ByMonthGraph
