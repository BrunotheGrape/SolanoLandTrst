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

NDVI.1 <- stack(wlc1)
NDVI.1 <- NDVI.1/10000
meanNDVI.1 <- cellStats(NDVI.1, mean)
meanNDVI.1 <- as.data.frame(meanNDVI.1)
meanNDVI.1
medianNDVI.1 <- cellStats(NDVI.1, median)
medianNDVI.1 <- as.data.frame(medianNDVI.1)
medianNDVI.1
NDVI.1
dfNDVI.1 <- as.data.frame(NDVI.1)
colnames(dfNDVI.1) <- "NDVI"
dfNDVI.1$observation <- 1:nrow(dfNDVI.1)

plot(NDVI.1)

NDVI.2 <- stack(wlc2)
NDVI.2 <- NDVI.2/10000
meanNDVI.2 <- cellStats(NDVI.2, mean)
meanNDVI.2 <- as.data.frame(meanNDVI.2)
meanNDVI.2
medianNDVI.2 <- cellStats(NDVI.2, median)
medianNDVI.2 <- as.data.frame(medianNDVI.2)
medianNDVI.2
NDVI.2
dfNDVI.2 <- as.data.frame(NDVI.2)
colnames(dfNDVI.2) <- "NDVI"
dfNDVI.2$observation <- 1:nrow(dfNDVI.2)

plot(NDVI.2)

NDVI.3 <- stack(wlc3)
NDVI.1 <- NDVI.1/10000
meanNDVI.3 <- cellStats(NDVI.3, mean)
meanNDVI.3 <- as.data.frame(meanNDVI.3)
meanNDVI.3
medianNDVI.3 <- cellStats(NDVI.3, median)
medianNDVI.3 <- as.data.frame(medianNDVI.3)
medianNDVI.3
NDVI.3
dfNDVI.3 <- as.data.frame(NDVI.3)
colnames(dfNDVI.3) <- "NDVI"
dfNDVI.3$observation <- 1:nrow(dfNDVI.3)

plot(NDVI.3)

par(mfrow=c(1,3))
plot(NDVI.1)
plot(NDVI.2)
plot(NDVI.3)