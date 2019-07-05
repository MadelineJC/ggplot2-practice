# Installing rwantshue package to get the many colours
devtools::install_github("hoesler/rwantshue")

# Loading libraries and data
library(ggplot2)
library(rwantshue)
library(readr)
SCOTUSOpinions <- read_csv("Desktop/R_directory/SCOTUSOpinions.csv")
sapply(SCOTUSOpinions, function(year_filed) length(unique(year_filed))) # 205 unique years
summary(SCOTUSOpinions$year_filed) # Length = 34,878

# To use rwantshue package:
# Create a color scheme object
scheme <- iwanthue() # Get the iwanthue singleton
scheme <- iwanthue(seed = 42, force_init = TRUE) # Recreate with a seed
# Customize palette:
color_space <- list(
  c(0, 360),	# Hue range [0,360]
  c(0, 100),		# Chroma range [0,100]
  c(35, 100))		# Lightness range [0,100]
palette <- scheme$hex(
  n = 205, # In this case, sapply told me there are 205 unique values in the "year_filed" column
  force_mode = FALSE,
  quality = 50,
  color_space = color_space)

# A graph? A graph!
SCOTUS <- ggplot(SCOTUSOpinions, aes(x=year_filed,y=scdb_votes_majority)) +
  geom_col(color=sample(palette, size=length(SCOTUSOpinions$year_filed),replace=TRUE))
SCOTUS

# Making a df with just year_filed and scdb_votes_majority
YearMajDF <- data.frame(x=SCOTUSOpinions$year_filed,y=SCOTUSOpinions$scdb_votes_majority)
# Omitting lines with NAs
YearMajDF <- na.omit(YearMajDF)
nrow(YearMajDF) # Number of rows = 33626
# Attempting to graph
SCOTUS2 <- ggplot(YearMajDF,aes(x=x,y=y))+
  geom_col(color=sample(palette,size=33626,replace=TRUE))+
  labs(title = "Votes toward majority opinion by Year",x="Year",y="Votes Toward Majority Opinion")+
  scale_x_continuous(breaks=seq(1795,2020,by=25))
SCOTUS2

# The above graph is a bit useless considering there are multiple rulings in a year. Let's try adding a column for average votes toward the majority opinion per year... 

AvByYr <- data.frame(tapply(YearMajDF$y , YearMajDF$x, mean))
View(AvByYr)
nrow(AvByYr) # 205
write.csv(AvByYr,'/Users/MaddieJC/Desktop/R_directory/AvByYrData.csv', row.names = FALSE)
# This is a very round a'bout way to do this but I couldn't figure out how to do a simple thing so here we are... I'm just going to change this as a .csv then import...
AvByYr2 <- read_csv("Desktop/R_directory/AvByYrData.csv")
View(AvByYr2)

# Now, finally, the graphhhhhhh
SCOTUS3 <- ggplot(AvByYr2,aes(x=Year,y=AvVoteMaj))+
  geom_col(color=palette,fill=palette)+
  labs(title = "SCOTUS Opinions",x="Year",y="Av. Votes Toward Majority Opinion")+
  geom_smooth(method=lm,se=TRUE, color="black", aes(group=1),size=0.5)+
  scale_x_continuous(breaks=seq(1795,2020,by=25))+
  scale_y_continuous(breaks=seq(0,10,by=1))
SCOTUS3 # God and Jesus finally omfg lol
