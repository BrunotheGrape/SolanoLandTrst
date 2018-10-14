################## Rush Ranch Blk 1 MODIS #######################

library(tiff); library(raster); library(rgdal); library(sp); library(maptools) 
library(ggplot2); library(rasterVis); library(date); library(GISTools)
library(caret); library(dplyr); library(vioplot); library(RColorBrewer)
library(tidyverse)

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


ACCA2010001 <- raster('APPEARS_2010/WELDUSWK.001_ACCA_State_doy2010001_aid0001.tif')
ACCA2010008 <- raster('APPEARS_2010/WELDUSWK.001_ACCA_State_doy2010008_aid0001.tif')
ACCA2010043 <- raster('APPEARS_2010/WELDUSWK.001_ACCA_State_doy2010043_aid0001.tif')
ACCA2010050 <- raster('APPEARS_2010/WELDUSWK.001_ACCA_State_doy2010050_aid0001.tif')
ACCA2010057 <- raster('APPEARS_2010/WELDUSWK.001_ACCA_State_doy2010057_aid0001.tif')
ACCA2010064 <- raster('APPEARS_2010/WELDUSWK.001_ACCA_State_doy2010064_aid0001.tif')
ACCA2010071 <- raster('APPEARS_2010/WELDUSWK.001_ACCA_State_doy2010071_aid0001.tif')
ACCA2010078 <- raster('APPEARS_2010/WELDUSWK.001_ACCA_State_doy2010078_aid0001.tif')
ACCA2010085 <- raster('APPEARS_2010/WELDUSWK.001_ACCA_State_doy2010085_aid0001.tif')
ACCA2010092 <- raster('APPEARS_2010/WELDUSWK.001_ACCA_State_doy2010092_aid0001.tif')
ACCA2010099 <- raster('APPEARS_2010/WELDUSWK.001_ACCA_State_doy2010099_aid0001.tif')
ACCA2010106 <- raster('APPEARS_2010/WELDUSWK.001_ACCA_State_doy2010106_aid0001.tif')
ACCA2010113 <- raster('APPEARS_2010/WELDUSWK.001_ACCA_State_doy2010113_aid0001.tif')
ACCA2010120 <- raster('APPEARS_2010/WELDUSWK.001_ACCA_State_doy2010120_aid0001.tif')
ACCA2010127 <- raster('APPEARS_2010/WELDUSWK.001_ACCA_State_doy2010127_aid0001.tif')
ACCA2010134 <- raster('APPEARS_2010/WELDUSWK.001_ACCA_State_doy2010134_aid0001.tif')
ACCA2010141 <- raster('APPEARS_2010/WELDUSWK.001_ACCA_State_doy2010141_aid0001.tif')
ACCA2010148 <- raster('APPEARS_2010/WELDUSWK.001_ACCA_State_doy2010148_aid0001.tif')
ACCA2010155 <- raster('APPEARS_2010/WELDUSWK.001_ACCA_State_doy2010155_aid0001.tif')
ACCA2010162 <- raster('APPEARS_2010/WELDUSWK.001_ACCA_State_doy2010162_aid0001.tif')
ACCA2010169 <- raster('APPEARS_2010/WELDUSWK.001_ACCA_State_doy2010169_aid0001.tif')
ACCA2010176 <- raster('APPEARS_2010/WELDUSWK.001_ACCA_State_doy2010176_aid0001.tif')
ACCA2010183 <- raster('APPEARS_2010/WELDUSWK.001_ACCA_State_doy2010183_aid0001.tif')
ACCA2010190 <- raster('APPEARS_2010/WELDUSWK.001_ACCA_State_doy2010190_aid0001.tif')
ACCA2010197 <- raster('APPEARS_2010/WELDUSWK.001_ACCA_State_doy2010197_aid0001.tif')
ACCA2010204 <- raster('APPEARS_2010/WELDUSWK.001_ACCA_State_doy2010204_aid0001.tif')
ACCA2010211 <- raster('APPEARS_2010/WELDUSWK.001_ACCA_State_doy2010211_aid0001.tif')
ACCA2010225 <- raster('APPEARS_2010/WELDUSWK.001_ACCA_State_doy2010225_aid0001.tif')
ACCA2010232 <- raster('APPEARS_2010/WELDUSWK.001_ACCA_State_doy2010232_aid0001.tif')
ACCA2010239 <- raster('APPEARS_2010/WELDUSWK.001_ACCA_State_doy2010239_aid0001.tif')
ACCA2010246 <- raster('APPEARS_2010/WELDUSWK.001_ACCA_State_doy2010246_aid0001.tif')
ACCA2010253 <- raster('APPEARS_2010/WELDUSWK.001_ACCA_State_doy2010253_aid0001.tif')
ACCA2010260 <- raster('APPEARS_2010/WELDUSWK.001_ACCA_State_doy2010260_aid0001-2.tif')
ACCA2010267 <- raster('APPEARS_2010/WELDUSWK.001_ACCA_State_doy2010267_aid0001.tif')
ACCA2010274 <- raster('APPEARS_2010/WELDUSWK.001_ACCA_State_doy2010274_aid0001.tif')
ACCA2010281 <- raster('APPEARS_2010/WELDUSWK.001_ACCA_State_doy2010281_aid0001.tif')
ACCA2010288 <- raster('APPEARS_2010/WELDUSWK.001_ACCA_State_doy2010288_aid0001.tif')
ACCA2010295 <- raster('APPEARS_2010/WELDUSWK.001_ACCA_State_doy2010295_aid0001.tif')
ACCA2010302 <- raster('APPEARS_2010/WELDUSWK.001_ACCA_State_doy2010302_aid0001.tif')
ACCA2010309 <- raster('APPEARS_2010/WELDUSWK.001_ACCA_State_doy2010309_aid0001.tif')
ACCA2010316 <- raster('APPEARS_2010/WELDUSWK.001_ACCA_State_doy2010316_aid0001.tif')
ACCA2010330 <- raster('APPEARS_2010/WELDUSWK.001_ACCA_State_doy2010330_aid0001.tif')
ACCA2010337 <- raster('APPEARS_2010/WELDUSWK.001_ACCA_State_doy2010337_aid0001.tif')
ACCA2010344 <- raster('APPEARS_2010/WELDUSWK.001_ACCA_State_doy2010344_aid0001.tif')
ACCA2010351 <- raster('APPEARS_2010/WELDUSWK.001_ACCA_State_doy2010351_aid0001.tif')



AC2010001 <- as.matrix(as.data.frame(values(ACCA2010001)))
AC2010008 <- as.matrix(as.data.frame(values(ACCA2010008)))
AC2010043 <- as.data.frame(values(ACCA2010043))
AC2010050 <- as.data.frame(values(ACCA2010050))
AC2010057 <- as.data.frame(values(ACCA2010057))
AC2010064 <- as.data.frame(values(ACCA2010064))
AC2010071 <- as.data.frame(values(ACCA2010071))
AC2010078 <- as.data.frame(values(ACCA2010078))
AC2010085 <- as.data.frame(values(ACCA2010085))
AC2010092 <- as.data.frame(values(ACCA2010092))
AC2010099 <- as.data.frame(values(ACCA2010099))
AC2010106 <- as.data.frame(values(ACCA2010106))
AC2010113 <- as.data.frame(values(ACCA2010113))
AC2010120 <- as.data.frame(values(ACCA2010120))
AC2010127 <- as.data.frame(values(ACCA2010127))
AC2010134 <- as.data.frame(values(ACCA2010134))
AC2010141 <- as.data.frame(values(ACCA2010141))
AC2010148 <- as.data.frame(values(ACCA2010148))
AC2010155 <- as.data.frame(values(ACCA2010155))
AC2010162 <- as.data.frame(values(ACCA2010162))
AC2010169 <- as.data.frame(values(ACCA2010169))
AC2010176 <- as.data.frame(values(ACCA2010176))
AC2010183 <- as.data.frame(values(ACCA2010183))
AC2010190 <- as.data.frame(values(ACCA2010190))
AC2010197 <- as.data.frame(values(ACCA2010197))
AC2010204 <- as.data.frame(values(ACCA2010204))
AC2010211 <- as.data.frame(values(ACCA2010211))
AC2010225 <- as.data.frame(values(ACCA2010225))
AC2010232 <- as.data.frame(values(ACCA2010232))
AC2010239 <- as.data.frame(values(ACCA2010239))
AC2010246 <- as.data.frame(values(ACCA2010246))
AC2010253 <- as.data.frame(values(ACCA2010253))
AC2010260 <- as.data.frame(values(ACCA2010260))
AC2010267 <- as.data.frame(values(ACCA2010267))
AC2010274 <- as.data.frame(values(ACCA2010274))
AC2010281 <- as.data.frame(values(ACCA2010281))
AC2010288 <- as.data.frame(values(ACCA2010288))
AC2010295 <- as.data.frame(values(ACCA2010295))
AC2010302 <- as.data.frame(values(ACCA2010302))
AC2010309 <- as.data.frame(values(ACCA2010309))
AC2010316 <- as.data.frame(values(ACCA2010316))
AC2010330 <- as.data.frame(values(ACCA2010330))
AC2010337 <- as.data.frame(values(ACCA2010337))
AC2010344 <- as.data.frame(values(ACCA2010344))
AC2010351 <- as.data.frame(values(ACCA2010351))

AC2010 <- as.data.frame(cbind(AC2010001, AC2010008, AC2010043, AC2010050, AC2010057,
                               AC2010064, AC2010071, AC2010078, AC2010085, AC2010092,
                               AC2010099, AC2010106, AC2010113, AC2010120, AC2010127,
                               AC2010134, AC2010141, AC2010148, AC2010155, AC2010162, 
                               AC2010169, AC2010176, AC2010183, AC2010190, AC2010197,
                               AC2010204, AC2010211, AC2010225, AC2010232, AC2010239,
                               AC2010246, AC2010253, AC2010260, AC2010267, AC2010274,
                               AC2010281, AC2010288, AC2010295, AC2010302, AC2010309,
                               AC2010316, AC2010330, AC2010337, AC2010344, AC2010351))


ACsd2010 <- apply(AC2010, 2, sd)
ACmn2010 <- apply(AC2010, 2, mean)
ACmdn2010 <- apply(AC2010, 2, median)
ACmin2010 <- apply(AC2010, 2, min)
ACmax2010 <- apply(AC2010, 2, max)

