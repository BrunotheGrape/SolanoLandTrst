################## Rush Ranch Blk 1 MODIS #######################

library(tiff); library(raster); library(rgdal); library(sp); library(maptools) 
library(ggplot2); library(rasterVis); library(date); library(GISTools)
library(caret); library(dplyr); library(vioplot); library(RColorBrewer)
library(tidyverse)

RRBLK1RSTR <- raster("https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/95bf291b-cf11-4b23-9f16-c47d123b0aef/4cd180c9-0468-4cfb-8410-d226b6288a01/WELDUSWK.001_NDVI_TOA_doy2010001_aid0001.tif")
RRBLK1SHP <- rasterToPolygons(RRBLK1RSTR)

writeOGR(obj=RRBLK1SHP, dsn="tempdir", layer="torn", driver="ESRI Shapefile") # this is in geographical projection
#writeOGR(obj=RRBLK1SHP, dsn="tempdir", layer="torn2", driver="ESRI Shapefile") # this is in equal area projection

#rld2003001 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/252b1f7e-feee-4b70-b34b-1666b57b5fcd/5e603ef0-dbf9-4d9b-b995-f83b22cabb24/WELDUSWK.001_ACCA_State_doy2003001_aid0001.tif')
#rld2003001 <- crop(rld2003001, RRBLK1SHP)
                    
DOY <- c(1262325600, 1262325608, 1262325643, 1262325650, 1262325657, 1262325664, 1262325671, 1262325678,
         1262325685, 1262325692, 1262325699, 1262325706, 1262325713, 1262325720, 1262325727, 1262325734,  
         1262325741, 1262325748, 1262325755, 1262325762, 1262325769, 1262325776, 1262325783, 1262325790, 
         1262325797, 1262325804, 1262325811, 1262325825, 1262325832, 1262325839, 1262325846, 1262325853,  
         1262325860, 1262325867, 1262325874, 1262325881, 1262325888, 1262325895, 1262325902, 1262325909,  
         1262325916, 1262325930, 1262325937, 1262325944, 1262325951)

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
modus2010211 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/da14afc0-5b2c-42a0-b39f-28f7f222e80b/WELDUSWK.001_NDVI_TOA_doy2010211_aid0001.tif')
modus2010225 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/ee4d2ed3-9871-416f-beba-c382e8419656/WELDUSWK.001_NDVI_TOA_doy2010225_aid0001.tif')
modus2010232 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/1efbe815-56f7-416b-80a7-bfae8254b95b/WELDUSWK.001_NDVI_TOA_doy2010232_aid0001.tif')
modus2010239 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/54910dd0-dcd7-496c-950e-01f1dcc3da5b/WELDUSWK.001_NDVI_TOA_doy2010239_aid0001.tif')
modus2010246 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/3083e899-aa3b-4577-8f77-af3cb5b436a5/WELDUSWK.001_NDVI_TOA_doy2010246_aid0001.tif')
modus2010253 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/fa5c330c-724d-41c3-8e97-624284e2d511/WELDUSWK.001_NDVI_TOA_doy2010253_aid0001.tif')
modus2010260 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/95bf291b-cf11-4b23-9f16-c47d123b0aef/cc9bc7af-80de-4537-b0b2-a4ef38fbc1df/WELDUSWK.001_NDVI_TOA_doy2010260_aid0001.tif')
modus2010267 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/857dfbc6-2392-42cc-8156-1a81c4252a2c/WELDUSWK.001_NDVI_TOA_doy2010267_aid0001.tif')
modus2010274 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/db3a0d41-36a1-442b-992e-cf53ca725a75/WELDUSWK.001_NDVI_TOA_doy2010274_aid0001.tif')
modus2010281 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/0ce537ca-b152-4d16-a301-b0a78937b376/WELDUSWK.001_NDVI_TOA_doy2010281_aid0001.tif')
modus2010288 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/8894d17d-9c50-4180-a76f-f52df00e75f1/WELDUSWK.001_NDVI_TOA_doy2010288_aid0001.tif')
modus2010295 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/cf05e0f3-4de7-484e-8f49-827af4ff2f04/WELDUSWK.001_NDVI_TOA_doy2010295_aid0001.tif')
modus2010302 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/68971e3f-63e9-4f9d-8e6f-0cc2531538b9/WELDUSWK.001_NDVI_TOA_doy2010302_aid0001.tif')
modus2010309 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/89cbbcd2-fb53-4c50-b3fc-43e64d3d1fa1/WELDUSWK.001_NDVI_TOA_doy2010309_aid0001.tif')
modus2010316 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/d6c797be-0e9d-4c5e-b8e8-1f4d996c029b/WELDUSWK.001_NDVI_TOA_doy2010316_aid0001.tif')
modus2010330 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/2b5fe225-35c3-47ee-a3b4-8792d2d72c7b/WELDUSWK.001_NDVI_TOA_doy2010330_aid0001.tif')
modus2010337 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/caedba0b-7462-4d64-99db-778a40f22103/WELDUSWK.001_NDVI_TOA_doy2010337_aid0001.tif')
modus2010344 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/b441598c-3fb3-4c9a-ad25-cf90e9c4b9db/WELDUSWK.001_NDVI_TOA_doy2010344_aid0001.tif')
modus2010351 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/56619c67-e324-45d7-ac94-e3752ff6cf27/WELDUSWK.001_NDVI_TOA_doy2010351_aid0001.tif')

