library(tiff); library(raster); library(rgdal); library(sp); library(ggplot2)

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



imgrmx <- crop(imgrm, extent(imgrm, 3500, 3600, 3000, 3100))

imgrm1.1 <- crop(imgrm, extent(imgrm, 0, 777, 0, 638))
imgrm1.2 <- crop(imgrm, extent(imgrm, 778, 1554, 0, 638))
imgrm1.3 <- crop(imgrm, extent(imgrm, 1555, 2331, 0, 638))
imgrm1.4 <- crop(imgrm, extent(imgrm, 2332, 3108, 0, 638))
imgrm1.5 <- crop(imgrm, extent(imgrm, 3109, 3885, 0, 638))
imgrm1.6 <- crop(imgrm, extent(imgrm, 3886, 4662, 0, 638))
imgrm1.7 <- crop(imgrm, extent(imgrm, 4663, 5439, 0, 638))
imgrm1.8 <- crop(imgrm, extent(imgrm, 5440, 6216, 0, 638))
imgrm1.9 <- crop(imgrm, extent(imgrm, 6217, 6993, 0, 638))
imgrm1.10 <- crop(imgrm, extent(imgrm, 6994, 7771, 0, 638))

imgrm2.1 <- crop(imgrm, extent(imgrm, 0, 777, 639, 1276))
imgrm2.2 <- crop(imgrm, extent(imgrm, 778, 1554, 639, 1276))
imgrm2.3 <- crop(imgrm, extent(imgrm, 1555, 2331, 639, 1276))
imgrm2.4 <- crop(imgrm, extent(imgrm, 2332, 3108, 639, 1276))
imgrm2.5 <- crop(imgrm, extent(imgrm, 3109, 3885, 639, 1276))
imgrm2.6 <- crop(imgrm, extent(imgrm, 3886, 4662, 639, 1276))
imgrm2.7 <- crop(imgrm, extent(imgrm, 4663, 5439, 639, 1276))
imgrm2.8 <- crop(imgrm, extent(imgrm, 5440, 6216, 639, 1276))
imgrm2.9 <- crop(imgrm, extent(imgrm, 6217, 6993, 639, 1276))
imgrm2.10 <- crop(imgrm, extent(imgrm, 6994, 7771, 639, 1276))

imgrm3.1 <- crop(imgrm, extent(imgrm, 0, 777, 1277, 1914))
imgrm3.2 <- crop(imgrm, extent(imgrm, 778, 1554, 1277, 1914))
imgrm3.3 <- crop(imgrm, extent(imgrm, 1555, 2331, 1277, 1914))
imgrm3.4 <- crop(imgrm, extent(imgrm, 2332, 3108, 1277, 1914))
imgrm3.5 <- crop(imgrm, extent(imgrm, 3109, 3885, 1277, 1914))
imgrm3.6 <- crop(imgrm, extent(imgrm, 3886, 4662, 1277, 1914))
imgrm3.7 <- crop(imgrm, extent(imgrm, 4663, 5439, 1277, 1914))
imgrm3.8 <- crop(imgrm, extent(imgrm, 5440, 6216, 1277, 1914))
imgrm3.9 <- crop(imgrm, extent(imgrm, 6217, 6993, 1277, 1914))
imgrm3.10 <- crop(imgrm, extent(imgrm, 6994, 7771, 1277, 1914))

imgrm4.1 <- crop(imgrm, extent(imgrm, 0, 777, 1915, 2552))
imgrm4.2 <- crop(imgrm, extent(imgrm, 778, 1554, 1915, 2552))
imgrm4.3 <- crop(imgrm, extent(imgrm, 1555, 2331, 1915, 2552))
imgrm4.4 <- crop(imgrm, extent(imgrm, 2332, 3108, 1915, 2552))
imgrm4.5 <- crop(imgrm, extent(imgrm, 3109, 3885, 1915, 2552))
imgrm4.6 <- crop(imgrm, extent(imgrm, 3886, 4662, 1915, 2552))
imgrm4.7 <- crop(imgrm, extent(imgrm, 4663, 5439, 1915, 2552))
imgrm4.8 <- crop(imgrm, extent(imgrm, 5440, 6216, 1915, 2552))
imgrm4.9 <- crop(imgrm, extent(imgrm, 6217, 6993, 1915, 2552))
imgrm4.10 <- crop(imgrm, extent(imgrm, 6994, 7771, 1915, 2552))