ACsts2010 <- as.data.frame(cbind(ACmn2010, ACmdn2010, ACsd2010, ACmax2010, ACmin2010))
colnames(ACsts2010) <- c('Mean', 'Median', 'StdDev', 'Max', 'Min')
write.csv(ACsts2010, 'ACCA_YR_2010_STATS.csv')

ACsts2010 <- cbind(Date, DOY, ACsts2010)

ACmnp2010 <- as.data.frame(ACmn2010)
ACmnp2010$Stat <- "Mean"
ACmnp2010 <- cbind(Date, DOY, ACmnp2010)
colnames(ACmnp2010)[3] <- "Values"
ACminp2010 <- as.data.frame(ACmin2010)
ACminp2010$Stat <- "Min"
ACminp2010 <- cbind(Date, DOY, ACminp2010)
colnames(ACminp2010)[3] <- "Values"
ACmaxp2010 <- as.data.frame(ACmax2010)
ACmaxp2010$Stat <- "Max"
ACmaxp2010 <- cbind(Date, DOY, ACmaxp2010)
colnames(ACmaxp2010)[3] <- "Values"
ACstsp2010 <- rbind(ACmnp2010, ACminp2010, ACmaxp2010)
ACstsp2010$Stat <- as.factor(ACstsp2010$Stat)
#ACstsp2010$DOY <- as.factor(ACstsp2010$DOY)
ACstxl2010 <- filter(ACstsp2010, Values != 'NA')
#write.csv(ACstsp2010, 'ACstsp2010.csv')
write.csv(ACstxl2010, 'ACstxl2010.csv')


Bnd1.2010001 <- raster('APPEARS_2010/WELDUSWK.001_Band1_TOA_REF_doy2010001_aid0001.tif')
Bnd1.2010008 <- raster('APPEARS_2010/WELDUSWK.001_Band1_TOA_REF_doy2010008_aid0001.tif')
Bnd1.2010043 <- raster('APPEARS_2010/WELDUSWK.001_Band1_TOA_REF_doy2010043_aid0001.tif')
Bnd1.2010050 <- raster('APPEARS_2010/WELDUSWK.001_Band1_TOA_REF_doy2010050_aid0001.tif')
Bnd1.2010057 <- raster('APPEARS_2010/WELDUSWK.001_Band1_TOA_REF_doy2010057_aid0001.tif')
Bnd1.2010064 <- raster('APPEARS_2010/WELDUSWK.001_Band1_TOA_REF_doy2010064_aid0001.tif')
Bnd1.2010071 <- raster('APPEARS_2010/WELDUSWK.001_Band1_TOA_REF_doy2010071_aid0001.tif')
Bnd1.2010078 <- raster('APPEARS_2010/WELDUSWK.001_Band1_TOA_REF_doy2010078_aid0001.tif')
Bnd1.2010085 <- raster('APPEARS_2010/WELDUSWK.001_Band1_TOA_REF_doy2010085_aid0001.tif')
Bnd1.2010092 <- raster('APPEARS_2010/WELDUSWK.001_Band1_TOA_REF_doy2010092_aid0001.tif')
Bnd1.2010099 <- raster('APPEARS_2010/WELDUSWK.001_Band1_TOA_REF_doy2010099_aid0001.tif')
Bnd1.2010106 <- raster('APPEARS_2010/WELDUSWK.001_Band1_TOA_REF_doy2010106_aid0001.tif')
Bnd1.2010113 <- raster('APPEARS_2010/WELDUSWK.001_Band1_TOA_REF_doy2010113_aid0001.tif')
Bnd1.2010120 <- raster('APPEARS_2010/WELDUSWK.001_Band1_TOA_REF_doy2010120_aid0001.tif')
Bnd1.2010127 <- raster('APPEARS_2010/WELDUSWK.001_Band1_TOA_REF_doy2010127_aid0001.tif')
Bnd1.2010134 <- raster('APPEARS_2010/WELDUSWK.001_Band1_TOA_REF_doy2010134_aid0001.tif')
Bnd1.2010141 <- raster('APPEARS_2010/WELDUSWK.001_Band1_TOA_REF_doy2010141_aid0001.tif')
Bnd1.2010148 <- raster('APPEARS_2010/WELDUSWK.001_Band1_TOA_REF_doy2010148_aid0001.tif')
Bnd1.2010155 <- raster('APPEARS_2010/WELDUSWK.001_Band1_TOA_REF_doy2010155_aid0001.tif')
Bnd1.2010162 <- raster('APPEARS_2010/WELDUSWK.001_Band1_TOA_REF_doy2010162_aid0001.tif')
Bnd1.2010169 <- raster('APPEARS_2010/WELDUSWK.001_Band1_TOA_REF_doy2010169_aid0001.tif')
Bnd1.2010176 <- raster('APPEARS_2010/WELDUSWK.001_Band1_TOA_REF_doy2010176_aid0001.tif')
Bnd1.2010183 <- raster('APPEARS_2010/WELDUSWK.001_Band1_TOA_REF_doy2010183_aid0001.tif')
Bnd1.2010190 <- raster('APPEARS_2010/WELDUSWK.001_Band1_TOA_REF_doy2010190_aid0001.tif')
Bnd1.2010197 <- raster('APPEARS_2010/WELDUSWK.001_Band1_TOA_REF_doy2010197_aid0001.tif')
Bnd1.2010204 <- raster('APPEARS_2010/WELDUSWK.001_Band1_TOA_REF_doy2010204_aid0001.tif')
Bnd1.2010211 <- raster('APPEARS_2010/WELDUSWK.001_Band1_TOA_REF_doy2010211_aid0001.tif')
Bnd1.2010225 <- raster('APPEARS_2010/WELDUSWK.001_Band1_TOA_REF_doy2010225_aid0001.tif')
Bnd1.2010232 <- raster('APPEARS_2010/WELDUSWK.001_Band1_TOA_REF_doy2010232_aid0001.tif')
Bnd1.2010239 <- raster('APPEARS_2010/WELDUSWK.001_Band1_TOA_REF_doy2010239_aid0001.tif')
Bnd1.2010246 <- raster('APPEARS_2010/WELDUSWK.001_Band1_TOA_REF_doy2010246_aid0001.tif')
Bnd1.2010253 <- raster('APPEARS_2010/WELDUSWK.001_Band1_TOA_REF_doy2010253_aid0001.tif')
Bnd1.2010260 <- raster('APPEARS_2010/WELDUSWK.001_Band1_TOA_REF_doy2010260_aid0001.tif')
Bnd1.2010267 <- raster('APPEARS_2010/WELDUSWK.001_Band1_TOA_REF_doy2010267_aid0001.tif')
Bnd1.2010274 <- raster('APPEARS_2010/WELDUSWK.001_Band1_TOA_REF_doy2010274_aid0001.tif')
Bnd1.2010281 <- raster('APPEARS_2010/WELDUSWK.001_Band1_TOA_REF_doy2010281_aid0001.tif')
Bnd1.2010288 <- raster('APPEARS_2010/WELDUSWK.001_Band1_TOA_REF_doy2010288_aid0001.tif')
Bnd1.2010295 <- raster('APPEARS_2010/WELDUSWK.001_Band1_TOA_REF_doy2010295_aid0001.tif')
Bnd1.2010302 <- raster('APPEARS_2010/WELDUSWK.001_Band1_TOA_REF_doy2010302_aid0001.tif')
Bnd1.2010309 <- raster('APPEARS_2010/WELDUSWK.001_Band1_TOA_REF_doy2010309_aid0001.tif')
Bnd1.2010316 <- raster('APPEARS_2010/WELDUSWK.001_Band1_TOA_REF_doy2010316_aid0001.tif')
Bnd1.2010330 <- raster('APPEARS_2010/WELDUSWK.001_Band1_TOA_REF_doy2010330_aid0001.tif')
Bnd1.2010337 <- raster('APPEARS_2010/WELDUSWK.001_Band1_TOA_REF_doy2010337_aid0001.tif')
Bnd1.2010344 <- raster('APPEARS_2010/WELDUSWK.001_Band1_TOA_REF_doy2010344_aid0001.tif')
Bnd1.2010351 <- raster('APPEARS_2010/WELDUSWK.001_Band1_TOA_REF_doy2010351_aid0001.tif')

Bnd1.2010001 <- as.matrix(as.data.frame(values(Bnd1.2010001)))
Bnd1.2010008 <- as.matrix(as.data.frame(values(Bnd1.2010008)))
Bnd1.2010043 <- as.data.frame(values(Bnd1.2010043))
Bnd1.2010050 <- as.data.frame(values(Bnd1.2010050))
Bnd1.2010057 <- as.data.frame(values(Bnd1.2010057))
Bnd1.2010064 <- as.data.frame(values(Bnd1.2010064))
Bnd1.2010071 <- as.data.frame(values(Bnd1.2010071))
Bnd1.2010078 <- as.data.frame(values(Bnd1.2010078))
Bnd1.2010085 <- as.data.frame(values(Bnd1.2010085))
Bnd1.2010092 <- as.data.frame(values(Bnd1.2010092))
Bnd1.2010099 <- as.data.frame(values(Bnd1.2010099))
Bnd1.2010106 <- as.data.frame(values(Bnd1.2010106))
Bnd1.2010113 <- as.data.frame(values(Bnd1.2010113))
Bnd1.2010120 <- as.data.frame(values(Bnd1.2010120))
Bnd1.2010127 <- as.data.frame(values(Bnd1.2010127))
Bnd1.2010134 <- as.data.frame(values(Bnd1.2010134))
Bnd1.2010141 <- as.data.frame(values(Bnd1.2010141))
Bnd1.2010148 <- as.data.frame(values(Bnd1.2010148))
Bnd1.2010155 <- as.data.frame(values(Bnd1.2010155))
Bnd1.2010162 <- as.data.frame(values(Bnd1.2010162))
Bnd1.2010169 <- as.data.frame(values(Bnd1.2010169))
Bnd1.2010176 <- as.data.frame(values(Bnd1.2010176))
Bnd1.2010183 <- as.data.frame(values(Bnd1.2010183))
Bnd1.2010190 <- as.data.frame(values(Bnd1.2010190))
Bnd1.2010197 <- as.data.frame(values(Bnd1.2010197))
Bnd1.2010204 <- as.data.frame(values(Bnd1.2010204))
Bnd1.2010211 <- as.data.frame(values(Bnd1.2010211))
Bnd1.2010225 <- as.data.frame(values(Bnd1.2010225))
Bnd1.2010232 <- as.data.frame(values(Bnd1.2010232))
Bnd1.2010239 <- as.data.frame(values(Bnd1.2010239))
Bnd1.2010246 <- as.data.frame(values(Bnd1.2010246))
Bnd1.2010253 <- as.data.frame(values(Bnd1.2010253))
Bnd1.2010260 <- as.data.frame(values(Bnd1.2010260))
Bnd1.2010267 <- as.data.frame(values(Bnd1.2010267))
Bnd1.2010274 <- as.data.frame(values(Bnd1.2010274))
Bnd1.2010281 <- as.data.frame(values(Bnd1.2010281))
Bnd1.2010288 <- as.data.frame(values(Bnd1.2010288))
Bnd1.2010295 <- as.data.frame(values(Bnd1.2010295))
Bnd1.2010302 <- as.data.frame(values(Bnd1.2010302))
Bnd1.2010309 <- as.data.frame(values(Bnd1.2010309))
Bnd1.2010316 <- as.data.frame(values(Bnd1.2010316))
Bnd1.2010330 <- as.data.frame(values(Bnd1.2010330))
Bnd1.2010337 <- as.data.frame(values(Bnd1.2010337))
Bnd1.2010344 <- as.data.frame(values(Bnd1.2010344))
Bnd1.2010351 <- as.data.frame(values(Bnd1.2010351))







