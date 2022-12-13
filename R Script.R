rawdata <- read.csv("OA2_PM25_2013.csv")


#load packages
install.packages("tmap")
install.packages("sf")
install.packages("dplyr")
library(tmap)
library(sf)
library(dplyr)


#shapefile
London_OA <- read_sf("OA_2011_London_gen_MHW.shp")
View(London_OA)
qtm(London_OA)
tmap_mode(mode = "plot")


#merging map data
pollutionmap <- merge(London_OA, rawdata, by.x = "OA11CD", by.y = "OA11CD")


#tmap
library(tmap)
library(viridis)
library(RColorBrewer)
tmap_mode(mode="plot")
m1 <- tm_shape(pollutionmap, alpha=0.1, col = "white")+
  tm_borders(alpha=0.1, col = "white")+
  tm_polygons(col = "PM252013me", id ="OA11CD", palette = "Oranges" )+
  tm_layout(title = "", title.size = 1, legend.title.size = 0.0001 )+
  tm_layout(bg.color = "#1f2b3b")+
  tm_layout(frame=FALSE)+
  tm_layout(fontfamily="Arial", fontface = 2)
m1

