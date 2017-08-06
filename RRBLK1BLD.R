library(tiff); library(raster); library(rgdal); library(sp) 
library(ggplot2); library(rasterVis); library(date)
library(caret); library(dplyr); library(vioplot); library(RColorBrewer)


dt <- as.Date(c("2016-05-03", "2016-05-26", "2016-06-23", "2016-06-29", "2016-07-27", "2016-08-17", "2016-08-24"))
dt <- data.frame(Date = dt)


#NDVI

ndvi050316 <- raster("https://s3.amazonaws.com/share-terravion-com/solanolandtrust/2016-05-03_2123-45_a1e2981e-6840-4c4a-b933-bd262b65b485_Rush-Ranch-Block-1_NDVI_N-R3_4326.tiff")
ndvi052616 <- raster("https://s3.amazonaws.com/share-terravion-com/solanolandtrust/2016-05-26_2341-38_a1e2981e-6840-4c4a-b933-bd262b65b485_Rush-Ranch-Block-1_NDVI_N-R3_4326.tiff")
ndvi062316 <- raster("https://s3.amazonaws.com/share-terravion-com/solanolandtrust/2016-06-23_1800-55_a1e2981e-6840-4c4a-b933-bd262b65b485_Rush-Ranch-Block-1_NDVI_N-R3_4326.tiff")
ndvi062916 <- raster("https://s3.amazonaws.com/share-terravion-com/solanolandtrust/2016-06-29_1659-40_a1e2981e-6840-4c4a-b933-bd262b65b485_Rush-Ranch-Block-1_NDVI_N-R3_4326.tiff")
ndvi072716 <- raster("https://s3.amazonaws.com/share-terravion-com/solanolandtrust/2016-07-27_1834-13_a1e2981e-6840-4c4a-b933-bd262b65b485_Rush-Ranch-Block-1_NDVI_N-R3_4326.tiff")
ndvi081716 <- raster("https://s3.amazonaws.com/share-terravion-com/solanolandtrust/2016-08-17_1759-52_a1e2981e-6840-4c4a-b933-bd262b65b485_Rush-Ranch-Block-1_NDVI_N-R3_4326.tiff")
ndvi082416 <- raster("https://s3.amazonaws.com/share-terravion-com/solanolandtrust/2016-08-24_2350-38_a1e2981e-6840-4c4a-b933-bd262b65b485_Rush-Ranch-Block-1_NDVI_N-R3_4326.tiff")

ndvi050316 <- setMinMax(ndvi050316)
ndvi050316@extent

ndvi052616 <- setMinMax(ndvi052616)
ndvi052616@extent


cellStats(ndvi050316, max)
cellStats(ndvi050316, min)
cellStats(ndvi050316, range)
ndvi050316@crs
ndvi050316@extent
ndvi050316@proj=longlat