imgrm5.1 <- crop(imgrm, extent(imgrm, 0, 777, 2553, 3190))
imgrm5.2 <- crop(imgrm, extent(imgrm, 778, 1554, 2553, 3190))
imgrm5.3 <- crop(imgrm, extent(imgrm, 1555, 2331, 2553, 3190))
imgrm5.4 <- crop(imgrm, extent(imgrm, 2332, 3108, 2553, 3190))
imgrm5.5 <- crop(imgrm, extent(imgrm, 3109, 3885, 2553, 3190))
imgrm5.6 <- crop(imgrm, extent(imgrm, 3886, 4662, 2553, 3190))
imgrm5.7 <- crop(imgrm, extent(imgrm, 4663, 5439, 2553, 3190))
imgrm5.8 <- crop(imgrm, extent(imgrm, 5440, 6216, 2553, 3190))
imgrm5.9 <- crop(imgrm, extent(imgrm, 6217, 6993, 2553, 3190))
imgrm5.10 <- crop(imgrm, extent(imgrm, 6994, 7771, 2553, 3190))

imgrm6.1 <- crop(imgrm, extent(imgrm, 0, 777, 3191, 3828))
imgrm6.2 <- crop(imgrm, extent(imgrm, 778, 1554, 3191, 3828))
imgrm6.3 <- crop(imgrm, extent(imgrm, 1555, 2331, 3191, 3828))
imgrm6.4 <- crop(imgrm, extent(imgrm, 2332, 3108, 3191, 3828))
imgrm6.5 <- crop(imgrm, extent(imgrm, 3109, 3885, 3191, 3828))
imgrm6.6 <- crop(imgrm, extent(imgrm, 3886, 4662, 3191, 3828))
imgrm6.7 <- crop(imgrm, extent(imgrm, 4663, 5439, 3191, 3828))
imgrm6.8 <- crop(imgrm, extent(imgrm, 5440, 6216, 3191, 3828))
imgrm6.9 <- crop(imgrm, extent(imgrm, 6217, 6993, 3191, 3828))
imgrm6.10 <- crop(imgrm, extent(imgrm, 6994, 7771, 3191, 3828))

imgrm7.1 <- crop(imgrm, extent(imgrm, 0, 777, 3829, 4466))
imgrm7.2 <- crop(imgrm, extent(imgrm, 778, 1554, 3829, 4466))
imgrm7.3 <- crop(imgrm, extent(imgrm, 1555, 2331, 3829, 4466))
imgrm7.4 <- crop(imgrm, extent(imgrm, 2332, 3108, 3829, 4466))
imgrm7.5 <- crop(imgrm, extent(imgrm, 3109, 3885, 3829, 4466))
imgrm7.6 <- crop(imgrm, extent(imgrm, 3886, 4662, 3829, 4466))
imgrm7.7 <- crop(imgrm, extent(imgrm, 4663, 5439, 3829, 4466))
imgrm7.8 <- crop(imgrm, extent(imgrm, 5440, 6216, 3829, 4466))
imgrm7.9 <- crop(imgrm, extent(imgrm, 6217, 6993, 3829, 4466))
imgrm7.10 <- crop(imgrm, extent(imgrm, 6994, 7771, 3829, 4466))

imgrm8.1 <- crop(imgrm, extent(imgrm, 0, 777, 4467, 5104))
imgrm8.2 <- crop(imgrm, extent(imgrm, 778, 1554, 4467, 5104))
imgrm8.3 <- crop(imgrm, extent(imgrm, 1555, 2331, 4467, 5104))
imgrm8.4 <- crop(imgrm, extent(imgrm, 2332, 3108, 4467, 5104))
imgrm8.5 <- crop(imgrm, extent(imgrm, 3109, 3885, 4467, 5104))
imgrm8.6 <- crop(imgrm, extent(imgrm, 3886, 4662, 4467, 5104))
imgrm8.7 <- crop(imgrm, extent(imgrm, 4663, 5439, 4467, 5104))
imgrm8.8 <- crop(imgrm, extent(imgrm, 5440, 6216, 4467, 5104))
imgrm8.9 <- crop(imgrm, extent(imgrm, 6217, 6993, 4467, 5104))
imgrm8.10 <- crop(imgrm, extent(imgrm, 6994, 7771, 4467, 5104))

imgrm9.1 <- crop(imgrm, extent(imgrm, 0, 777, 5105, 5742))
imgrm9.2 <- crop(imgrm, extent(imgrm, 778, 1554, 5105, 5742))
imgrm9.3 <- crop(imgrm, extent(imgrm, 1555, 2331, 5105, 5742))
imgrm9.4 <- crop(imgrm, extent(imgrm, 2332, 3108, 5105, 5742))
imgrm9.5 <- crop(imgrm, extent(imgrm, 3109, 3885, 5105, 5742))
imgrm9.6 <- crop(imgrm, extent(imgrm, 3886, 4662, 5105, 5742))
imgrm9.7 <- crop(imgrm, extent(imgrm, 4663, 5439, 5105, 5742))
imgrm9.8 <- crop(imgrm, extent(imgrm, 5440, 6216, 5105, 5742))
imgrm9.9 <- crop(imgrm, extent(imgrm, 6217, 6993, 5105, 5742))
imgrm9.10 <- crop(imgrm, extent(imgrm, 6994, 7771, 5105, 5742))

