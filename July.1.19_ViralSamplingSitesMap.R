# Loading required packages
library(ggplot2)
library(ggmap)
library(readr)
ViralSamplingSites <- read_csv("Desktop/R_directory/SalmonCoastMapping/ViralSamplingSites.csv")
View(ViralSamplingSites)

#Google API key
register_google(key="INSERT_HERE")

# Get a map
# Map 1 (Broughton Archipelago)
Broughton <- get_map(location=c(lon=-126.510946,lat=50.690903),zoom=10,maptype="roadmap")
Broughton
?ggmap
ggmap(Broughton)+
  geom_point(data = ViralSamplingSites, 
             aes(x = Long, y = Lat, fill = SiteName), 
             size = 2, shape = 21)+
  geom_text(data=ViralSamplingSites,aes(x=Long,y=Lat,label=SiteName),size=3,vjust=2)

# Map 2 (Discovery Islands)
Discovery <- get_map(location=c(lon=-125.259782,lat=50.286223),zoom=9,maptype="roadmap")
Discovery
?ggmap
ggmap(Discovery)+
  geom_point(data = ViralSamplingSites, 
             aes(x = Long, y = Lat, fill = SiteName), 
             size = 1, shape = 21)+
  geom_text(data=ViralSamplingSites,aes(x=Long,y=Lat,label=SiteName),size=2,vjust=1)
