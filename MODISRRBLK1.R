################## Rush Ranch Blk 1 MODIS #######################

library(tiff); library(raster); library(rgdal); library(sp) 
library(ggplot2); library(rasterVis); library(date)
library(caret); library(dplyr); library(vioplot); library(RColorBrewer)

ndvi050316 <- raster("https://s3.amazonaws.com/share-terravion-com/solanolandtrust/2016-05-03_2123-45_a1e2981e-6840-4c4a-b933-bd262b65b485_Rush-Ranch-Block-1_NDVI_N-R3_4326.tiff")
ndvi052616 <- raster("https://s3.amazonaws.com/share-terravion-com/solanolandtrust/2016-05-26_2341-38_a1e2981e-6840-4c4a-b933-bd262b65b485_Rush-Ranch-Block-1_NDVI_N-R3_4326.tiff")
ndvi062316 <- raster("https://s3.amazonaws.com/share-terravion-com/solanolandtrust/2016-06-23_1800-55_a1e2981e-6840-4c4a-b933-bd262b65b485_Rush-Ranch-Block-1_NDVI_N-R3_4326.tiff")
ndvi062916 <- raster("https://s3.amazonaws.com/share-terravion-com/solanolandtrust/2016-06-29_1659-40_a1e2981e-6840-4c4a-b933-bd262b65b485_Rush-Ranch-Block-1_NDVI_N-R3_4326.tiff")
ndvi072716 <- raster("https://s3.amazonaws.com/share-terravion-com/solanolandtrust/2016-07-27_1834-13_a1e2981e-6840-4c4a-b933-bd262b65b485_Rush-Ranch-Block-1_NDVI_N-R3_4326.tiff")
ndvi081716 <- raster("https://s3.amazonaws.com/share-terravion-com/solanolandtrust/2016-08-17_1759-52_a1e2981e-6840-4c4a-b933-bd262b65b485_Rush-Ranch-Block-1_NDVI_N-R3_4326.tiff")
ndvi082416 <- raster("https://s3.amazonaws.com/share-terravion-com/solanolandtrust/2016-08-24_2350-38_a1e2981e-6840-4c4a-b933-bd262b65b485_Rush-Ranch-Block-1_NDVI_N-R3_4326.tiff")

MOD2014001 <- raster("https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/1a7bfc10-1cba-41fa-857d-6f4605bb59d7/9799b062-1d94-4997-8908-5a3134032b27/MOD13A1.005__500m_16_days_NDVI_doy2014001_aid0001.tif
")

MOD2014001

ndvi050316
image(MOD2014001)


nproj <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0 "
MOD2014001trm <- projectRaster(MOD2014001, crs = nproj)
MOD2014001trm
image(MOD2014001trm)
