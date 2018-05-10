# ELEVATR demo
# 2018-05-01
# LPB

#prelims
  library(elevatr)  # for elevation inqueries
  library(sp)  # for spatial dataset classification
  library(rgdal)  # for transformation
  library(raster)  # for raster plotting
  library(lattice)  # for contour plotting
  library(rasterVis)  # also for contour plotting

  # identify application programming interface for raster creation
  set_api_key("https://aws.amazon.com/public-datasets/terrain/")
  
  
  # First, choose your own adventure!
  #northwest coordinates
  maxlat<- 47.7
  minlong<- -121.1
  #southeast coordinates
  minlat<- 47.3
  maxlong<- -120.5
  
  #determine time zone for transformation
  epsg<-"+init=EPSG:4410"
  
  #Why is this important? Projection required to identify gravitational threshold//sea level
  
    # set seed for reproducible results
    set.seed(76)
    # set number of iterations (the higher the greater resolution)
    n<- 200
  
  #creating a spatial dataset from scratch
  spCoord <- SpatialPoints(data.frame(x = runif(n, min = minlong, max = maxlong), 
                   y = runif(n, min = minlat, max = maxlat)),proj4string = CRS("+proj=longlat"))
  summary(spCoord) # notice projection = false
  
  # Transform coordinate system
  sp <-spTransform(spCoord,CRS(epsg))
  summary(sp)
  
  # Compare geographic vs. projected coordinate system
  plot(spCoord, axes=TRUE)
  plot(sp, axes=TRUE)
  
  # If read in file from csv, how can projecton be checked?
  is.projected(sp) # check to make sure the data frame was projected
  proj4string(sp)  #query CRS projection
  projection(sp)
  

  # now, use data frame to set up spatial dataframe
  spdf<-SpatialPointsDataFrame(sp, data.frame(sp),
                         proj4string=proj4string(sp),
                         bbox = NULL)
  
  #review summary
  summary(spdf)
  
  # access elevation information through epqs source, Mapzen down
  elev<-get_elev_point(spdf,
                       prj = proj4string(spdf),
                       src = "epqs")
  
  #check projection
  is.projected(elev)
   #check to make sure there are no NA values
  head(elev)
  !is.na(elev$elevation)
  # check summary 
  summary(elev)

  
  # API can also be defined on a case by case basis
  # this function can also input a raster-- useful when working internationally
  raster<-get_elev_raster(spdf,elev$elevation, prj = proj4string(elev), 
                  src = "aws",
                  set_api_key("https://aws.amazon.com/public-datasets/terrain/"),
                  z=5)   

  # view elevation through color scale, try playing with the zoom
  plot(raster)
  
  # the distribution of values in the raster
  hist(raster, main="Distribution of elevation values", 
       col= "purple", 
       maxpixels=10000)
  
  ############################################
  
  
  ############################################
  #Create Contour graphs using lattice
  contour<-contour(raster,nlevels=8)
  
  library(rasterVis)
  contourplot(raster,labels()

    
  })
  # you can imagine being able to add a temperature graph
  ###########################################
  
  
  
  
  ###########################################
  # Geographic characteristics
  
  # What is the minimum or maximum slope in this grid?
  terrain(raster,opt = 'slope')
    # can also be used to evaluate aspect ratio, terrain ruggedness index,
    # topographic position index, roughness, and flow direction
 
  # Determine flowpath from highest point
     # create flow direction output to pass through flowpath
  flowdir<- terrain(raster,opt='flowdir')
  print(flowdir)
  
    # query coordinate for maximum elevation
  maxpointx<-elev$x[which.max(elev$elevation)]
  maxpointy<-elev$y[which.max(elev$elevation)]

  cell<-cellFromRow(elev,which.max(elev$elevation))
  
    # pass flow direction output and max elevation coordinate through flowPath
  flowPath(flowdir,cell)
  ###########################################
  
  
  
  
  
  