ndvisd2010001 <- cellStats(modus2010001, stat = sd, na.rm = TRUE, asSample = TRUE)
ndvisd2010008 <- cellStats(modus2010008, stat = sd, na.rm = TRUE, asSample = TRUE)
ndvisd2010043 <- cellStats(modus2010043, stat = sd, na.rm = TRUE, asSample = TRUE)
ndvisd2010050 <- cellStats(modus2010050, stat = sd, na.rm = TRUE, asSample = TRUE)
ndvisd2010057 <- cellStats(modus2010057, stat = sd, na.rm = TRUE, asSample = TRUE)
ndvisd2010064 <- cellStats(modus2010064, stat = sd, na.rm = TRUE, asSample = TRUE)
ndvisd2010071 <- cellStats(modus2010071, stat = sd, na.rm = TRUE, asSample = TRUE)
ndvisd2010078 <- cellStats(modus2010078, stat = sd, na.rm = TRUE, asSample = TRUE)
ndvisd2010085 <- cellStats(modus2010085, stat = sd, na.rm = TRUE, asSample = TRUE)
ndvisd2010092 <- cellStats(modus2010092, stat = sd, na.rm = TRUE, asSample = TRUE)
ndvisd2010099 <- cellStats(modus2010099, stat = sd, na.rm = TRUE, asSample = TRUE)
ndvisd2010106 <- cellStats(modus2010106, stat = sd, na.rm = TRUE, asSample = TRUE)
ndvisd2010113 <- cellStats(modus2010113, stat = sd, na.rm = TRUE, asSample = TRUE)
ndvisd2010120 <- cellStats(modus2010120, stat = sd, na.rm = TRUE, asSample = TRUE)
ndvisd2010127 <- cellStats(modus2010127, stat = sd, na.rm = TRUE, asSample = TRUE)
ndvisd2010134 <- cellStats(modus2010134, stat = sd, na.rm = TRUE, asSample = TRUE)
ndvisd2010141 <- cellStats(modus2010141, stat = sd, na.rm = TRUE, asSample = TRUE)
ndvisd2010148 <- cellStats(modus2010148, stat = sd, na.rm = TRUE, asSample = TRUE)
ndvisd2010155 <- cellStats(modus2010155, stat = sd, na.rm = TRUE, asSample = TRUE)
ndvisd2010162 <- cellStats(modus2010162, stat = sd, na.rm = TRUE, asSample = TRUE)
ndvisd2010169 <- cellStats(modus2010169, stat = sd, na.rm = TRUE, asSample = TRUE)
ndvisd2010176 <- cellStats(modus2010176, stat = sd, na.rm = TRUE, asSample = TRUE)
ndvisd2010183 <- cellStats(modus2010183, stat = sd, na.rm = TRUE, asSample = TRUE)
ndvisd2010190 <- cellStats(modus2010190, stat = sd, na.rm = TRUE, asSample = TRUE)
ndvisd2010197 <- cellStats(modus2010197, stat = sd, na.rm = TRUE, asSample = TRUE)
ndvisd2010204 <- cellStats(modus2010204, stat = sd, na.rm = TRUE, asSample = TRUE)
ndvisd2010211 <- cellStats(modus2010211, stat = sd, na.rm = TRUE, asSample = TRUE)
ndvisd2010225 <- cellStats(modus2010225, stat = sd, na.rm = TRUE, asSample = TRUE)
ndvisd2010232 <- cellStats(modus2010232, stat = sd, na.rm = TRUE, asSample = TRUE)
ndvisd2010239 <- cellStats(modus2010239, stat = sd, na.rm = TRUE, asSample = TRUE)
ndvisd2010246 <- cellStats(modus2010246, stat = sd, na.rm = TRUE, asSample = TRUE)
ndvisd2010253 <- cellStats(modus2010253, stat = sd, na.rm = TRUE, asSample = TRUE)
ndvisd2010260 <- cellStats(modus2010260, stat = sd, na.rm = TRUE, asSample = TRUE)
ndvisd2010267 <- cellStats(modus2010267, stat = sd, na.rm = TRUE, asSample = TRUE)
ndvisd2010274 <- cellStats(modus2010274, stat = sd, na.rm = TRUE, asSample = TRUE)
ndvisd2010281 <- cellStats(modus2010281, stat = sd, na.rm = TRUE, asSample = TRUE)
ndvisd2010288 <- cellStats(modus2010288, stat = sd, na.rm = TRUE, asSample = TRUE)
ndvisd2010295 <- cellStats(modus2010295, stat = sd, na.rm = TRUE, asSample = TRUE)
ndvisd2010302 <- cellStats(modus2010302, stat = sd, na.rm = TRUE, asSample = TRUE)
ndvisd2010309 <- cellStats(modus2010309, stat = sd, na.rm = TRUE, asSample = TRUE)
ndvisd2010316 <- cellStats(modus2010316, stat = sd, na.rm = TRUE, asSample = TRUE)
ndvisd2010330 <- cellStats(modus2010330, stat = sd, na.rm = TRUE, asSample = TRUE)
ndvisd2010337 <- cellStats(modus2010337, stat = sd, na.rm = TRUE, asSample = TRUE)
ndvisd2010344 <- cellStats(modus2010344, stat = sd, na.rm = TRUE, asSample = TRUE)
ndvisd2010351 <- cellStats(modus2010351, stat = sd, na.rm = TRUE, asSample = TRUE)



