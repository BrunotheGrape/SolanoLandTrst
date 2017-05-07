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
par(mfrow=c(2,3))
lapply(r_out, plot)