Bnd12010 <- as.data.frame(cbind(Bnd1.2010001, Bnd1.2010008, Bnd1.2010043, Bnd1.2010050, Bnd1.2010057,
                              Bnd1.2010064, Bnd1.2010071, Bnd1.2010078, Bnd1.2010085, Bnd1.2010092,
                              Bnd1.2010099, Bnd1.2010106, Bnd1.2010113, Bnd1.2010120, Bnd1.2010127,
                              Bnd1.2010134, Bnd1.2010141, Bnd1.2010148, Bnd1.2010155, Bnd1.2010162, 
                              Bnd1.2010169, Bnd1.2010176, Bnd1.2010183, Bnd1.2010190, Bnd1.2010197,
                              Bnd1.2010204, Bnd1.2010211, Bnd1.2010225, Bnd1.2010232, Bnd1.2010239,
                              Bnd1.2010246, Bnd1.2010253, Bnd1.2010260, Bnd1.2010267, Bnd1.2010274,
                              Bnd1.2010281, Bnd1.2010288, Bnd1.2010295, Bnd1.2010302, Bnd1.2010309,
                              Bnd1.2010316, Bnd1.2010330, Bnd1.2010337, Bnd1.2010344, Bnd1.2010351))


Bnd1sd2010 <- apply(Bnd12010, 2, sd)
Bnd1mn2010 <- apply(Bnd12010, 2, mean)
Bnd1mdn2010 <- apply(Bnd12010, 2, median)
Bnd1min2010 <- apply(Bnd12010, 2, min)
Bnd1max2010 <- apply(Bnd12010, 2, max)

Bnd1sts2010 <- as.data.frame(cbind(Bnd1mn2010, Bnd1mdn2010, Bnd1sd2010, Bnd1max2010, Bnd1min2010))
colnames(Bnd1sts2010) <- c('Mean', 'Median', 'StdDev', 'Max', 'Min')
write.csv(Bnd1sts2010, 'Bnd1CA_YR_2010_STATS.csv')

Bnd1sts2010 <- cbind(Date, DOY, Bnd1sts2010)

Bnd1mnp2010 <- as.data.frame(Bnd1mn2010)
Bnd1mnp2010$Stat <- "Mean"
Bnd1mnp2010 <- cbind(Date, DOY, Bnd1mnp2010)
colnames(Bnd1mnp2010)[3] <- "Values"
Bnd1minp2010 <- as.data.frame(Bnd1min2010)
Bnd1minp2010$Stat <- "Min"
Bnd1minp2010 <- cbind(Date, DOY, Bnd1minp2010)
colnames(Bnd1minp2010)[3] <- "Values"
Bnd1maxp2010 <- as.data.frame(Bnd1max2010)
Bnd1maxp2010$Stat <- "Max"
Bnd1maxp2010 <- cbind(Date, DOY, Bnd1maxp2010)
colnames(Bnd1maxp2010)[3] <- "Values"
Bnd1stsp2010 <- rbind(Bnd1mnp2010, Bnd1minp2010, Bnd1maxp2010)
Bnd1stsp2010$Stat <- as.factor(Bnd1stsp2010$Stat)
#Bnd1stsp2010$DOY <- as.factor(Bnd1stsp2010$DOY)
Bnd1stxl2010 <- filter(Bnd1stsp2010, Values != 'NA')
#write.csv(Bnd1stsp2010, 'Bnd1stsp2010.csv')
write.csv(Bnd1stxl2010, 'Bnd1stxl2010.csv')


Bnd2.2010001 <- raster('APPEARS_2010/WELDUSWK.001_Band2_TOA_REF_doy2010001_aid0001.tif')
Bnd2.2010008 <- raster('APPEARS_2010/WELDUSWK.001_Band2_TOA_REF_doy2010008_aid0001.tif')
Bnd2.2010043 <- raster('APPEARS_2010/WELDUSWK.001_Band2_TOA_REF_doy2010043_aid0001.tif')
Bnd2.2010050 <- raster('APPEARS_2010/WELDUSWK.001_Band2_TOA_REF_doy2010050_aid0001.tif')
Bnd2.2010057 <- raster('APPEARS_2010/WELDUSWK.001_Band2_TOA_REF_doy2010057_aid0001.tif')
Bnd2.2010064 <- raster('APPEARS_2010/WELDUSWK.001_Band2_TOA_REF_doy2010064_aid0001.tif')
Bnd2.2010071 <- raster('APPEARS_2010/WELDUSWK.001_Band2_TOA_REF_doy2010071_aid0001.tif')
Bnd2.2010078 <- raster('APPEARS_2010/WELDUSWK.001_Band2_TOA_REF_doy2010078_aid0001.tif')
Bnd2.2010085 <- raster('APPEARS_2010/WELDUSWK.001_Band2_TOA_REF_doy2010085_aid0001.tif')
Bnd2.2010092 <- raster('APPEARS_2010/WELDUSWK.001_Band2_TOA_REF_doy2010092_aid0001.tif')
Bnd2.2010099 <- raster('APPEARS_2010/WELDUSWK.001_Band2_TOA_REF_doy2010099_aid0001.tif')
Bnd2.2010106 <- raster('APPEARS_2010/WELDUSWK.001_Band2_TOA_REF_doy2010106_aid0001.tif')
Bnd2.2010113 <- raster('APPEARS_2010/WELDUSWK.001_Band2_TOA_REF_doy2010113_aid0001.tif')
Bnd2.2010120 <- raster('APPEARS_2010/WELDUSWK.001_Band2_TOA_REF_doy2010120_aid0001.tif')
Bnd2.2010127 <- raster('APPEARS_2010/WELDUSWK.001_Band2_TOA_REF_doy2010127_aid0001.tif')
Bnd2.2010134 <- raster('APPEARS_2010/WELDUSWK.001_Band2_TOA_REF_doy2010134_aid0001.tif')
Bnd2.2010141 <- raster('APPEARS_2010/WELDUSWK.001_Band2_TOA_REF_doy2010141_aid0001.tif')
Bnd2.2010148 <- raster('APPEARS_2010/WELDUSWK.001_Band2_TOA_REF_doy2010148_aid0001.tif')
Bnd2.2010155 <- raster('APPEARS_2010/WELDUSWK.001_Band2_TOA_REF_doy2010155_aid0001.tif')
Bnd2.2010162 <- raster('APPEARS_2010/WELDUSWK.001_Band2_TOA_REF_doy2010162_aid0001.tif')
Bnd2.2010169 <- raster('APPEARS_2010/WELDUSWK.001_Band2_TOA_REF_doy2010169_aid0001.tif')
Bnd2.2010176 <- raster('APPEARS_2010/WELDUSWK.001_Band2_TOA_REF_doy2010176_aid0001.tif')
Bnd2.2010183 <- raster('APPEARS_2010/WELDUSWK.001_Band2_TOA_REF_doy2010183_aid0001.tif')
Bnd2.2010190 <- raster('APPEARS_2010/WELDUSWK.001_Band2_TOA_REF_doy2010190_aid0001.tif')
Bnd2.2010197 <- raster('APPEARS_2010/WELDUSWK.001_Band2_TOA_REF_doy2010197_aid0001.tif')
Bnd2.2010204 <- raster('APPEARS_2010/WELDUSWK.001_Band2_TOA_REF_doy2010204_aid0001.tif')
Bnd2.2010211 <- raster('APPEARS_2010/WELDUSWK.001_Band2_TOA_REF_doy2010211_aid0001.tif')
Bnd2.2010225 <- raster('APPEARS_2010/WELDUSWK.001_Band2_TOA_REF_doy2010225_aid0001.tif')
Bnd2.2010232 <- raster('APPEARS_2010/WELDUSWK.001_Band2_TOA_REF_doy2010232_aid0001.tif')
Bnd2.2010239 <- raster('APPEARS_2010/WELDUSWK.001_Band2_TOA_REF_doy2010239_aid0001.tif')
Bnd2.2010246 <- raster('APPEARS_2010/WELDUSWK.001_Band2_TOA_REF_doy2010246_aid0001.tif')
Bnd2.2010253 <- raster('APPEARS_2010/WELDUSWK.001_Band2_TOA_REF_doy2010253_aid0001.tif')
Bnd2.2010260 <- raster('APPEARS_2010/WELDUSWK.001_Band2_TOA_REF_doy2010260_aid0001.tif')
Bnd2.2010267 <- raster('APPEARS_2010/WELDUSWK.001_Band2_TOA_REF_doy2010267_aid0001.tif')
Bnd2.2010274 <- raster('APPEARS_2010/WELDUSWK.001_Band2_TOA_REF_doy2010274_aid0001.tif')
Bnd2.2010281 <- raster('APPEARS_2010/WELDUSWK.001_Band2_TOA_REF_doy2010281_aid0001.tif')
Bnd2.2010288 <- raster('APPEARS_2010/WELDUSWK.001_Band2_TOA_REF_doy2010288_aid0001.tif')
Bnd2.2010295 <- raster('APPEARS_2010/WELDUSWK.001_Band2_TOA_REF_doy2010295_aid0001.tif')
Bnd2.2010302 <- raster('APPEARS_2010/WELDUSWK.001_Band2_TOA_REF_doy2010302_aid0001.tif')
Bnd2.2010309 <- raster('APPEARS_2010/WELDUSWK.001_Band2_TOA_REF_doy2010309_aid0001.tif')
Bnd2.2010316 <- raster('APPEARS_2010/WELDUSWK.001_Band2_TOA_REF_doy2010316_aid0001.tif')
Bnd2.2010330 <- raster('APPEARS_2010/WELDUSWK.001_Band2_TOA_REF_doy2010330_aid0001.tif')
Bnd2.2010337 <- raster('APPEARS_2010/WELDUSWK.001_Band2_TOA_REF_doy2010337_aid0001.tif')
Bnd2.2010344 <- raster('APPEARS_2010/WELDUSWK.001_Band2_TOA_REF_doy2010344_aid0001.tif')
Bnd2.2010351 <- raster('APPEARS_2010/WELDUSWK.001_Band2_TOA_REF_doy2010351_aid0001.tif')

