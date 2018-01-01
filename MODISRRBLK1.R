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
                    
DOY <- c(1262325600, 1262325607, 1262325642, 1262325649, 1262325656, 1262325663, 1262325670, 1262325677,
         1262325684, 1262325691, 1262325698, 1262325705, 1262325712, 1262325719, 1262325726, 1262325733,  
         1262325740, 1262325747, 1262325754, 1262325761, 1262325768, 1262325775, 1262325782, 1262325789, 
         1262325796, 1262325803, 1262325810, 1262325824, 1262325831, 1262325838, 1262325845, 1262325852,  
         1262325859, 1262325866, 1262325873, 1262325880, 1262325887, 1262325894, 1262325901, 1262325908,  
         1262325915, 1262325929, 1262325936, 1262325943, 1262325950)
Date <- c("Jan 1, 2010", "Jan 8, 2010", "Feb 12, 2010", "Feb 19, 2010", "Feb 26, 2010", "Mar 5, 2010",
          "Mar 12, 2010", "Mar 19, 2010", "Mar 26, 2010", "Apr 2, 2010", "Apr 9, 2010", "Apr 16, 2010",
          "Apr 23, 2010", "Apr 30, 2010", "May 7 2010", "May 14 2010", "May 21, 2010", "May 28, 2010",
          "Jun 4, 2010", "Jun 11, 2010", "Jun 18, 2010", "Jun 25, 2010", "Jul 2, 2010", "Jul 9, 2010",
          "Jul 16, 2010", "Jul 23, 2010", "Jul 30, 2010", "Aug 13, 2010", "Aug 20, 2010", "Aug 27, 2010",
          "Sep 3, 2010", "Sep 10, 2010", "Sep 17, 2010", "Sep 24, 2010", "Oct 1, 2010", "Oct 8, 2010", 
          "Oct 15, 2010", "Oct 22, 2010", "Oct 29, 2010", "Nov 9, 2010", "Nov 12, 2010", "Nov 26, 2010",
          "Dec 3, 2010", "Dec 10, 2010", "Dec 17, 2010")

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
mod2010183 <- as.data.frame(values(modus2010183))
mod2010190 <- as.data.frame(values(modus2010190))
mod2010197 <- as.data.frame(values(modus2010197))
mod2010204 <- as.data.frame(values(modus2010204))
mod2010211 <- as.data.frame(values(modus2010211))
mod2010225 <- as.data.frame(values(modus2010225))
mod2010232 <- as.data.frame(values(modus2010232))
mod2010239 <- as.data.frame(values(modus2010239))
mod2010246 <- as.data.frame(values(modus2010246))
mod2010253 <- as.data.frame(values(modus2010253))
mod2010260 <- as.data.frame(values(modus2010260))
mod2010267 <- as.data.frame(values(modus2010267))
mod2010274 <- as.data.frame(values(modus2010274))
mod2010281 <- as.data.frame(values(modus2010281))
mod2010288 <- as.data.frame(values(modus2010288))
mod2010295 <- as.data.frame(values(modus2010295))
mod2010302 <- as.data.frame(values(modus2010302))
mod2010309 <- as.data.frame(values(modus2010309))
mod2010316 <- as.data.frame(values(modus2010316))
mod2010330 <- as.data.frame(values(modus2010330))
mod2010337 <- as.data.frame(values(modus2010337))
mod2010344 <- as.data.frame(values(modus2010344))
mod2010351 <- as.data.frame(values(modus2010351))

mod2010 <- as.data.frame(cbind(mod2010001, mod2010008, mod2010043, mod2010050, mod2010057,
                              mod2010064, mod2010071, mod2010078, mod2010085, mod2010092,
                              mod2010099, mod2010106, mod2010113, mod2010120, mod2010127,
                              mod2010134, mod2010141, mod2010148, mod2010155, mod2010162, 
                              mod2010169, mod2010176, mod2010183, mod2010190, mod2010197,
                              mod2010204, mod2010211, mod2010225, mod2010232, mod2010239,
                              mod2010246, mod2010253, mod2010260, mod2010267, mod2010274,
                              mod2010281, mod2010288, mod2010295, mod2010302, mod2010309,
                              mod2010316, mod2010330, mod2010337, mod2010344, mod2010351))


modsd2010 <- apply(mod2010, 2, sd)
modmn2010 <- apply(mod2010, 2, mean)
modmdn2010 <- apply(mod2010, 2, median)
modmin2010 <- apply(mod2010, 2, min)
modmax2010 <- apply(mod2010, 2, max)

modsts2010 <- as.data.frame(cbind(modmn2010, modmdn2010, modsd2010, modmax2010, modmin2010))
colnames(modsts2010) <- c('Mean', 'Median', 'StdDev', 'Max', 'Min')
write.csv(modsts2010, 'NDVI_YR_2010_STATS.csv')

modsts2010 <- cbind(Date, DOY, modsts2010)

modmnp2010 <- as.data.frame(modmn2010)
modmnp2010$Stat <- "Mean"
modmnp2010 <- cbind(Date, DOY, modmnp2010)
colnames(modmnp2010)[3] <- "Values"
modminp2010 <- as.data.frame(modmin2010)
modminp2010$Stat <- "Min"
modminp2010 <- cbind(Date, DOY, modminp2010)
colnames(modminp2010)[3] <- "Values"
modmaxp2010 <- as.data.frame(modmax2010)
modmaxp2010$Stat <- "Max"
modmaxp2010 <- cbind(Date, DOY, modmaxp2010)
colnames(modmaxp2010)[3] <- "Values"
modstsp2010 <- rbind(modmnp2010, modminp2010, modmaxp2010)
modstsp2010$Stat <- as.factor(modstsp2010$Stat)
#modstsp2010$DOY <- as.factor(modstsp2010$DOY)
modstxl2010 <- filter(modstsp2010, Values != 'NA')
#write.csv(modstsp2010, 'modstsp2010.csv')
write.csv(modstxl2010, 'modstxl2010.csv')

p10 <- ggplot(modstxl2010, aes(DOY, Values, color = Stat), na.rm = TRUE) + geom_point() + geom_path()
p10 <- p10 + labs(title = "Rush Ranch Block 1, 2010 NDVI Values\n with minimum, maximum, and mean", x = "Date")
p10 <- p10 + theme( axis.text.x = element_blank()) + scale_colour_brewer(palette="Dark2")
p10
ggsave(file = "Stats2010.png")

ggplot(data=modsts2010, aes(x=DOY)) +
  geom_line(aes(y = Mean))





