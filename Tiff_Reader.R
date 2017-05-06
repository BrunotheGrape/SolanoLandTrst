library(tiff); library(raster); library(rgdal); library(sp)

dft <- readTIFF("https://s3.amazonaws.com/share-terravion-com/solanolandtrust/2016-02-25_2310-34_7c98a49f-e6f0-499c-8016-afdac6c58641_Solano-Rush-Ranch-_TIRS_T_4326.tiff", all = TRUE, convert = TRUE)

imgr <- raster("https://s3.amazonaws.com/share-terravion-com/solanolandtrust/2016-02-25_2310-34_7c98a49f-e6f0-499c-8016-afdac6c58641_Solano-Rush-Ranch-_TIRS_T_4326.tiff")
imgr

imgrm <- setMinMax(imgr)
imgrm
cellStats(imgrm, max)
cellStats(imgrm, min)
cellStats(imgrm, range)
imgrm@crs
imgrm@extent

new.extent <- extent(0, 70, 0, 60)





imgrm1 <- crop(imgrm, extent(imgrm, 0, 70, 0, 60))
imgrm2 <- crop(imgrm, extent(imgrm, 70, 140, 0, 60))
imgrmx <- crop(imgrm, extent(imgrm, 3500, 3600, 3000, 3100))


hist(imgrmx, main="Distribution of elevation values", 
     col= "purple", 
     maxpixels=22000000)

plot(imgrm, 
     main="Digital Elevation Model, SJER")

image(imgrm)

image(imgrm, zlim=c(250,300))

col <- terrain.colors(5)
image(imgrm, zlim=c(250,375), main="Digital Elevation Model (imgrm)", col=col)

# add a color map with 5 colors
col=terrain.colors(5)

# add breaks to the colormap (6 breaks = 5 segments)
brk <- c(250, 300, 350, 400,450,500)

plot(imgrm, col=col, breaks=brk, main="imgrm with more breaks")

##  Build index locations for upper left corners of grid:
#i <- seq(1, ncol(r), ncol(r)/3)
#j <- seq(1, nrow(r), nrow(r)/2)
#indices <- expand.grid(i, j)

i <- seq(1, 7000, 1000)
j <- seq(1, 6000, 1000)
indices <- expand.grid(i, j)

##  Crop to these grid locations, storing individual cropped
##    areas in a list object:
#imgrm_out <- lapply(1:nrow(indices), function(x){ 
  #crop(imgrm, 
       #extent(imgrm,
             # indices[x,2], indices[x,2]+nrow(imgrm)/2 - 1,
              #indices[x,1], indices[x,1]+ncol(imgrm)/3 - 1
      # )
 # )
#})


##  Plot all individual rasters:
par(mfrow=c(2,3))
lapply(r_out, plot)