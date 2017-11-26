################## Rush Ranch Blk 1 MODIS #######################

library(tiff); library(raster); library(rgdal); library(sp); library(maptools) 
library(ggplot2); library(rasterVis); library(date); library(GISTools)
library(caret); library(dplyr); library(vioplot); library(RColorBrewer)

#RRBLK1RSTR <- raster("https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/95bf291b-cf11-4b23-9f16-c47d123b0aef/99bc7dfb-9f39-4010-bf4a-f70fcffd6723/WELDUSWK.001_ACCA_State_doy2010260_aid0001.tif")
#RRBLK1SHP <- rasterToPolygons(RRBLK1RSTR)

#writeOGR(obj=RRBLK1SHP, dsn="tempdir", layer="torn", driver="ESRI Shapefile") # this is in geographical projection
#writeOGR(obj=RRBLK1SHP, dsn="tempdir", layer="torn2", driver="ESRI Shapefile") # this is in equal area projection

rld2003001 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/252b1f7e-feee-4b70-b34b-1666b57b5fcd/5e603ef0-dbf9-4d9b-b995-f83b22cabb24/WELDUSWK.001_ACCA_State_doy2003001_aid0001.tif')
rld2003001 <- crop(rld2003001, RRBLK1SHP)
rld2003015 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/252b1f7e-feee-4b70-b34b-1666b57b5fcd/192522bf-6724-439f-adf1-3fb209c3751c/WELDUSWK.001_ACCA_State_doy2003015_aid0001.tif')
rld2003015 <- crop(rld2003015, RRBLK1SHP)
rld2003022 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/252b1f7e-feee-4b70-b34b-1666b57b5fcd/083179eb-8fbd-41ce-b1fc-ac125eab364d/WELDUSWK.001_ACCA_State_doy2003022_aid0001.tif')
rld2003022 <- crop(rld2003022, RRBLK1SHP )
rld2003036 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/252b1f7e-feee-4b70-b34b-1666b57b5fcd/fbe56db5-d5fa-479a-bcce-598f6fb51ffc/WELDUSWK.001_ACCA_State_doy2003036_aid0001.tif')
rld2003036 <- crop(rld2003036, RRBLK1SHP)
rld2003043 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/252b1f7e-feee-4b70-b34b-1666b57b5fcd/9d3c1e91-734b-4d5e-847a-1b4f7e4a82b4/WELDUSWK.001_ACCA_State_doy2003043_aid0001.tif')
rld2003043 <- crop(rld2003043, RRBLK1SHP)
rld2003148 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/252b1f7e-feee-4b70-b34b-1666b57b5fcd/212e03c0-cb68-4c48-bb1f-d031161a395b/WELDUSWK.001_ACCA_State_doy2003148_aid0001.tif')
rld2003148 <- crop(rld2003148, RRBLK1SHP)                     

rld2010260 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/95bf291b-cf11-4b23-9f16-c47d123b0aef/99bc7dfb-9f39-4010-bf4a-f70fcffd6723/WELDUSWK.001_ACCA_State_doy2010260_aid0001.tif')
#rld2003148 <- crop(rld2003148, RRBLK1SHP) 


                     
r2 <- crop(rld2010260, extent(RRBLK1SHP))
r3 <- mask(r2, rld2010260)

image(rld2010260)
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


