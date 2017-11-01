################## Rush Ranch Blk 1 MODIS #######################

library(tiff); library(raster); library(rgdal); library(sp) 
library(ggplot2); library(rasterVis); library(date)
library(caret); library(dplyr); library(vioplot); library(RColorBrewer)

RRBLK1SHP <- raster("https://s3.amazonaws.com/share-terravion-com/solanolandtrust/2016-05-03_2123-45_a1e2981e-6840-4c4a-b933-bd262b65b485_Rush-Ranch-Block-1_NDVI_N-R3_4326.tiff")

MOD2014001 <- raster("https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/252b1f7e-feee-4b70-b34b-1666b57b5fcd/bf6bca53-fbfa-490d-8577-fe23f9e48182/WELDUSWK.001_ACCA_State_doy2003295_aid0001.tif
")

MOD2014001

#ndvi050316
image(MOD2014001)

#nproj <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0 "
#MOD2014001trm <- projectRaster(MOD2014001, crs = nproj)
#MOD2014001trm
#image(MOD2014001trm)

#inCols2 <- ncol(MOD2014001da)
#inRows2 <- nrow(MOD2014001da) 
#image(MOD2014001da)  
  
  
  
MOD2014001crp <- crop(MOD2014001, RRBLK1SHP )
image(MOD2014001crp)
MOD2014001crp
MOD2014001crp <- setMinMax(MOD2014001crp)
MOD2014001crp <- stack(MOD2014001crp)

MOD2014001crp.df <- as.data.frame(MOD2014001crp);colnames(MOD2014001crp.df) <- "NDVI"; MOD2014001crp.df$observation <- 1:nrow(MOD2014001crp.df)

MOD2014001crp.av <- cellStats(MOD2014001crp, mean)
MOD2014001crp.md <- cellStats(MOD2014001crp, median)
MOD2014001crp.mx <- cellStats(MOD2014001crp, max)
MOD2014001crp.mn <- cellStats(MOD2014001crp, min)
MOD2014001crp.sd <- sd(MOD2014001crp.df$NDVI, na.rm = TRUE)


