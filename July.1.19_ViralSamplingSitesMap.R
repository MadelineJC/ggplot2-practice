# Loading required packages
library(ggplot2)
library(ggmap)

#Google API key
register_google(key="INSERT_HERE")

# Loading dataframe
View(ViralSamplingSites)
ViralSamplingSites <- data.frame

# Get a map
Broughton_Discovery <- get_map(location=c(lon=-126.498477,lat=50.746038),zoom="auto",maptype="roadmap")
Broughton_Discovery
?ggmap
ggmap(Broughton_Discovery)+
  geom_point(data = ViralSamplingSites, 
             aes(x = Long, y = Lat, fill = SiteName), 
             size = 2, shape = 21)+
  geom_text(data=ViralSamplingSites,aes(x=Long,y=Lat,label=SiteName),size=3,vjust=2)
