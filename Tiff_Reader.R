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

hist(imgrm, main="Distribution of elevation values", 
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