Bnd2.2010001 <- as.matrix(as.data.frame(values(Bnd2.2010001)))
Bnd2.2010008 <- as.matrix(as.data.frame(values(Bnd2.2010008)))
Bnd2.2010043 <- as.data.frame(values(Bnd2.2010043))
Bnd2.2010050 <- as.data.frame(values(Bnd2.2010050))
Bnd2.2010057 <- as.data.frame(values(Bnd2.2010057))
Bnd2.2010064 <- as.data.frame(values(Bnd2.2010064))
Bnd2.2010071 <- as.data.frame(values(Bnd2.2010071))
Bnd2.2010078 <- as.data.frame(values(Bnd2.2010078))
Bnd2.2010085 <- as.data.frame(values(Bnd2.2010085))
Bnd2.2010092 <- as.data.frame(values(Bnd2.2010092))
Bnd2.2010099 <- as.data.frame(values(Bnd2.2010099))
Bnd2.2010106 <- as.data.frame(values(Bnd2.2010106))
Bnd2.2010113 <- as.data.frame(values(Bnd2.2010113))
Bnd2.2010120 <- as.data.frame(values(Bnd2.2010120))
Bnd2.2010127 <- as.data.frame(values(Bnd2.2010127))
Bnd2.2010134 <- as.data.frame(values(Bnd2.2010134))
Bnd2.2010141 <- as.data.frame(values(Bnd2.2010141))
Bnd2.2010148 <- as.data.frame(values(Bnd2.2010148))
Bnd2.2010155 <- as.data.frame(values(Bnd2.2010155))
Bnd2.2010162 <- as.data.frame(values(Bnd2.2010162))
Bnd2.2010169 <- as.data.frame(values(Bnd2.2010169))
Bnd2.2010176 <- as.data.frame(values(Bnd2.2010176))
Bnd2.2010183 <- as.data.frame(values(Bnd2.2010183))
Bnd2.2010190 <- as.data.frame(values(Bnd2.2010190))
Bnd2.2010197 <- as.data.frame(values(Bnd2.2010197))
Bnd2.2010204 <- as.data.frame(values(Bnd2.2010204))
Bnd2.2010211 <- as.data.frame(values(Bnd2.2010211))
Bnd2.2010225 <- as.data.frame(values(Bnd2.2010225))
Bnd2.2010232 <- as.data.frame(values(Bnd2.2010232))
Bnd2.2010239 <- as.data.frame(values(Bnd2.2010239))
Bnd2.2010246 <- as.data.frame(values(Bnd2.2010246))
Bnd2.2010253 <- as.data.frame(values(Bnd2.2010253))
Bnd2.2010260 <- as.data.frame(values(Bnd2.2010260))
Bnd2.2010267 <- as.data.frame(values(Bnd2.2010267))
Bnd2.2010274 <- as.data.frame(values(Bnd2.2010274))
Bnd2.2010281 <- as.data.frame(values(Bnd2.2010281))
Bnd2.2010288 <- as.data.frame(values(Bnd2.2010288))
Bnd2.2010295 <- as.data.frame(values(Bnd2.2010295))
Bnd2.2010302 <- as.data.frame(values(Bnd2.2010302))
Bnd2.2010309 <- as.data.frame(values(Bnd2.2010309))
Bnd2.2010316 <- as.data.frame(values(Bnd2.2010316))
Bnd2.2010330 <- as.data.frame(values(Bnd2.2010330))
Bnd2.2010337 <- as.data.frame(values(Bnd2.2010337))
Bnd2.2010344 <- as.data.frame(values(Bnd2.2010344))
Bnd2.2010351 <- as.data.frame(values(Bnd2.2010351))



Bnd22010 <- as.data.frame(cbind(Bnd2.2010001, Bnd2.2010008, Bnd2.2010043, Bnd2.2010050, Bnd2.2010057,
                                Bnd2.2010064, Bnd2.2010071, Bnd2.2010078, Bnd2.2010085, Bnd2.2010092,
                                Bnd2.2010099, Bnd2.2010106, Bnd2.2010113, Bnd2.2010120, Bnd2.2010127,
                                Bnd2.2010134, Bnd2.2010141, Bnd2.2010148, Bnd2.2010155, Bnd2.2010162, 
                                Bnd2.2010169, Bnd2.2010176, Bnd2.2010183, Bnd2.2010190, Bnd2.2010197,
                                Bnd2.2010204, Bnd2.2010211, Bnd2.2010225, Bnd2.2010232, Bnd2.2010239,
                                Bnd2.2010246, Bnd2.2010253, Bnd2.2010260, Bnd2.2010267, Bnd2.2010274,
                                Bnd2.2010281, Bnd2.2010288, Bnd2.2010295, Bnd2.2010302, Bnd2.2010309,
                                Bnd2.2010316, Bnd2.2010330, Bnd2.2010337, Bnd2.2010344, Bnd2.2010351))


Bnd2sd2010 <- apply(Bnd22010, 2, sd)
Bnd2mn2010 <- apply(Bnd22010, 2, mean)
Bnd2mdn2010 <- apply(Bnd22010, 2, median)
Bnd2min2010 <- apply(Bnd22010, 2, min)
Bnd2max2010 <- apply(Bnd22010, 2, max)

Bnd2sts2010 <- as.data.frame(cbind(Bnd2mn2010, Bnd2mdn2010, Bnd2sd2010, Bnd2max2010, Bnd2min2010))
colnames(Bnd2sts2010) <- c('Mean', 'Median', 'StdDev', 'Max', 'Min')
write.csv(Bnd2sts2010, 'Bnd2CA_YR_2010_STATS.csv')

Bnd2sts2010 <- cbind(Date, DOY, Bnd2sts2010)

Bnd2mnp2010 <- as.data.frame(Bnd2mn2010)
Bnd2mnp2010$Stat <- "Mean"
Bnd2mnp2010 <- cbind(Date, DOY, Bnd2mnp2010)
colnames(Bnd2mnp2010)[3] <- "Values"
Bnd2minp2010 <- as.data.frame(Bnd2min2010)
Bnd2minp2010$Stat <- "Min"
Bnd2minp2010 <- cbind(Date, DOY, Bnd2minp2010)
colnames(Bnd2minp2010)[3] <- "Values"
Bnd2maxp2010 <- as.data.frame(Bnd2max2010)
Bnd2maxp2010$Stat <- "Max"
Bnd2maxp2010 <- cbind(Date, DOY, Bnd2maxp2010)
colnames(Bnd2maxp2010)[3] <- "Values"
Bnd2stsp2010 <- rbind(Bnd2mnp2010, Bnd2minp2010, Bnd2maxp2010)
Bnd2stsp2010$Stat <- as.factor(Bnd2stsp2010$Stat)
#Bnd2stsp2010$DOY <- as.factor(Bnd2stsp2010$DOY)
Bnd2stxl2010 <- filter(Bnd2stsp2010, Values != 'NA')
#write.csv(Bnd2stsp2010, 'Bnd2stsp2010.csv')
write.csv(Bnd2stxl2010, 'Bnd2stxl2010.csv')



