# Elevatr Prez
# 2018-05-03
# LPB


#Prelims

library(elevatr)  # for elevation inqueries
library(sp)  # for spatial dataset classification
library(rgdal)  # for transformation
library(raster)  # for raster plotting
library(lattice)  # for contour plotting
library(rasterVis)  # also for contour plotting


set_api_key("https://aws.amazon.com/public-datasets/terrain/")


# northwest coordinates
maxlat<- 47.7
minlong<- -121.1

#southeast coordinates
minlat<- 47.3
maxlong<- -120.5

#determine time zone for transformation
epsg<- "+init=EPSG:4410"

# set seed for reproducible results
set.seed(76)
# set number of iterations (greater values=greater resolution)
n <- 200


# create the spatial dataset from scratch

spCoord <- SpatialPoints(data.frame(
  x = runif(n, min=minlong,max=maxlong),
  y = runif(n, min=minlat, max = maxlat)),
  proj4string = CRS("+proj=longlat"))

summary(spCoord)

#Transform coordinate system

#set coordinate reference system using the epsg code, based on UTM zone
sp <-spTransform(spCoord,CRS(epsg))
summary(sp)

is.projected(sp)
proj4string(sp)


plot(spCoord,axes=TRUE)

plot(sp,axes=TRUE)

spdf<- SpatialPointsDataFrame(sp,data.frame(sp),
                              proj4string = proj4string(sp),
                              bbox = NULL)

summary(spdf)


elev<-get_elev_point(spdf,
                     prj = proj4string(spdf),
                     src="epqs")

!is.na(elev$elevation)

raster<- get_elev_raster(spdf,elev$elevation,
                         prj = proj4string(elev),
                         src= "aws",
                         set_api_key("https://aws.amazon.com/public-datasets/terrain/"),
                         z=9)

plot(raster)


image(raster,xlim=c(2000000,4000000),main="Zoomed In")

image(raster,zlim=c(1500,2000),col=terrain.colors(5))


    hist(raster,main="Distribution of Elevation Values",
         col="purple",
         maxpixels=1000)
    
    contour(raster,nlevels=8)
    
    terrain(raster,opt='slope')
















