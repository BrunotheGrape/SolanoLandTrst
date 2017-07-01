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
NDVI.3 <- NDVI.3/10000
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

NDVI.4 <- stack(wlc4)
NDVI.4 <- NDVI.4/10000
meanNDVI.4 <- cellStats(NDVI.4, mean)
meanNDVI.4 <- as.data.frame(meanNDVI.4)
meanNDVI.4
medianNDVI.4 <- cellStats(NDVI.4, median)
medianNDVI.4 <- as.data.frame(medianNDVI.4)
medianNDVI.4
NDVI.4
dfNDVI.4 <- as.data.frame(NDVI.4)
colnames(dfNDVI.4) <- "NDVI"
dfNDVI.4$observation <- 1:nrow(dfNDVI.4)

plot(NDVI.4)

NDVI.5 <- stack(wlc5)
NDVI.5 <- NDVI.5/10000
meanNDVI.5 <- cellStats(NDVI.5, mean)
meanNDVI.5 <- as.data.frame(meanNDVI.5)
meanNDVI.5
medianNDVI.5 <- cellStats(NDVI.5, median)
medianNDVI.5 <- as.data.frame(medianNDVI.5)
medianNDVI.5
NDVI.5
dfNDVI.5 <- as.data.frame(NDVI.5)
colnames(dfNDVI.5) <- "NDVI"
dfNDVI.5$observation <- 1:nrow(dfNDVI.5)

plot(NDVI.5)

NDVI.6 <- stack(wlc6)
NDVI.6 <- NDVI.6/10000
meanNDVI.6 <- cellStats(NDVI.6, mean)
meanNDVI.6 <- as.data.frame(meanNDVI.6)
meanNDVI.6
medianNDVI.6 <- cellStats(NDVI.6, median)
medianNDVI.6 <- as.data.frame(medianNDVI.6)
medianNDVI.6
NDVI.6
dfNDVI.6 <- as.data.frame(NDVI.6)
colnames(dfNDVI.6) <- "NDVI"
dfNDVI.6$observation <- 1:nrow(dfNDVI.6)

plot(NDVI.6)

NDVI.7 <- stack(wlc7)
NDVI.7 <- NDVI.7/10000
meanNDVI.7 <- cellStats(NDVI.7, mean)
meanNDVI.7 <- as.data.frame(meanNDVI.7)
meanNDVI.7
medianNDVI.7 <- cellStats(NDVI.7, median)
medianNDVI.7 <- as.data.frame(medianNDVI.7)
medianNDVI.7
NDVI.7
dfNDVI.7 <- as.data.frame(NDVI.7)
colnames(dfNDVI.7) <- "NDVI"
dfNDVI.7$observation <- 1:nrow(dfNDVI.7)

plot(NDVI.7)

NDVI.8 <- stack(wlc8)
NDVI.8 <- NDVI.8/10000
meanNDVI.8 <- cellStats(NDVI.8, mean)
meanNDVI.8 <- as.data.frame(meanNDVI.8)
meanNDVI.8
medianNDVI.8 <- cellStats(NDVI.8, median)
medianNDVI.8 <- as.data.frame(medianNDVI.8)
medianNDVI.8
NDVI.8
dfNDVI.8 <- as.data.frame(NDVI.8)
colnames(dfNDVI.8) <- "NDVI"
dfNDVI.8$observation <- 1:nrow(dfNDVI.8)

plot(NDVI.8)

NDVI.9 <- stack(wlc9)
NDVI.9 <- NDVI.9/10000
meanNDVI.9 <- cellStats(NDVI.9, mean)
meanNDVI.9 <- as.data.frame(meanNDVI.9)
meanNDVI.9
medianNDVI.9 <- cellStats(NDVI.9, median)
medianNDVI.9 <- as.data.frame(medianNDVI.9)
medianNDVI.9
NDVI.9
dfNDVI.9 <- as.data.frame(NDVI.9)
colnames(dfNDVI.9) <- "NDVI"
dfNDVI.9$observation <- 1:nrow(dfNDVI.9)

plot(NDVI.9)

NDVI.10 <- stack(wlc10)
NDVI.10 <- NDVI.10/10000
meanNDVI.10 <- cellStats(NDVI.10, mean)
meanNDVI.10 <- as.data.frame(meanNDVI.10)
meanNDVI.10
medianNDVI.10 <- cellStats(NDVI.10, median)
medianNDVI.10 <- as.data.frame(medianNDVI.10)
medianNDVI.10
NDVI.10
dfNDVI.10 <- as.data.frame(NDVI.10)
colnames(dfNDVI.10) <- "NDVI"
dfNDVI.10$observation <- 1:nrow(dfNDVI.10)

plot(NDVI.10)

par(mfrow = c(1,2))
plot(NDVI.1)
plot(NDVI.6)

par(mfrow=c(1,2))
plot(NDVI.2)
plot(NDVI.7)

par(mfrow=c(1,2))
plot(NDVI.3)
plot(NDVI.8)

par(mfrow=c(1,2))
plot(NDVI.4)
plot(NDVI.9)

par(mfrow=c(1,2))
plot(NDVI.5)
plot(NDVI.10)

NDVI.1
NDVI.6


wlnc1 <- raster("https://s3.amazonaws.com/share-terravion-com/solanolandtrust/2016-07-05_1746-30_a651f248-3fdc-4c24-9f53-ef3323596250_Wallace_Brazelton-0121150110_NC_4326.tiff")

NDNC.1 <- stack(wlc1)
NDNC.1 <- NDNC.1/10000
meanNDNC.1 <- cellStats(NDNC.1, mean)
meanNDNC.1 <- as.data.frame(meanNDNC.1)
meanNDNC.1
medianNDNC.1 <- cellStats(NDNC.1, median)
medianNDNC.1 <- as.data.frame(medianNDNC.1)
medianNDNC.1
NDNC.1
dfNDNC.1 <- as.data.frame(NDNC.1)
colnames(dfNDNC.1) <- "NDVI"
dfNDNC.1$observation <- 1:nrow(dfNDNC.1)

plot(NDNC.1)