Bnd3.2010001 <- raster('APPEARS_2010/WELDUSWK.001_Band3_TOA_REF_doy2010001_aid0001.tif')
Bnd3.2010008 <- raster('APPEARS_2010/WELDUSWK.001_Band3_TOA_REF_doy2010008_aid0001.tif')
Bnd3.2010043 <- raster('APPEARS_2010/WELDUSWK.001_Band3_TOA_REF_doy2010043_aid0001.tif')
Bnd3.2010050 <- raster('APPEARS_2010/WELDUSWK.001_Band3_TOA_REF_doy2010050_aid0001.tif')
Bnd3.2010057 <- raster('APPEARS_2010/WELDUSWK.001_Band3_TOA_REF_doy2010057_aid0001.tif')
Bnd3.2010064 <- raster('APPEARS_2010/WELDUSWK.001_Band3_TOA_REF_doy2010064_aid0001.tif')
Bnd3.2010071 <- raster('APPEARS_2010/WELDUSWK.001_Band3_TOA_REF_doy2010071_aid0001.tif')
Bnd3.2010078 <- raster('APPEARS_2010/WELDUSWK.001_Band3_TOA_REF_doy2010078_aid0001.tif')
Bnd3.2010085 <- raster('APPEARS_2010/WELDUSWK.001_Band3_TOA_REF_doy2010085_aid0001.tif')
Bnd3.2010092 <- raster('APPEARS_2010/WELDUSWK.001_Band3_TOA_REF_doy2010092_aid0001.tif')
Bnd3.2010099 <- raster('APPEARS_2010/WELDUSWK.001_Band3_TOA_REF_doy2010099_aid0001.tif')
Bnd3.2010106 <- raster('APPEARS_2010/WELDUSWK.001_Band3_TOA_REF_doy2010106_aid0001.tif')
Bnd3.2010113 <- raster('APPEARS_2010/WELDUSWK.001_Band3_TOA_REF_doy2010113_aid0001.tif')
Bnd3.2010120 <- raster('APPEARS_2010/WELDUSWK.001_Band3_TOA_REF_doy2010120_aid0001.tif')
Bnd3.2010127 <- raster('APPEARS_2010/WELDUSWK.001_Band3_TOA_REF_doy2010127_aid0001.tif')
Bnd3.2010134 <- raster('APPEARS_2010/WELDUSWK.001_Band3_TOA_REF_doy2010134_aid0001.tif')
Bnd3.2010141 <- raster('APPEARS_2010/WELDUSWK.001_Band3_TOA_REF_doy2010141_aid0001.tif')
Bnd3.2010148 <- raster('APPEARS_2010/WELDUSWK.001_Band3_TOA_REF_doy2010148_aid0001.tif')
Bnd3.2010155 <- raster('APPEARS_2010/WELDUSWK.001_Band3_TOA_REF_doy2010155_aid0001.tif')
Bnd3.2010162 <- raster('APPEARS_2010/WELDUSWK.001_Band3_TOA_REF_doy2010162_aid0001.tif')
Bnd3.2010169 <- raster('APPEARS_2010/WELDUSWK.001_Band3_TOA_REF_doy2010169_aid0001.tif')
Bnd3.2010176 <- raster('APPEARS_2010/WELDUSWK.001_Band3_TOA_REF_doy2010176_aid0001.tif')
Bnd3.2010183 <- raster('APPEARS_2010/WELDUSWK.001_Band3_TOA_REF_doy2010183_aid0001.tif')
Bnd3.2010190 <- raster('APPEARS_2010/WELDUSWK.001_Band3_TOA_REF_doy2010190_aid0001.tif')
Bnd3.2010197 <- raster('APPEARS_2010/WELDUSWK.001_Band3_TOA_REF_doy2010197_aid0001.tif')
Bnd3.2010204 <- raster('APPEARS_2010/WELDUSWK.001_Band3_TOA_REF_doy2010204_aid0001.tif')
Bnd3.2010211 <- raster('APPEARS_2010/WELDUSWK.001_Band3_TOA_REF_doy2010211_aid0001.tif')
Bnd3.2010225 <- raster('APPEARS_2010/WELDUSWK.001_Band3_TOA_REF_doy2010225_aid0001.tif')
Bnd3.2010232 <- raster('APPEARS_2010/WELDUSWK.001_Band3_TOA_REF_doy2010232_aid0001.tif')
Bnd3.2010239 <- raster('APPEARS_2010/WELDUSWK.001_Band3_TOA_REF_doy2010239_aid0001.tif')
Bnd3.2010246 <- raster('APPEARS_2010/WELDUSWK.001_Band3_TOA_REF_doy2010246_aid0001.tif')
Bnd3.2010253 <- raster('APPEARS_2010/WELDUSWK.001_Band3_TOA_REF_doy2010253_aid0001.tif')
Bnd3.2010260 <- raster('APPEARS_2010/WELDUSWK.001_Band3_TOA_REF_doy2010260_aid0001.tif')
Bnd3.2010267 <- raster('APPEARS_2010/WELDUSWK.001_Band3_TOA_REF_doy2010267_aid0001.tif')
Bnd3.2010274 <- raster('APPEARS_2010/WELDUSWK.001_Band3_TOA_REF_doy2010274_aid0001.tif')
Bnd3.2010281 <- raster('APPEARS_2010/WELDUSWK.001_Band3_TOA_REF_doy2010281_aid0001.tif')
Bnd3.2010288 <- raster('APPEARS_2010/WELDUSWK.001_Band3_TOA_REF_doy2010288_aid0001.tif')
Bnd3.2010295 <- raster('APPEARS_2010/WELDUSWK.001_Band3_TOA_REF_doy2010295_aid0001.tif')
Bnd3.2010302 <- raster('APPEARS_2010/WELDUSWK.001_Band3_TOA_REF_doy2010302_aid0001.tif')
Bnd3.2010309 <- raster('APPEARS_2010/WELDUSWK.001_Band3_TOA_REF_doy2010309_aid0001.tif')
Bnd3.2010316 <- raster('APPEARS_2010/WELDUSWK.001_Band3_TOA_REF_doy2010316_aid0001.tif')
Bnd3.2010330 <- raster('APPEARS_2010/WELDUSWK.001_Band3_TOA_REF_doy2010330_aid0001.tif')
Bnd3.2010337 <- raster('APPEARS_2010/WELDUSWK.001_Band3_TOA_REF_doy2010337_aid0001.tif')
Bnd3.2010344 <- raster('APPEARS_2010/WELDUSWK.001_Band3_TOA_REF_doy2010344_aid0001.tif')
Bnd3.2010351 <- raster('APPEARS_2010/WELDUSWK.001_Band3_TOA_REF_doy2010351_aid0001.tif')

Bnd3.2010001 <- as.matrix(as.data.frame(values(Bnd3.2010001)))
Bnd3.2010008 <- as.matrix(as.data.frame(values(Bnd3.2010008)))
Bnd3.2010043 <- as.data.frame(values(Bnd3.2010043))
Bnd3.2010050 <- as.data.frame(values(Bnd3.2010050))
Bnd3.2010057 <- as.data.frame(values(Bnd3.2010057))
Bnd3.2010064 <- as.data.frame(values(Bnd3.2010064))
Bnd3.2010071 <- as.data.frame(values(Bnd3.2010071))
Bnd3.2010078 <- as.data.frame(values(Bnd3.2010078))
Bnd3.2010085 <- as.data.frame(values(Bnd3.2010085))
Bnd3.2010092 <- as.data.frame(values(Bnd3.2010092))
Bnd3.2010099 <- as.data.frame(values(Bnd3.2010099))
Bnd3.2010106 <- as.data.frame(values(Bnd3.2010106))
Bnd3.2010113 <- as.data.frame(values(Bnd3.2010113))
Bnd3.2010120 <- as.data.frame(values(Bnd3.2010120))
Bnd3.2010127 <- as.data.frame(values(Bnd3.2010127))
Bnd3.2010134 <- as.data.frame(values(Bnd3.2010134))
Bnd3.2010141 <- as.data.frame(values(Bnd3.2010141))
Bnd3.2010148 <- as.data.frame(values(Bnd3.2010148))
Bnd3.2010155 <- as.data.frame(values(Bnd3.2010155))
Bnd3.2010162 <- as.data.frame(values(Bnd3.2010162))
Bnd3.2010169 <- as.data.frame(values(Bnd3.2010169))
Bnd3.2010176 <- as.data.frame(values(Bnd3.2010176))
Bnd3.2010183 <- as.data.frame(values(Bnd3.2010183))
Bnd3.2010190 <- as.data.frame(values(Bnd3.2010190))
Bnd3.2010197 <- as.data.frame(values(Bnd3.2010197))
Bnd3.2010204 <- as.data.frame(values(Bnd3.2010204))
Bnd3.2010211 <- as.data.frame(values(Bnd3.2010211))
Bnd3.2010225 <- as.data.frame(values(Bnd3.2010225))
Bnd3.2010232 <- as.data.frame(values(Bnd3.2010232))
Bnd3.2010239 <- as.data.frame(values(Bnd3.2010239))
Bnd3.2010246 <- as.data.frame(values(Bnd3.2010246))
Bnd3.2010253 <- as.data.frame(values(Bnd3.2010253))
Bnd3.2010260 <- as.data.frame(values(Bnd3.2010260))
Bnd3.2010267 <- as.data.frame(values(Bnd3.2010267))
Bnd3.2010274 <- as.data.frame(values(Bnd3.2010274))
Bnd3.2010281 <- as.data.frame(values(Bnd3.2010281))
Bnd3.2010288 <- as.data.frame(values(Bnd3.2010288))
Bnd3.2010295 <- as.data.frame(values(Bnd3.2010295))
Bnd3.2010302 <- as.data.frame(values(Bnd3.2010302))
Bnd3.2010309 <- as.data.frame(values(Bnd3.2010309))
Bnd3.2010316 <- as.data.frame(values(Bnd3.2010316))
Bnd3.2010330 <- as.data.frame(values(Bnd3.2010330))
Bnd3.2010337 <- as.data.frame(values(Bnd3.2010337))
Bnd3.2010344 <- as.data.frame(values(Bnd3.2010344))
Bnd3.2010351 <- as.data.frame(values(Bnd3.2010351))



Bnd32010 <- as.data.frame(cbind(Bnd3.2010001, Bnd3.2010008, Bnd3.2010043, Bnd3.2010050, Bnd3.2010057,
                                Bnd3.2010064, Bnd3.2010071, Bnd3.2010078, Bnd3.2010085, Bnd3.2010092,
                                Bnd3.2010099, Bnd3.2010106, Bnd3.2010113, Bnd3.2010120, Bnd3.2010127,
                                Bnd3.2010134, Bnd3.2010141, Bnd3.2010148, Bnd3.2010155, Bnd3.2010162, 
                                Bnd3.2010169, Bnd3.2010176, Bnd3.2010183, Bnd3.2010190, Bnd3.2010197,
                                Bnd3.2010204, Bnd3.2010211, Bnd3.2010225, Bnd3.2010232, Bnd3.2010239,
                                Bnd3.2010246, Bnd3.2010253, Bnd3.2010260, Bnd3.2010267, Bnd3.2010274,
                                Bnd3.2010281, Bnd3.2010288, Bnd3.2010295, Bnd3.2010302, Bnd3.2010309,
                                Bnd3.2010316, Bnd3.2010330, Bnd3.2010337, Bnd3.2010344, Bnd3.2010351))


Bnd3sd2010 <- apply(Bnd32010, 2, sd)
Bnd3mn2010 <- apply(Bnd32010, 2, mean)
Bnd3mdn2010 <- apply(Bnd32010, 2, median)
Bnd3min2010 <- apply(Bnd32010, 2, min)
Bnd3max2010 <- apply(Bnd32010, 2, max)

Bnd3sts2010 <- as.data.frame(cbind(Bnd3mn2010, Bnd3mdn2010, Bnd3sd2010, Bnd3max2010, Bnd3min2010))
colnames(Bnd3sts2010) <- c('Mean', 'Median', 'StdDev', 'Max', 'Min')
write.csv(Bnd3sts2010, 'Bnd3CA_YR_2010_STATS.csv')

Bnd3sts2010 <- cbind(Date, DOY, Bnd3sts2010)

Bnd3mnp2010 <- as.data.frame(Bnd3mn2010)
Bnd3mnp2010$Stat <- "Mean"
Bnd3mnp2010 <- cbind(Date, DOY, Bnd3mnp2010)
colnames(Bnd3mnp2010)[3] <- "Values"
Bnd3minp2010 <- as.data.frame(Bnd3min2010)
Bnd3minp2010$Stat <- "Min"
Bnd3minp2010 <- cbind(Date, DOY, Bnd3minp2010)
colnames(Bnd3minp2010)[3] <- "Values"
Bnd3maxp2010 <- as.data.frame(Bnd3max2010)
Bnd3maxp2010$Stat <- "Max"
Bnd3maxp2010 <- cbind(Date, DOY, Bnd3maxp2010)
colnames(Bnd3maxp2010)[3] <- "Values"
Bnd3stsp2010 <- rbind(Bnd3mnp2010, Bnd3minp2010, Bnd3maxp2010)
Bnd3stsp2010$Stat <- as.factor(Bnd3stsp2010$Stat)
#Bnd3stsp2010$DOY <- as.factor(Bnd3stsp2010$DOY)
Bnd3stxl2010 <- filter(Bnd3stsp2010, Values != 'NA')
#write.csv(Bnd3stsp2010, 'Bnd3stsp2010.csv')
write.csv(Bnd3stxl2010, 'Bnd3stxl2010.csv')