ndvisd2010 <- do.call(rbind, as.list(c(ndvisd2010001, ndvisd2010008, ndvisd2010043, ndvisd2010050, ndvisd2010057,
                                ndvisd2010064, ndvisd2010071, ndvisd2010078, ndvisd2010085, ndvisd2010092,
                                ndvisd2010099, ndvisd2010106, ndvisd2010113, ndvisd2010120, ndvisd2010127, 
                                ndvisd2010134, ndvisd2010141, ndvisd2010148, ndvisd2010155, ndvisd2010162, 
                                ndvisd2010169, ndvisd2010176, ndvisd2010183, ndvisd2010190, ndvisd2010197, 
                                ndvisd2010204, ndvisd2010211, ndvisd2010225, ndvisd2010232, ndvisd2010239, 
                                ndvisd2010246, ndvisd2010253, ndvisd2010260, ndvisd2010267, ndvisd2010274, 
                                ndvisd2010281, ndvisd2010288, ndvisd2010295, ndvisd2010302, ndvisd2010309, 
                                ndvisd2010316, ndvisd2010330, ndvisd2010337, ndvisd2010344, ndvisd2010351)))
                                 
df2010 <- as.data.frame(cbind(DOY, ndvisd2010))
colnames(df2010)[2] <- "NDVI_STD_DEV"