imgrm10.1 <- crop(imgrm, extent(imgrm, 0, 777, 5743, 6376))
imgrm10.2 <- crop(imgrm, extent(imgrm, 778, 1554, 5743, 6376))
imgrm10.3 <- crop(imgrm, extent(imgrm, 1555, 2331, 5743, 6376))
imgrm10.4 <- crop(imgrm, extent(imgrm, 2332, 3108, 5743, 6376))
imgrm10.5 <- crop(imgrm, extent(imgrm, 3109, 3885, 5743, 6376))
imgrm10.6 <- crop(imgrm, extent(imgrm, 3886, 4662, 5743, 6376))
imgrm10.7 <- crop(imgrm, extent(imgrm, 4663, 5439, 5743, 6376))
imgrm10.8 <- crop(imgrm, extent(imgrm, 5440, 6216, 5743, 6376))
imgrm10.9 <- crop(imgrm, extent(imgrm, 6217, 6993, 5743, 6376))
imgrm10.10 <- crop(imgrm, extent(imgrm, 6994, 7771, 5743, 6376))



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

#i <- seq(1, 7000, 1000)
#j <- seq(1, 6000, 1000)
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
#par(mfrow=c(2,3))
#lapply(r_out, plot)

NDVI.5.5 <- stack(imgrm5.5)
NDVI.5.5 <- NDVI.5.5/10000
meanNDVI.5.5 <- cellStats(NDVI.5.5, mean)
meanNDVI.5.5 <- as.data.frame(meanNDVI.5.5)
meanNDVI.5.5
NDVI.5.5
dfNDVI.5.5 <- as.data.frame(NDVI.5.5)
colnames(dfNDVI.5.5) <- "NDVI"
dfNDVI.5.5$observation <- 1:nrow(dfNDVI.5.5)

NDVI.1.1 <- stack(imgrm1.1)
NDVI.1.1 <- NDVI.1.1/10000
NDVI.1.2 <- stack(imgrm1.2)
NDVI.1.2 <- NDVI.1.2/10000
NDVI.1.3 <- stack(imgrm1.3)
NDVI.1.3 <- NDVI.1.3/10000
NDVI.1.4 <- stack(imgrm1.4)
NDVI.1.4 <- NDVI.1.4/10000
NDVI.1.5 <- stack(imgrm1.5)
NDVI.1.5 <- NDVI.1.5/10000
NDVI.1.6 <- stack(imgrm1.6)
NDVI.1.6 <- NDVI.1.6/10000
NDVI.1.7 <- stack(imgrm1.7)
NDVI.1.7 <- NDVI.1.7/10000
NDVI.1.8 <- stack(imgrm1.8)
NDVI.1.8 <- NDVI.1.8/10000
NDVI.1.9 <- stack(imgrm1.9)
NDVI.1.9 <- NDVI.1.9/10000
NDVI.1.10 <- stack(imgrm1.10)
NDVI.1.10 <- NDVI.1.10/10000

NDVI.2.1 <- stack(imgrm2.1)
NDVI.2.1 <- NDVI.2.1/10000
NDVI.2.2 <- stack(imgrm2.2)
NDVI.2.2 <- NDVI.2.2/10000
NDVI.2.3 <- stack(imgrm2.3)
NDVI.2.3 <- NDVI.2.3/10000
NDVI.2.4 <- stack(imgrm2.4)
NDVI.2.4 <- NDVI.2.4/10000
NDVI.2.5 <- stack(imgrm2.5)
NDVI.2.5 <- NDVI.2.5/10000
NDVI.2.6 <- stack(imgrm2.6)
NDVI.2.6 <- NDVI.2.6/10000
NDVI.2.7 <- stack(imgrm2.7)
NDVI.2.7 <- NDVI.2.7/10000
NDVI.2.8 <- stack(imgrm2.8)
NDVI.2.8 <- NDVI.2.8/10000
NDVI.2.9 <- stack(imgrm2.9)
NDVI.2.9 <- NDVI.2.9/10000
NDVI.2.10 <- stack(imgrm2.10)
NDVI.2.10 <- NDVI.2.10/10000