Bnd4.2010001 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/3ad01b62-7181-4129-a7e7-882a4e77f50f/WELDUSWK.001_Band4_TOA_REF_doy2010001_aid0001.tif')
Bnd4.2010008 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/1e53de53-1d28-4ffc-9c30-55d9aa6a0091/WELDUSWK.001_Band4_TOA_REF_doy2010008_aid0001.tif')
Bnd4.2010043 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/e2b019e1-9e39-439c-8c97-7b47f3ad125e/WELDUSWK.001_Band4_TOA_REF_doy2010043_aid0001.tif')
Bnd4.2010050 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/e35c984b-f542-47d3-a305-5e434e7df2bd/WELDUSWK.001_Band4_TOA_REF_doy2010050_aid0001.tif')
Bnd4.2010057 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/0e78da64-fcb0-485e-9c82-f38565fd55e5/WELDUSWK.001_Band4_TOA_REF_doy2010057_aid0001.tif')
Bnd4.2010064 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/677098e1-0b49-4b0d-8fb0-94dd98d4cbb0/WELDUSWK.001_Band4_TOA_REF_doy2010064_aid0001.tif')
Bnd4.2010071 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/ee2eb9da-09d2-4312-bbc0-302e5090234e/WELDUSWK.001_Band4_TOA_REF_doy2010071_aid0001.tif')
Bnd4.2010078 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/4ef4f9db-4296-42d2-9ab5-47ae091eb4ec/WELDUSWK.001_Band4_TOA_REF_doy2010078_aid0001.tif')
Bnd4.2010085 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/145059d2-4b6a-4f29-ba3d-197efa417d77/WELDUSWK.001_Band4_TOA_REF_doy2010085_aid0001.tif')
Bnd4.2010092 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/dc022cda-e623-44b8-ad7f-e36fda81f2e2/WELDUSWK.001_Band4_TOA_REF_doy2010092_aid0001.tif')
Bnd4.2010099 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/20f87174-3084-4fe9-bcec-94b2655e9724/WELDUSWK.001_Band4_TOA_REF_doy2010099_aid0001.tif')
Bnd4.2010106 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/027305ac-1bbc-41db-ac1b-268a062c77dc/WELDUSWK.001_Band4_TOA_REF_doy2010106_aid0001.tif')
Bnd4.2010113 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/7aef5bed-84c5-4cb7-8657-277c9e974c3a/WELDUSWK.001_Band4_TOA_REF_doy2010113_aid0001.tif')
Bnd4.2010120 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/60c161f3-e6bf-4b5d-831a-ca91705dceca/WELDUSWK.001_Band4_TOA_REF_doy2010120_aid0001.tif')
Bnd4.2010127 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/f940c6c9-bf12-4db9-b310-0c0c0d64744a/WELDUSWK.001_Band4_TOA_REF_doy2010127_aid0001.tif')
Bnd4.2010134 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/d87f5bd8-cc41-4f5d-b682-8db0bded88cb/WELDUSWK.001_Band4_TOA_REF_doy2010134_aid0001.tif')
Bnd4.2010141 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/65c9ab59-edc0-4b3c-8050-e6af8e4dd564/WELDUSWK.001_Band4_TOA_REF_doy2010141_aid0001.tif')
Bnd4.2010148 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/1add2f46-e3ce-407a-804c-f87089ede632/WELDUSWK.001_Band4_TOA_REF_doy2010148_aid0001.tif')
Bnd4.2010155 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/94caff93-1bb9-4383-a890-7d92fc8f7c66/WELDUSWK.001_Band4_TOA_REF_doy2010155_aid0001.tif')
Bnd4.2010162 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/45161e20-a2e4-4f6a-8656-14ad06a3cc66/WELDUSWK.001_Band4_TOA_REF_doy2010162_aid0001.tif')
Bnd4.2010169 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/983425d2-eda1-4060-bd2f-7eccab959b6b/WELDUSWK.001_Band4_TOA_REF_doy2010169_aid0001.tif')
Bnd4.2010176 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/344933d2-3d27-42be-bc26-8ab280eb9c5e/WELDUSWK.001_Band4_TOA_REF_doy2010176_aid0001.tif')
Bnd4.2010183 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/77f9aaa2-28e2-4db7-9c29-cf1d4c7b11b9/WELDUSWK.001_Band4_TOA_REF_doy2010183_aid0001.tif')
Bnd4.2010190 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/ca605da6-00d4-4450-a681-207a6e6b1062/WELDUSWK.001_Band4_TOA_REF_doy2010190_aid0001.tif')
Bnd4.2010197 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/20d1ccbb-9fe6-48b3-a3be-420e5dcbfd9e/WELDUSWK.001_Band4_TOA_REF_doy2010197_aid0001.tif')
Bnd4.2010204 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/58de4eee-a3c3-483e-8cff-2a5085964c77/WELDUSWK.001_Band4_TOA_REF_doy2010204_aid0001.tif')
Bnd4.2010211 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/e3ce0ace-7c18-4809-b7b6-3a9c7d19df14/WELDUSWK.001_Band4_TOA_REF_doy2010211_aid0001.tif')
Bnd4.2010225 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/004db022-8022-476f-a95b-e7c7f1b49b2d/WELDUSWK.001_Band4_TOA_REF_doy2010225_aid0001.tif')
Bnd4.2010232 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/5d242fcd-71f3-40f0-862c-a8620c882c83/WELDUSWK.001_Band4_TOA_REF_doy2010232_aid0001.tif')
Bnd4.2010239 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/280beac0-d1b2-4f94-9d6d-9a824934672c/WELDUSWK.001_Band4_TOA_REF_doy2010239_aid0001.tif')
Bnd4.2010246 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/e4e2fb3a-7f39-466b-9c54-e25a9ad337ef/WELDUSWK.001_Band4_TOA_REF_doy2010246_aid0001.tif')
Bnd4.2010253 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/76a7688c-a5d6-4de9-b77f-e568922db4e3/WELDUSWK.001_Band4_TOA_REF_doy2010253_aid0001.tif')
Bnd4.2010260 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/4fedb87c-7f77-42a3-99a8-878bf70adcb4/WELDUSWK.001_Band4_TOA_REF_doy2010260_aid0001.tif')
Bnd4.2010267 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/7425ff7c-9a40-4e71-9da7-49cbb77b8d29/WELDUSWK.001_Band4_TOA_REF_doy2010267_aid0001.tif')
Bnd4.2010274 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/a6f4f345-75de-4c09-966c-151f548dc77d/WELDUSWK.001_Band4_TOA_REF_doy2010274_aid0001.tif')
Bnd4.2010281 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/973f50a9-93b4-4248-9f02-e2bc8f4697e2/WELDUSWK.001_Band4_TOA_REF_doy2010281_aid0001.tif')
Bnd4.2010288 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/aa57b147-bc5d-471f-a356-e944c900e818/WELDUSWK.001_Band4_TOA_REF_doy2010288_aid0001.tif')
Bnd4.2010295 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/7b62f2fe-2467-4a8f-90e3-0857692488c2/WELDUSWK.001_Band4_TOA_REF_doy2010295_aid0001.tif')
Bnd4.2010302 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/7cd48fef-94a3-4a39-b4ed-6eb69d6db4d7/WELDUSWK.001_Band4_TOA_REF_doy2010302_aid0001.tif')
Bnd4.2010309 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/87b1f5c4-3adc-4542-94ad-69e378ed2e4f/WELDUSWK.001_Band4_TOA_REF_doy2010309_aid0001.tif')
Bnd4.2010316 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/f6465170-bc61-4c2e-88e0-8c5306688c4e/WELDUSWK.001_Band4_TOA_REF_doy2010316_aid0001.tif')
Bnd4.2010330 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/dbfe5c19-2d3f-4020-8499-b932ef0fd496/WELDUSWK.001_Band4_TOA_REF_doy2010330_aid0001.tif')
Bnd4.2010337 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/4ef5cd93-44bf-465f-a22e-03960c81e9a6/WELDUSWK.001_Band4_TOA_REF_doy2010337_aid0001.tif')
Bnd4.2010344 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/d37d9ac2-b350-4d08-b505-6215e4e4d7dd/WELDUSWK.001_Band4_TOA_REF_doy2010344_aid0001.tif')
Bnd4.2010351 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/517217e5-a1bb-4134-8c42-d0880fd06604/WELDUSWK.001_Band4_TOA_REF_doy2010351_aid0001.tif')