sdp2010 <- ggplot(data = df2010, aes(x = DOY, y = NDVI)) + geom_line(color = "black") + geom_point()
 


cellStats(x, stat = sd, na.rm = TRUE, asSample = TRUE)



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


mod2010001 <- as.matrix(as.data.frame(values(modus2010001)))
mod2010008 <- as.matrix(as.data.frame(values(modus2010008)))
mod2010043 <- as.data.frame(values(modus2010043))
mod2010050 <- as.data.frame(values(modus2010050))
mod2010057 <- as.data.frame(values(modus2010057))
mod2010064 <- as.data.frame(values(modus2010064))
mod2010071 <- as.data.frame(values(modus2010071))
mod2010078 <- as.data.frame(values(modus2010078))
mod2010085 <- as.data.frame(values(modus2010085))
mod2010092 <- as.data.frame(values(modus2010092))
mod2010099 <- as.data.frame(values(modus2010099))
mod2010106 <- as.data.frame(values(modus2010106))
mod2010113 <- as.data.frame(values(modus2010113))
mod2010120 <- as.data.frame(values(modus2010120))
mod2010127 <- as.data.frame(values(modus2010127))
mod2010134 <- as.data.frame(values(modus2010134))
mod2010141 <- as.data.frame(values(modus2010141))
mod2010148 <- as.data.frame(values(modus2010148))
mod2010155 <- as.data.frame(values(modus2010155))
mod2010162 <- as.data.frame(values(modus2010162))
mod2010169 <- as.data.frame(values(modus2010169))
mod2010176 <- as.data.frame(values(modus2010176))

mod2010 <- as.data.frame(cbind(mod2010001, mod2010008, mod2010043, mod2010050, mod2010057,
                              mod2010064, mod2010071, mod2010078, mod2010085, mod2010092,
                              mod2010099, mod2010106, mod2010113, mod2010120, mod2010127,
                              mod2010134))




cellStats(modus2010043, stat = mean, na.rm = TRUE, asSample = TRUE)
modmn <- cellStats(x, stat = mean, na.rm = TRUE)
x <- as.list(c(modmn2010008, modmn2010071))

xmn <- lapply(x, function(x) mean)

outlist <- list() #create empty list to store outputs from loop

for (i in 1:length(mod)) { #for each raster in rasterlist
  r <- raster(mod[[i]]) #read element i of rasterlist into R
  val <- getValues(r) #get raster values
  m <- mean(val,na.rm=T) #remove NAs and compute mean
  outlist[[i]] <- c(mod[[i]],m) #store raster path with mean
  return("complete")
}

df <- data.frame(do.call(rbind,outlist)) #convert list to data frame
colnames(df) <- c("raster path","mean")

ml <- mean(x)

a <- c(3,5,6)
b <- c(4,2,7)

myls <- c(a,b)
mean(myls)
 
apply(arr, 1:2, mean)

arr <- array(unlist(x), c(1,136,2))
arr <- array(x, c(1,136,2))
rowMeans(arr, dims = 1, na.rm = TRUE)
apply(arr, 1:3, mean)
mapply(arr,  mean)

apply(arr, 1,mean)

tapply(x, function(x) mean(x,na.rm=TRUE))

sapply(arr,function(x) sapply(x, function(x) mean(x,na.rm=TRUE)) )

ans1 = plyr::aaply(plyr::laply(x, as.matrix), c(2, 3), mean)

modmn2010008
modmn <- map(modmn2010008, modmn2010071)

modmn <- as.data.frame(do.call(cbind, x))
mod2010 <- as.data.frame(cbind(mod2010001, mod2010008))

