################## Rush Ranch Blk 1 MODIS #######################

library(tiff); library(raster); library(rgdal); library(sp); library(maptools) 
library(ggplot2); library(rasterVis); library(date); library(GISTools)
library(caret); library(dplyr); library(vioplot); library(RColorBrewer)

RRBLK1RSTR <- raster("https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/95bf291b-cf11-4b23-9f16-c47d123b0aef/4cd180c9-0468-4cfb-8410-d226b6288a01/WELDUSWK.001_NDVI_TOA_doy2010001_aid0001.tif")
RRBLK1SHP <- rasterToPolygons(RRBLK1RSTR)

writeOGR(obj=RRBLK1SHP, dsn="tempdir", layer="torn", driver="ESRI Shapefile") # this is in geographical projection
#writeOGR(obj=RRBLK1SHP, dsn="tempdir", layer="torn2", driver="ESRI Shapefile") # this is in equal area projection

#rld2003001 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/252b1f7e-feee-4b70-b34b-1666b57b5fcd/5e603ef0-dbf9-4d9b-b995-f83b22cabb24/WELDUSWK.001_ACCA_State_doy2003001_aid0001.tif')
#rld2003001 <- crop(rld2003001, RRBLK1SHP)
                    


modus2010001 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/c49a7d87-e9eb-4211-9aeb-e71f51d3e2ac/WELDUSWK.001_NDVI_TOA_doy2010001_aid0001.tif')
modus2010008 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/f62b0452-e40e-467f-b71a-ac475c4ef080/WELDUSWK.001_NDVI_TOA_doy2010008_aid0001.tif')
modus2010043 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/d49ad218-f93b-4b48-95e3-123d9f4ba39c/WELDUSWK.001_NDVI_TOA_doy2010043_aid0001.tif')
modus2010050 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/9dbe6a82-3d10-445a-80eb-69d3d01a42a2/WELDUSWK.001_NDVI_TOA_doy2010050_aid0001.tif')
modus2010057 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/3d77aa05-12f7-4242-ade6-e2f69844392b/WELDUSWK.001_NDVI_TOA_doy2010057_aid0001.tif')
modus2010064 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/a6476f04-1240-4c6d-9f08-a4c3cf7f2306/WELDUSWK.001_NDVI_TOA_doy2010064_aid0001.tif')
modus2010071 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/62878ca3-469d-4539-8585-d70ba5de55aa/WELDUSWK.001_NDVI_TOA_doy2010071_aid0001.tif')
modus2010078 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/ed334ba9-1949-4157-992a-b359b1f9e726/WELDUSWK.001_NDVI_TOA_doy2010078_aid0001.tif')
modus2010085 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/01a2728f-e07c-4c40-9ff0-8638b001cac0/WELDUSWK.001_NDVI_TOA_doy2010085_aid0001.tif')
modus2010092 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/b1464ce4-7b24-41d9-a566-991122bd2cb7/WELDUSWK.001_NDVI_TOA_doy2010092_aid0001.tif')
modus2010099 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/d21a305d-7fd1-4af8-bbe8-59a368acba57/WELDUSWK.001_NDVI_TOA_doy2010099_aid0001.tif')
modus2010106 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/a8b326d3-bebe-433c-af47-2be88c06bdae/WELDUSWK.001_NDVI_TOA_doy2010106_aid0001.tif')
modus2010113 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/e63602d9-a3d8-4837-8d9a-133e60d120a3/WELDUSWK.001_NDVI_TOA_doy2010113_aid0001.tif')
modus2010120 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/6b7512fc-3af5-4985-bec6-e3fdeeb8203b/WELDUSWK.001_NDVI_TOA_doy2010120_aid0001.tif')
modus2010127 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/9d4ca8be-64b7-4725-84cb-581583029054/WELDUSWK.001_NDVI_TOA_doy2010127_aid0001.tif')
modus2010134 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/3a6c9aad-e4ff-4c69-b536-af6d333e65f9/WELDUSWK.001_NDVI_TOA_doy2010134_aid0001.tif')
modus2010141 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/fe6676af-4275-4e7a-a3ed-64e06d317ef2/WELDUSWK.001_NDVI_TOA_doy2010141_aid0001.tif')
modus2010148 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/223caea5-7975-41d8-8e63-7f873548f3f3/WELDUSWK.001_NDVI_TOA_doy2010148_aid0001.tif')
modus2010155 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/4a12c548-99e6-4bd0-a33d-fe1738c09fc5/WELDUSWK.001_NDVI_TOA_doy2010155_aid0001.tif')
modus2010162 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/7582accb-5151-4615-8c28-c5c7cf5b5583/WELDUSWK.001_NDVI_TOA_doy2010162_aid0001.tif')
modus2010169 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/f00bfaa1-2a9e-4075-acef-6307cec1da55/WELDUSWK.001_NDVI_TOA_doy2010169_aid0001.tif')
modus2010176 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/f82c694a-9d3b-447a-93e8-fd7ad8093917/WELDUSWK.001_NDVI_TOA_doy2010176_aid0001.tif')
modus2010183 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/7ead8dd7-03f3-4b97-92b3-32dab7ecf46d/WELDUSWK.001_NDVI_TOA_doy2010183_aid0001.tif')
modus2010190 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/b2e3e49c-69c2-43f8-bbf9-71cef421a9ec/WELDUSWK.001_NDVI_TOA_doy2010190_aid0001.tif')
modus2010197 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/976e0011-07fd-4284-b2c2-fa94e4bc9da1/WELDUSWK.001_NDVI_TOA_doy2010197_aid0001.tif')
modus2010204 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/f3a7328e-5ffc-4235-8909-991e1b4ff3eb/WELDUSWK.001_NDVI_TOA_doy2010204_aid0001.tif')