Bnd4.2010001 <- as.matrix(as.data.frame(values(Bnd4.2010001)))
Bnd4.2010008 <- as.matrix(as.data.frame(values(Bnd4.2010008)))
Bnd4.2010043 <- as.data.frame(values(Bnd4.2010043))
Bnd4.2010050 <- as.data.frame(values(Bnd4.2010050))
Bnd4.2010057 <- as.data.frame(values(Bnd4.2010057))
Bnd4.2010064 <- as.data.frame(values(Bnd4.2010064))
Bnd4.2010071 <- as.data.frame(values(Bnd4.2010071))
Bnd4.2010078 <- as.data.frame(values(Bnd4.2010078))
Bnd4.2010085 <- as.data.frame(values(Bnd4.2010085))
Bnd4.2010092 <- as.data.frame(values(Bnd4.2010092))
Bnd4.2010099 <- as.data.frame(values(Bnd4.2010099))
Bnd4.2010106 <- as.data.frame(values(Bnd4.2010106))
Bnd4.2010113 <- as.data.frame(values(Bnd4.2010113))
Bnd4.2010120 <- as.data.frame(values(Bnd4.2010120))
Bnd4.2010127 <- as.data.frame(values(Bnd4.2010127))
Bnd4.2010134 <- as.data.frame(values(Bnd4.2010134))
Bnd4.2010141 <- as.data.frame(values(Bnd4.2010141))
Bnd4.2010148 <- as.data.frame(values(Bnd4.2010148))
Bnd4.2010155 <- as.data.frame(values(Bnd4.2010155))
Bnd4.2010162 <- as.data.frame(values(Bnd4.2010162))
Bnd4.2010169 <- as.data.frame(values(Bnd4.2010169))
Bnd4.2010176 <- as.data.frame(values(Bnd4.2010176))
Bnd4.2010183 <- as.data.frame(values(Bnd4.2010183))
Bnd4.2010190 <- as.data.frame(values(Bnd4.2010190))
Bnd4.2010197 <- as.data.frame(values(Bnd4.2010197))
Bnd4.2010204 <- as.data.frame(values(Bnd4.2010204))
Bnd4.2010211 <- as.data.frame(values(Bnd4.2010211))
Bnd4.2010225 <- as.data.frame(values(Bnd4.2010225))
Bnd4.2010232 <- as.data.frame(values(Bnd4.2010232))
Bnd4.2010239 <- as.data.frame(values(Bnd4.2010239))
Bnd4.2010246 <- as.data.frame(values(Bnd4.2010246))
Bnd4.2010253 <- as.data.frame(values(Bnd4.2010253))
Bnd4.2010260 <- as.data.frame(values(Bnd4.2010260))
Bnd4.2010267 <- as.data.frame(values(Bnd4.2010267))
Bnd4.2010274 <- as.data.frame(values(Bnd4.2010274))
Bnd4.2010281 <- as.data.frame(values(Bnd4.2010281))
Bnd4.2010288 <- as.data.frame(values(Bnd4.2010288))
Bnd4.2010295 <- as.data.frame(values(Bnd4.2010295))
Bnd4.2010302 <- as.data.frame(values(Bnd4.2010302))
Bnd4.2010309 <- as.data.frame(values(Bnd4.2010309))
Bnd4.2010316 <- as.data.frame(values(Bnd4.2010316))
Bnd4.2010330 <- as.data.frame(values(Bnd4.2010330))
Bnd4.2010337 <- as.data.frame(values(Bnd4.2010337))
Bnd4.2010344 <- as.data.frame(values(Bnd4.2010344))
Bnd4.2010351 <- as.data.frame(values(Bnd4.2010351))



Bnd42010 <- as.data.frame(cbind(Bnd4.2010001, Bnd4.2010008, Bnd4.2010043, Bnd4.2010050, Bnd4.2010057,
                                Bnd4.2010064, Bnd4.2010071, Bnd4.2010078, Bnd4.2010085, Bnd4.2010092,
                                Bnd4.2010099, Bnd4.2010106, Bnd4.2010113, Bnd4.2010120, Bnd4.2010127,
                                Bnd4.2010134, Bnd4.2010141, Bnd4.2010148, Bnd4.2010155, Bnd4.2010162, 
                                Bnd4.2010169, Bnd4.2010176, Bnd4.2010183, Bnd4.2010190, Bnd4.2010197,
                                Bnd4.2010204, Bnd4.2010211, Bnd4.2010225, Bnd4.2010232, Bnd4.2010239,
                                Bnd4.2010246, Bnd4.2010253, Bnd4.2010260, Bnd4.2010267, Bnd4.2010274,
                                Bnd4.2010281, Bnd4.2010288, Bnd4.2010295, Bnd4.2010302, Bnd4.2010309,
                                Bnd4.2010316, Bnd4.2010330, Bnd4.2010337, Bnd4.2010344, Bnd4.2010351))


Bnd4sd2010 <- apply(Bnd42010, 2, sd)
Bnd4mn2010 <- apply(Bnd42010, 2, mean)
Bnd4mdn2010 <- apply(Bnd42010, 2, median)
Bnd4min2010 <- apply(Bnd42010, 2, min)
Bnd4max2010 <- apply(Bnd42010, 2, max)

Bnd4sts2010 <- as.data.frame(cbind(Bnd4mn2010, Bnd4mdn2010, Bnd4sd2010, Bnd4max2010, Bnd4min2010))
colnames(Bnd4sts2010) <- c('Mean', 'Median', 'StdDev', 'Max', 'Min')
write.csv(Bnd4sts2010, 'Bnd4CA_YR_2010_STATS.csv')

Bnd4sts2010 <- cbind(Date, DOY, Bnd4sts2010)

Bnd4mnp2010 <- as.data.frame(Bnd4mn2010)
Bnd4mnp2010$Stat <- "Mean"
Bnd4mnp2010 <- cbind(Date, DOY, Bnd4mnp2010)
colnames(Bnd4mnp2010)[3] <- "Values"
Bnd4minp2010 <- as.data.frame(Bnd4min2010)
Bnd4minp2010$Stat <- "Min"
Bnd4minp2010 <- cbind(Date, DOY, Bnd4minp2010)
colnames(Bnd4minp2010)[3] <- "Values"
Bnd4maxp2010 <- as.data.frame(Bnd4max2010)
Bnd4maxp2010$Stat <- "Max"
Bnd4maxp2010 <- cbind(Date, DOY, Bnd4maxp2010)
colnames(Bnd4maxp2010)[3] <- "Values"
Bnd4stsp2010 <- rbind(Bnd4mnp2010, Bnd4minp2010, Bnd4maxp2010)
Bnd4stsp2010$Stat <- as.factor(Bnd4stsp2010$Stat)
#Bnd4stsp2010$DOY <- as.factor(Bnd4stsp2010$DOY)
Bnd4stxl2010 <- filter(Bnd4stsp2010, Values != 'NA')
#write.csv(Bnd4stsp2010, 'Bnd4stsp2010.csv')
write.csv(Bnd4stxl2010, 'Bnd4stxl2010.csv')


Bnd5.2010001 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/ce667762-772a-460e-a38d-4538945cbc99/WELDUSWK.001_Band5_TOA_REF_doy2010001_aid0001.tif')
Bnd5.2010008 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/c5dd9a82-78f2-4480-9d28-2be1aa872509/WELDUSWK.001_Band5_TOA_REF_doy2010008_aid0001.tif')
Bnd5.2010043 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/93970d7f-4c4d-4bd5-ba27-297f2008d7f6/WELDUSWK.001_Band5_TOA_REF_doy2010043_aid0001.tif')
Bnd5.2010050 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/d9e3e961-eda2-477a-916a-f94a3b6773d8/WELDUSWK.001_Band5_TOA_REF_doy2010050_aid0001.tif')
Bnd5.2010057 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/5118590e-b0bf-458e-baca-8dde99923124/WELDUSWK.001_Band5_TOA_REF_doy2010057_aid0001.tif')
Bnd5.2010064 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/4a48eb95-c93e-439a-9489-8f85ff6002df/WELDUSWK.001_Band5_TOA_REF_doy2010064_aid0001.tif')
Bnd5.2010071 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/6a9f0d03-5d69-4895-8b0a-c523ad38f9c6/WELDUSWK.001_Band5_TOA_REF_doy2010071_aid0001.tif')
Bnd5.2010078 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/c7c9bbc1-c035-4af6-91a7-b58b9abfa557/WELDUSWK.001_Band5_TOA_REF_doy2010078_aid0001.tif')
Bnd5.2010085 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/eaa77c3a-eff3-423c-86e9-e73de9afc39e/WELDUSWK.001_Band5_TOA_REF_doy2010085_aid0001.tif')
Bnd5.2010092 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/1637ad26-d4df-4432-b4db-c71165ef884b/WELDUSWK.001_Band5_TOA_REF_doy2010092_aid0001.tif')
Bnd5.2010099 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/e5fcd958-4d29-4c84-8340-53a7a45bbf09/WELDUSWK.001_Band5_TOA_REF_doy2010099_aid0001.tif')
Bnd5.2010106 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/f068ccf1-38e3-4b74-9d55-827c9643c850/WELDUSWK.001_Band5_TOA_REF_doy2010106_aid0001.tif')
Bnd5.2010113 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/2286867b-e937-4bc2-b936-6ed3d40c9c33/WELDUSWK.001_Band5_TOA_REF_doy2010113_aid0001.tif')
Bnd5.2010120 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/5187b156-2d6e-4af2-a292-7c4377132ada/WELDUSWK.001_Band5_TOA_REF_doy2010120_aid0001.tif')
Bnd5.2010127 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/aa39e3b1-9da6-440b-aebc-23c628dbe7e7/WELDUSWK.001_Band5_TOA_REF_doy2010127_aid0001.tif')
Bnd5.2010134 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/4c113e15-baa7-4d1e-9ca2-b12e1a9e0cb2/WELDUSWK.001_Band5_TOA_REF_doy2010134_aid0001.tif')
Bnd5.2010141 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/628cd83d-121b-4b0b-b51c-d95a68e89064/WELDUSWK.001_Band5_TOA_REF_doy2010141_aid0001.tif')
Bnd5.2010148 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/06f29762-0666-425c-95ba-fe80bc20407a/WELDUSWK.001_Band5_TOA_REF_doy2010148_aid0001.tif')
Bnd5.2010155 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/d3e5ee8a-1763-46af-8c31-c2a46917aa02/WELDUSWK.001_Band5_TOA_REF_doy2010155_aid0001.tif')
Bnd5.2010162 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/82ba8ebe-7719-48dd-8e6f-48e96283f6a7/WELDUSWK.001_Band5_TOA_REF_doy2010162_aid0001.tif')
Bnd5.2010169 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/87777ba0-4637-47c3-a61e-7aeebf03e1a6/WELDUSWK.001_Band5_TOA_REF_doy2010169_aid0001.tif')
Bnd5.2010176 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/b71bc251-0145-4fce-872f-484ceece1a95/WELDUSWK.001_Band5_TOA_REF_doy2010176_aid0001.tif')
Bnd5.2010183 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/b8ac2e30-fc84-42fd-9590-f3700263c3c0/WELDUSWK.001_Band5_TOA_REF_doy2010183_aid0001.tif')
Bnd5.2010190 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/7b9aa5e8-e44e-4af3-8cd7-5878b805b81b/WELDUSWK.001_Band5_TOA_REF_doy2010190_aid0001.tif')
Bnd5.2010197 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/a9972097-02fe-4da1-82a6-f05ae3d6c3a5/WELDUSWK.001_Band5_TOA_REF_doy2010197_aid0001.tif')
Bnd5.2010204 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/0409ee03-c105-4278-9a4c-7a6d19a3815a/WELDUSWK.001_Band5_TOA_REF_doy2010204_aid0001.tif')
Bnd5.2010211 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/c5f1dfe7-a104-4e66-ba08-cfbc0986f1e8/WELDUSWK.001_Band5_TOA_REF_doy2010211_aid0001.tif')
Bnd5.2010225 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/2aad09af-a43c-4cd8-a485-3c32c03fdce1/WELDUSWK.001_Band5_TOA_REF_doy2010225_aid0001.tif')
Bnd5.2010232 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/068dd405-3fbd-4fc3-926d-93af92148bf6/WELDUSWK.001_Band5_TOA_REF_doy2010232_aid0001.tif')
Bnd5.2010239 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/1a92b01b-f4b3-4620-b7f4-f87c9f1404d4/WELDUSWK.001_Band5_TOA_REF_doy2010239_aid0001.tif')
Bnd5.2010246 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/e292508f-e30e-4849-9add-1bfbc02d2e2b/WELDUSWK.001_Band5_TOA_REF_doy2010246_aid0001.tif')
Bnd5.2010253 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/97ad8b5f-a45a-4f5d-92e3-804ad4054d15/WELDUSWK.001_Band5_TOA_REF_doy2010253_aid0001.tif')
Bnd5.2010260 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/15e08c87-c987-450e-bda5-e4d337d34905/WELDUSWK.001_Band5_TOA_REF_doy2010260_aid0001.tif')
Bnd5.2010267 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/47e45b7b-7989-4729-99e0-6c26672f2c5a/WELDUSWK.001_Band5_TOA_REF_doy2010267_aid0001.tif')
Bnd5.2010274 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/d777fd3a-f116-4f84-ac93-c37022073575/WELDUSWK.001_Band5_TOA_REF_doy2010274_aid0001.tif')
Bnd5.2010281 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/c8f20879-a328-454b-ab65-b433069186ea/WELDUSWK.001_Band5_TOA_REF_doy2010281_aid0001.tif')
Bnd5.2010288 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/4eea1e59-9df6-4ea8-a9e4-05225f8e8f6d/WELDUSWK.001_Band5_TOA_REF_doy2010288_aid0001.tif')
Bnd5.2010295 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/56e0e1b1-e565-45b0-a4db-299cc488f287/WELDUSWK.001_Band5_TOA_REF_doy2010295_aid0001.tif')
Bnd5.2010302 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/267ab119-d59d-43da-a415-727737dd7933/WELDUSWK.001_Band5_TOA_REF_doy2010302_aid0001.tif')
Bnd5.2010309 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/1da20f27-3b86-4714-ba5a-cd672c97d655/WELDUSWK.001_Band5_TOA_REF_doy2010309_aid0001.tif')
Bnd5.2010316 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/cec5d31f-fe64-4b60-9d63-dc458b0c3203/WELDUSWK.001_Band5_TOA_REF_doy2010316_aid0001.tif')
Bnd5.2010330 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/0ae44fd6-fc48-4407-8766-77749b0882a6/WELDUSWK.001_Band5_TOA_REF_doy2010330_aid0001.tif')
Bnd5.2010337 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/7b51060d-dbfa-4ba9-8740-5dcf07210f39/WELDUSWK.001_Band5_TOA_REF_doy2010337_aid0001.tif')
Bnd5.2010344 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/56fa8864-41bd-4a84-a5df-faa2d2aa98bd/WELDUSWK.001_Band5_TOA_REF_doy2010344_aid0001.tif')
Bnd5.2010351 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/e90a9544-c997-4d1f-9f64-bd577efb2a59/WELDUSWK.001_Band5_TOA_REF_doy2010351_aid0001.tif')



