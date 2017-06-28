library(tiff); library(raster); library(rgdal); library(sp) 
library(ggplot2); library(rasterVis)

imgr <- raster("https://s3.amazonaws.com/share-terravion-com/solanolandtrust/2016-02-25_2310-34_7c98a49f-e6f0-499c-8016-afdac6c58641_Solano-Rush-Ranch-_TIRS_T_4326.tiff")

wlc1 <- raster("https://s3.amazonaws.com/share-terravion-com/solanolandtrust/2016-07-05_1746-30_a651f248-3fdc-4c24-9f53-ef3323596250_Wallace_Brazelton-0121150110_NDVI_N-R3_4326.tiff")
wlc2 <- raster("https://s3.amazonaws.com/share-terravion-com/solanolandtrust/2016-07-05_1750-55_d7b6d3ce-8136-4d4a-a2f2-743f3dc719ad_Wallace_Brazelton-0121150130_NDVI_N-R3_4326.tiff")
wlc3 <- raster("https://s3.amazonaws.com/share-terravion-com/solanolandtrust/2016-07-05_1746-30_c7ba0840-6d5a-453e-9b82-34628c024a40_Wallace_Brazelton-0121170020_NDVI_N-R3_4326.tiff")
wlc4 <- raster("https://s3.amazonaws.com/share-terravion-com/solanolandtrust/2016-07-05_1746-30_5c63f465-2100-482c-8b36-248fec10017d_Wallace_Brazelton-0121170110_NDVI_N-R3_4326.tiff")
wlc5 <- raster("https://s3.amazonaws.com/share-terravion-com/solanolandtrust/2016-07-05_1746-30_25152dc3-f305-4fb7-9c38-688d3ab9a2cc_Wallace_Brazelton-0121170120_NDVI_N-R3_4326.tiff")
wlc6 <- raster("https://s3.amazonaws.com/share-terravion-com/solanolandtrust/2016-07-05_1746-30_a651f248-3fdc-4c24-9f53-ef3323596250_Wallace_Brazelton-0121150110_NDVI_N-R3_4326.tiff")
wlc7 <- raster("https://s3.amazonaws.com/share-terravion-com/solanolandtrust/2016-07-05_1750-55_d7b6d3ce-8136-4d4a-a2f2-743f3dc719ad_Wallace_Brazelton-0121150130_NDVI_N-R3_4326.tiff")
wlc8 <- raster("https://s3.amazonaws.com/share-terravion-com/solanolandtrust/2016-07-05_1746-30_c7ba0840-6d5a-453e-9b82-34628c024a40_Wallace_Brazelton-0121170020_NDVI_N-R3_4326.tiff")
wlc9 <- raster("https://s3.amazonaws.com/share-terravion-com/solanolandtrust/2016-07-05_1746-30_5c63f465-2100-482c-8b36-248fec10017d_Wallace_Brazelton-0121170110_NDVI_N-R3_4326.tiff")
wlc10 <- raster("https://s3.amazonaws.com/share-terravion-com/solanolandtrust/2016-07-05_1746-30_25152dc3-f305-4fb7-9c38-688d3ab9a2cc_Wallace_Brazelton-0121170120_NDVI_N-R3_4326.tiff")

wlc1m <- setMinMax(wlc1)
wlc1m
cellStats(wlc1m, max)
cellStats(wlc1m, min)
cellStats(wlc1m, range)
wlc1m@crs
wlc1m@extent
cellStats(wlc1m, mean)
cellStats(wlc1m, median)

hist(wlc1m, main="Distribution of elevation values", 
     col= "purple", 
     maxpixels=22000000)

plot(wlc1m, 
     main="Digital Elevation Model, SJER")

image(wlc1m)

col <- terrain.colors(5)
image(wlc1m, main="Digital Elevation Model (wlc1m)", col=col)

brk <- c(250, 300, 350, 400,450,500)

plot(wlc1m, col=col, breaks=brk, main="wlc1m with more breaks")
