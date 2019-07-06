# Loading libraries and data
library(ggplot2)
library(emoGG) # Because I am T-R-A-S-H
library(plotly) # Because I want to make the plot interactive
library(readr)
YMMC <- read_csv("Desktop/R_directory/Messing Around with ggplot2/YMMC.csv")

# Let's do this again I guess lol
Plot <- ggplot(YMMC, aes(Month2)) + 
  geom_line(aes(y = AvMotMonth, colour = "#9933FF")) + 
  geom_line(aes(y = AvChalMonth, colour = "#CC3333"))+
  geom_emoji(aes(y=AvMotMonth),emoji="1f41b")+
  geom_emoji(aes(y=AvChalMonth),emoji="1f41e")+
  labs(title="Motile vs. Chalimus Lice per Fish, 2011-2019",x="Month",y="Lice Per Fish")+
  scale_x_continuous(breaks=seq(1,12,by=1),labels = c("January","February","March","April","May","June","July","August","September","October","November","December"))+
  scale_color_manual(labels = c("L. salmonis motiles", "Chalimus motiles"), values = c("#9933FF", "#CC3333"),name="Louse Type")
Plot