Bnd5.2010001 <- as.matrix(as.data.frame(values(Bnd5.2010001)))
Bnd5.2010008 <- as.matrix(as.data.frame(values(Bnd5.2010008)))
Bnd5.2010043 <- as.data.frame(values(Bnd5.2010043))
Bnd5.2010050 <- as.data.frame(values(Bnd5.2010050))
Bnd5.2010057 <- as.data.frame(values(Bnd5.2010057))
Bnd5.2010064 <- as.data.frame(values(Bnd5.2010064))
Bnd5.2010071 <- as.data.frame(values(Bnd5.2010071))
Bnd5.2010078 <- as.data.frame(values(Bnd5.2010078))
Bnd5.2010085 <- as.data.frame(values(Bnd5.2010085))
Bnd5.2010092 <- as.data.frame(values(Bnd5.2010092))
Bnd5.2010099 <- as.data.frame(values(Bnd5.2010099))
Bnd5.2010106 <- as.data.frame(values(Bnd5.2010106))
Bnd5.2010113 <- as.data.frame(values(Bnd5.2010113))
Bnd5.2010120 <- as.data.frame(values(Bnd5.2010120))
Bnd5.2010127 <- as.data.frame(values(Bnd5.2010127))
Bnd5.2010134 <- as.data.frame(values(Bnd5.2010134))
Bnd5.2010141 <- as.data.frame(values(Bnd5.2010141))
Bnd5.2010148 <- as.data.frame(values(Bnd5.2010148))
Bnd5.2010155 <- as.data.frame(values(Bnd5.2010155))
Bnd5.2010162 <- as.data.frame(values(Bnd5.2010162))
Bnd5.2010169 <- as.data.frame(values(Bnd5.2010169))
Bnd5.2010176 <- as.data.frame(values(Bnd5.2010176))
Bnd5.2010183 <- as.data.frame(values(Bnd5.2010183))
Bnd5.2010190 <- as.data.frame(values(Bnd5.2010190))
Bnd5.2010197 <- as.data.frame(values(Bnd5.2010197))
Bnd5.2010204 <- as.data.frame(values(Bnd5.2010204))
Bnd5.2010211 <- as.data.frame(values(Bnd5.2010211))
Bnd5.2010225 <- as.data.frame(values(Bnd5.2010225))
Bnd5.2010232 <- as.data.frame(values(Bnd5.2010232))
Bnd5.2010239 <- as.data.frame(values(Bnd5.2010239))
Bnd5.2010246 <- as.data.frame(values(Bnd5.2010246))
Bnd5.2010253 <- as.data.frame(values(Bnd5.2010253))
Bnd5.2010260 <- as.data.frame(values(Bnd5.2010260))
Bnd5.2010267 <- as.data.frame(values(Bnd5.2010267))
Bnd5.2010274 <- as.data.frame(values(Bnd5.2010274))
Bnd5.2010281 <- as.data.frame(values(Bnd5.2010281))
Bnd5.2010288 <- as.data.frame(values(Bnd5.2010288))
Bnd5.2010295 <- as.data.frame(values(Bnd5.2010295))
Bnd5.2010302 <- as.data.frame(values(Bnd5.2010302))
Bnd5.2010309 <- as.data.frame(values(Bnd5.2010309))
Bnd5.2010316 <- as.data.frame(values(Bnd5.2010316))
Bnd5.2010330 <- as.data.frame(values(Bnd5.2010330))
Bnd5.2010337 <- as.data.frame(values(Bnd5.2010337))
Bnd5.2010344 <- as.data.frame(values(Bnd5.2010344))
Bnd5.2010351 <- as.data.frame(values(Bnd5.2010351))



Bnd52010 <- as.data.frame(cbind(Bnd5.2010001, Bnd5.2010008, Bnd5.2010043, Bnd5.2010050, Bnd5.2010057,
                                Bnd5.2010064, Bnd5.2010071, Bnd5.2010078, Bnd5.2010085, Bnd5.2010092,
                                Bnd5.2010099, Bnd5.2010106, Bnd5.2010113, Bnd5.2010120, Bnd5.2010127,
                                Bnd5.2010134, Bnd5.2010141, Bnd5.2010148, Bnd5.2010155, Bnd5.2010162, 
                                Bnd5.2010169, Bnd5.2010176, Bnd5.2010183, Bnd5.2010190, Bnd5.2010197,
                                Bnd5.2010204, Bnd5.2010211, Bnd5.2010225, Bnd5.2010232, Bnd5.2010239,
                                Bnd5.2010246, Bnd5.2010253, Bnd5.2010260, Bnd5.2010267, Bnd5.2010274,
                                Bnd5.2010281, Bnd5.2010288, Bnd5.2010295, Bnd5.2010302, Bnd5.2010309,
                                Bnd5.2010316, Bnd5.2010330, Bnd5.2010337, Bnd5.2010344, Bnd5.2010351))


Bnd5sd2010 <- apply(Bnd52010, 2, sd)
Bnd5mn2010 <- apply(Bnd52010, 2, mean)
Bnd5mdn2010 <- apply(Bnd52010, 2, median)
Bnd5min2010 <- apply(Bnd52010, 2, min)
Bnd5max2010 <- apply(Bnd52010, 2, max)

Bnd5sts2010 <- as.data.frame(cbind(Bnd5mn2010, Bnd5mdn2010, Bnd5sd2010, Bnd5max2010, Bnd5min2010))
colnames(Bnd5sts2010) <- c('Mean', 'Median', 'StdDev', 'Max', 'Min')
write.csv(Bnd5sts2010, 'Bnd5CA_YR_2010_STATS.csv')

Bnd5sts2010 <- cbind(Date, DOY, Bnd5sts2010)

Bnd5mnp2010 <- as.data.frame(Bnd5mn2010)
Bnd5mnp2010$Stat <- "Mean"
Bnd5mnp2010 <- cbind(Date, DOY, Bnd5mnp2010)
colnames(Bnd5mnp2010)[3] <- "Values"
Bnd5minp2010 <- as.data.frame(Bnd5min2010)
Bnd5minp2010$Stat <- "Min"
Bnd5minp2010 <- cbind(Date, DOY, Bnd5minp2010)
colnames(Bnd5minp2010)[3] <- "Values"
Bnd5maxp2010 <- as.data.frame(Bnd5max2010)
Bnd5maxp2010$Stat <- "Max"
Bnd5maxp2010 <- cbind(Date, DOY, Bnd5maxp2010)
colnames(Bnd5maxp2010)[3] <- "Values"
Bnd5stsp2010 <- rbind(Bnd5mnp2010, Bnd5minp2010, Bnd5maxp2010)
Bnd5stsp2010$Stat <- as.factor(Bnd5stsp2010$Stat)
#Bnd5stsp2010$DOY <- as.factor(Bnd5stsp2010$DOY)
Bnd5stxl2010 <- filter(Bnd5stsp2010, Values != 'NA')
#write.csv(Bnd5stsp2010, 'Bnd5stsp2010.csv')
write.csv(Bnd5stxl2010, 'Bnd5stxl2010.csv')


