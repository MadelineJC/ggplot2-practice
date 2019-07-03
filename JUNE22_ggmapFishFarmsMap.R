# Loading required packages
library(ggplot2)
library(ggmap)
# To use Google API/draw from Google Maps; allows communication with Google Maps
register_google(key="INSERT_HERE")
# Specify map qualities 
FishFarms2 <- get_map(location=c(lon=-126.498208,lat=50.745909),
                      zoom=10,scale="auto",maptype = "terrain",
                      source="google",force=ifelse(source=="google",FALSE),
                      messaging=FALSE,urlonly=FALSE,filename="FishFarms2.png",
                      crop=FALSE,color="color",language = "english")
print(FishFarms2)
# To plot FishFarms2, because it's a ggmap object
MapPlease2 <- ggmap(FishFarms2,extent="panel",maprange=FALSE,legend="bottomright",padding=0.2)
MapPlease2
# Adding POINTS!!!
d <- data.frame(lon=c(-126.690667,-126.631333,-126.288167,-126.902000,-126.49333),
                lat=c(50.785167,50.601833,50.654167,50.878167,50.797667))
# Plotting/customizing points with size and colour
MapPlease2 <- MapPlease2 + geom_point(data=d, aes(x=lon, y=lat),size=1.5,
                                      color=c("red","pink","green","blue","yellow"))
MapPlease2
# Supposedly adding labels?!
MapPlease2 <- MapPlease2 + geom_text(data=d,aes(x=lon,y=lat,label=c("Wicklow","Larsen","Doctor","MtSimmons","Burdwoods"))) # Okay I know it's not pretty, but I'm having trouble moving the labels with "nudge_x" and "nudge_y"? You can find these arguments in ?geom_text.
# Final
MapPlease2