modus2010260 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/95bf291b-cf11-4b23-9f16-c47d123b0aef/cc9bc7af-80de-4537-b0b2-a4ef38fbc1df/WELDUSWK.001_NDVI_TOA_doy2010260_aid0001.tif')


cellStats(modus2010260, stat = sd, na.rm = TRUE, asSample = TRUE)
density(modus2010260)
hist(modus2010260)

rld2010260 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/95bf291b-cf11-4b23-9f16-c47d123b0aef/99bc7dfb-9f39-4010-bf4a-f70fcffd6723/WELDUSWK.001_ACCA_State_doy2010260_aid0001.tif')
#rld2003148 <- crop(rld2003148, RRBLK1SHP) 

###consider boxcox transformations before computing correlations
                     
r2 <- crop(rld2010260, extent(RRBLK1SHP))
r3 <- mask(r2, rld2010260)

image(modus2010260)
image(r3)
rld2010260
r3
extent(RRBLK1SHP)
rld2003148.crp <- crop(rld2003148, extent(rld2003148, -122.0404, -122.0355, 38.21149, 38.21344))
rld2003148.crp <- crop(rld2003148, extent(rld2003148, -122.0355, -122.0404, 38.21344, 38.21149))


                     
rld2003148                     
RRBLK1SHPdf <- as.data.frame(RRBLK1SHP)                    
max(RRBLK1SHPdf, na.rm = TRUE)                    
                     
                     
                     

#nproj <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0 "
#MOD2014001trm <- projectRaster(MOD2014001, crs = nproj)
#MOD2014001trm
#image(MOD2014001trm)
#l <- length(vlst)
#for(i in 1:length(vlst)) {
#  vlst[i] <- crop(vlst[i], RRBLK1SHP)
#}
  
rld2003015  
rldf2003001 <- as.data.frame(rld2003001)
rldf2003148 <- as.data.frame(rld2003148)


MOD2014001crp.df <- as.data.frame(MOD2014001crp);colnames(MOD2014001crp.df) <- "NDVI"; MOD2014001crp.df$observation <- 1:nrow(MOD2014001crp.df)

MOD2014001crp.av <- cellStats(MOD2014001crp, mean)
MOD2014001crp.md <- cellStats(MOD2014001crp, median)
MOD2014001crp.mx <- cellStats(MOD2014001crp, max)
MOD2014001crp.mn <- cellStats(MOD2014001crp, min)
MOD2014001crp.sd <- sd(MOD2014001crp.df$NDVI, na.rm = TRUE)


