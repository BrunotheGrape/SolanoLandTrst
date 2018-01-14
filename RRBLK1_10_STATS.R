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


ACCA2010001 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/749fe047-0877-40ef-b745-25cfea63dfff/WELDUSWK.001_ACCA_State_doy2010001_aid0001.tif')
ACCA2010008 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/e18e554f-7f12-40b3-bd6f-f4141b59db29/WELDUSWK.001_ACCA_State_doy2010008_aid0001.tif')
ACCA2010043 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/a2e22d62-fd8c-4927-bfc0-6bd23cfaccf0/WELDUSWK.001_ACCA_State_doy2010043_aid0001.tif')
ACCA2010050 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/b7a47779-adeb-404b-98ef-de938d8336e5/WELDUSWK.001_ACCA_State_doy2010050_aid0001.tif')
ACCA2010057 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/c6b48476-a695-475a-8393-c5577acc15f4/WELDUSWK.001_ACCA_State_doy2010057_aid0001.tif')
ACCA2010064 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/73c23a68-b215-4b55-a794-46a12f43440d/WELDUSWK.001_ACCA_State_doy2010064_aid0001.tif')
ACCA2010071 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/8fdedbad-5121-426a-8b9a-72938449f138/WELDUSWK.001_ACCA_State_doy2010071_aid0001.tif')
ACCA2010078 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/6c9a3c7c-4373-48df-973a-dc5bde70b2e2/WELDUSWK.001_ACCA_State_doy2010078_aid0001.tif')
ACCA2010085 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/a44f647d-5840-4ccf-b833-24e89b9a3cc8/WELDUSWK.001_ACCA_State_doy2010085_aid0001.tif')
ACCA2010092 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/edeef152-7bbe-4f5f-a5bb-9d7fe6d18327/WELDUSWK.001_ACCA_State_doy2010092_aid0001.tif')
ACCA2010099 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/1063a468-37be-435f-b0a8-2ad9647e707a/WELDUSWK.001_ACCA_State_doy2010099_aid0001.tif')
ACCA2010106 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/9ad64247-6ede-4775-862b-6017b5fe7405/WELDUSWK.001_ACCA_State_doy2010106_aid0001.tif')
ACCA2010113 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/3377aad9-fc45-4493-86fd-e8071711a729/WELDUSWK.001_ACCA_State_doy2010113_aid0001.tif')
ACCA2010120 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/0606a774-3a12-4ec3-8947-26307ecd2262/WELDUSWK.001_ACCA_State_doy2010120_aid0001.tif')
ACCA2010127 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/872c6eb6-ba75-4127-bcec-51fa5cb4e0a7/WELDUSWK.001_ACCA_State_doy2010127_aid0001.tif')
ACCA2010134 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/38fcb9c5-e5e1-4a51-8ac7-9e339dd69287/WELDUSWK.001_ACCA_State_doy2010134_aid0001.tif')
ACCA2010141 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/e3c96963-18b6-48aa-8534-37c42288d6bf/WELDUSWK.001_ACCA_State_doy2010141_aid0001.tif')
ACCA2010148 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/da457961-e207-4b78-af16-8c5be1a9e54f/WELDUSWK.001_ACCA_State_doy2010148_aid0001.tif')
ACCA2010155 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/d103903c-de7c-45da-a9d7-0f45a22e3478/WELDUSWK.001_ACCA_State_doy2010155_aid0001.tif')
ACCA2010162 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/4193f40d-da7d-4070-b05b-3e646006e0b6/WELDUSWK.001_ACCA_State_doy2010162_aid0001.tif')
ACCA2010169 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/c518dc0b-af60-4642-8b4c-59a396ae67ad/WELDUSWK.001_ACCA_State_doy2010169_aid0001.tif')
ACCA2010176 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/b19492f8-bbec-4cf5-8a0f-2138fb977dbf/WELDUSWK.001_ACCA_State_doy2010176_aid0001.tif')
ACCA2010183 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/a954a6bf-94d8-47cb-888c-bdd659bcb57c/WELDUSWK.001_ACCA_State_doy2010183_aid0001.tif')
ACCA2010190 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/992d6c4d-0d6f-4fef-8659-bbe01c4a7a43/WELDUSWK.001_ACCA_State_doy2010190_aid0001.tif')
ACCA2010197 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/477d3200-cf42-49d9-aa86-56de906da06f/WELDUSWK.001_ACCA_State_doy2010197_aid0001.tif')
ACCA2010204 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/8a22f283-1bc1-470c-9a2e-a2a008f93ce1/WELDUSWK.001_ACCA_State_doy2010204_aid0001.tif')
ACCA2010211 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/a25e5295-7a12-4c0b-97da-aa93379d723e/WELDUSWK.001_ACCA_State_doy2010211_aid0001.tif')
ACCA2010225 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/dc89d29a-00f0-41f2-a137-448eafd36b1d/WELDUSWK.001_ACCA_State_doy2010225_aid0001.tif')
ACCA2010232 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/c7de02fe-b0c2-46a8-9485-5e00dc14eed4/WELDUSWK.001_ACCA_State_doy2010232_aid0001.tif')
ACCA2010239 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/12b74d03-3e5b-4b97-b419-896d332feca7/WELDUSWK.001_ACCA_State_doy2010239_aid0001.tif')
ACCA2010246 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/2fcfb886-3be0-4a30-9364-05539d2ec84f/WELDUSWK.001_ACCA_State_doy2010246_aid0001.tif')
ACCA2010253 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/8d6e0b0f-6a3d-4ff2-a655-643ca5625b19/WELDUSWK.001_ACCA_State_doy2010253_aid0001.tif')
ACCA2010260 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/2f60b185-6452-45c3-bf89-672e3302f559/WELDUSWK.001_ACCA_State_doy2010260_aid0001.tif')
ACCA2010267 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/e440b096-dba3-4d65-bcd7-ee0d32556c89/WELDUSWK.001_ACCA_State_doy2010267_aid0001.tif')
ACCA2010274 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/47f3321f-728f-4cd6-b48c-50c5e0dfba82/WELDUSWK.001_ACCA_State_doy2010274_aid0001.tif')
ACCA2010281 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/50142b06-4f5d-4e74-82f5-15e02634ba01/WELDUSWK.001_ACCA_State_doy2010281_aid0001.tif')
ACCA2010288 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/a020c9fc-1495-4f2b-80f1-6225c0e6ef4d/WELDUSWK.001_ACCA_State_doy2010288_aid0001.tif')
ACCA2010295 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/2b431ba9-dfef-470b-9adc-b8bdb0edc60b/WELDUSWK.001_ACCA_State_doy2010295_aid0001.tif')
ACCA2010302 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/84c7cf77-fd1c-4d4b-b828-e993342bb9d2/WELDUSWK.001_ACCA_State_doy2010302_aid0001.tif')
ACCA2010309 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/58226133-3d03-4961-b1c8-deaceb306648/WELDUSWK.001_ACCA_State_doy2010309_aid0001.tif')
ACCA2010316 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/db8739bf-ea13-4893-af98-71e36ac29611/WELDUSWK.001_ACCA_State_doy2010316_aid0001.tif')
ACCA2010330 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/2b11ee28-ac87-4871-9472-ad635ef74cae/WELDUSWK.001_ACCA_State_doy2010330_aid0001.tif')
ACCA2010337 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/cc5ba6fb-1145-4901-bd8e-a52bbe3e4e39/WELDUSWK.001_ACCA_State_doy2010337_aid0001.tif')
ACCA2010344 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/f2b6c725-8e9a-4bfd-8d31-d31330dd24af/WELDUSWK.001_ACCA_State_doy2010344_aid0001.tif')
ACCA2010351 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/bfe445cd-f5c0-43a2-be4e-bbdb1c369284/WELDUSWK.001_ACCA_State_doy2010351_aid0001.tif')



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


Bnd1.2010001 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/dc612af7-73ef-4193-908d-b60b7bdd176f/WELDUSWK.001_Band1_TOA_REF_doy2010001_aid0001.tif')
Bnd1.2010008 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/171512ac-2c57-4349-aac6-9aa2b291c7d6/WELDUSWK.001_Band1_TOA_REF_doy2010008_aid0001.tif')
Bnd1.2010043 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/c90d5960-5c59-450c-9021-36a8c3dbc12b/WELDUSWK.001_Band1_TOA_REF_doy2010043_aid0001.tif')
Bnd1.2010050 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/159a9cd2-973c-4593-969d-b07f08dd024b/WELDUSWK.001_Band1_TOA_REF_doy2010050_aid0001.tif')
Bnd1.2010057 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/6632c884-a360-41f2-96a2-7403ca6954f9/WELDUSWK.001_Band1_TOA_REF_doy2010057_aid0001.tif')
Bnd1.2010064 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/4f084100-f21e-4979-9a06-3e649b40819d/WELDUSWK.001_Band1_TOA_REF_doy2010064_aid0001.tif')
Bnd1.2010071 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/8da2c7ae-a4e7-4caf-b19e-79cf25e02754/WELDUSWK.001_Band1_TOA_REF_doy2010071_aid0001.tif')
Bnd1.2010078 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/6cb63a38-51e1-4e63-aee9-6c446a988f48/WELDUSWK.001_Band1_TOA_REF_doy2010078_aid0001.tif')
Bnd1.2010085 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/d8f721be-f873-40d2-a30b-7e4e59f9d2e1/WELDUSWK.001_Band1_TOA_REF_doy2010085_aid0001.tif')
Bnd1.2010092 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/02535f60-4b7d-476a-bf39-ec62e8132238/WELDUSWK.001_Band1_TOA_REF_doy2010092_aid0001.tif')
Bnd1.2010099 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/bfc615ef-2d34-468d-b416-d8593a95c0c3/WELDUSWK.001_Band1_TOA_REF_doy2010099_aid0001.tif')
Bnd1.2010106 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/c35f4f13-c189-4bb6-8538-2bed88265d92/WELDUSWK.001_Band1_TOA_REF_doy2010106_aid0001.tif')
Bnd1.2010113 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/a6451ceb-d479-468a-9b4d-23b0410a31cc/WELDUSWK.001_Band1_TOA_REF_doy2010113_aid0001.tif')
Bnd1.2010120 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/c3192f12-2e4d-40f2-a573-6156f9aea402/WELDUSWK.001_Band1_TOA_REF_doy2010120_aid0001.tif')
Bnd1.2010127 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/8539fec1-f4a7-400e-bf3c-4cab98bdd6c3/WELDUSWK.001_Band1_TOA_REF_doy2010127_aid0001.tif')
Bnd1.2010134 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/8ea05899-338e-44c0-8116-159955f55e32/WELDUSWK.001_Band1_TOA_REF_doy2010134_aid0001.tif')
Bnd1.2010141 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/85e729cb-f6b4-4955-9cd3-8c02e53afb5d/WELDUSWK.001_Band1_TOA_REF_doy2010141_aid0001.tif')
Bnd1.2010148 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/47fcc70a-3008-445d-a013-ecac45543d4d/WELDUSWK.001_Band1_TOA_REF_doy2010148_aid0001.tif')
Bnd1.2010155 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/eb5497e9-6d6c-435e-9871-052dd4356366/WELDUSWK.001_Band1_TOA_REF_doy2010155_aid0001.tif')
Bnd1.2010162 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/d43be68f-838f-4785-80b8-c9d8a2338318/WELDUSWK.001_Band1_TOA_REF_doy2010162_aid0001.tif')
Bnd1.2010169 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/2585959d-38b8-4c8b-99d4-233395d8a162/WELDUSWK.001_Band1_TOA_REF_doy2010169_aid0001.tif')
Bnd1.2010176 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/9e31c6c5-d051-42b8-b8c4-31490f256bf8/WELDUSWK.001_Band1_TOA_REF_doy2010176_aid0001.tif')
Bnd1.2010183 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/934384bf-5e7b-4f6e-9657-f902a0a68494/WELDUSWK.001_Band1_TOA_REF_doy2010183_aid0001.tif')
Bnd1.2010190 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/a77a2895-8d18-492c-8250-3b5e735dc096/WELDUSWK.001_Band1_TOA_REF_doy2010190_aid0001.tif')
Bnd1.2010197 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/7e6882e9-a166-4bc4-8ffd-c6958f6d29d0/WELDUSWK.001_Band1_TOA_REF_doy2010197_aid0001.tif')
Bnd1.2010204 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/ac893596-283f-4d88-a15f-18f2ce053453/WELDUSWK.001_Band1_TOA_REF_doy2010204_aid0001.tif')
Bnd1.2010211 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/793c8814-d133-47f5-ac76-cec306ff1319/WELDUSWK.001_Band1_TOA_REF_doy2010211_aid0001.tif')
Bnd1.2010225 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/9653b8fc-fa13-47e9-8a04-e2ae11510915/WELDUSWK.001_Band1_TOA_REF_doy2010225_aid0001.tif')
Bnd1.2010232 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/05886bd4-3b62-4277-9cd5-3cf3393a0167/WELDUSWK.001_Band1_TOA_REF_doy2010232_aid0001.tif')
Bnd1.2010239 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/bed7e20e-4e90-403c-84af-ff11b3a18b89/WELDUSWK.001_Band1_TOA_REF_doy2010239_aid0001.tif')
Bnd1.2010246 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/4b6924e8-e929-4a01-b160-d3e4ab10446b/WELDUSWK.001_Band1_TOA_REF_doy2010246_aid0001.tif')
Bnd1.2010253 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/0e88f3b6-e755-497c-b63c-9bbf426a5a7f/WELDUSWK.001_Band1_TOA_REF_doy2010253_aid0001.tif')
Bnd1.2010260 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/6ba5b17c-4321-4c72-b23c-dc89d9dbeffd/WELDUSWK.001_Band1_TOA_REF_doy2010260_aid0001.tif')
Bnd1.2010267 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/dbe73669-9b51-4d11-aac6-8f0649385865/WELDUSWK.001_Band1_TOA_REF_doy2010267_aid0001.tif')
Bnd1.2010274 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/e8b5240d-b8b6-4c9e-a876-5ed7f13d7af1/WELDUSWK.001_Band1_TOA_REF_doy2010274_aid0001.tif')
Bnd1.2010281 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/95ee3657-d5b7-4fb1-9019-3a3d775216f1/WELDUSWK.001_Band1_TOA_REF_doy2010281_aid0001.tif')
Bnd1.2010288 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/9bbc96de-58cc-47c1-9a1a-93b80303035e/WELDUSWK.001_Band1_TOA_REF_doy2010288_aid0001.tif')
Bnd1.2010295 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/35009444-d487-4993-af17-c76bcab25d20/WELDUSWK.001_Band1_TOA_REF_doy2010295_aid0001.tif')
Bnd1.2010302 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/00a1ad05-ecdc-4da8-80a3-15d62895e109/WELDUSWK.001_Band1_TOA_REF_doy2010302_aid0001.tif')
Bnd1.2010309 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/e3fdb91d-8fb5-4551-a20a-c6f93b7c5011/WELDUSWK.001_Band1_TOA_REF_doy2010309_aid0001.tif')
Bnd1.2010316 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/97946f62-e49c-448d-bf4d-4c2afda3a631/WELDUSWK.001_Band1_TOA_REF_doy2010316_aid0001.tif')
Bnd1.2010330 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/0a603fd9-804f-436d-b7ad-b24460049ad9/WELDUSWK.001_Band1_TOA_REF_doy2010330_aid0001.tif')
Bnd1.2010337 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/42d9fd7b-3316-4f33-af55-aafd0446307d/WELDUSWK.001_Band1_TOA_REF_doy2010337_aid0001.tif')
Bnd1.2010344 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/7ea637d1-abaf-48bc-9410-32ad748cc0d5/WELDUSWK.001_Band1_TOA_REF_doy2010344_aid0001.tif')
Bnd1.2010351 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/118eaefb-dc25-4126-bcab-25d6183987d2/WELDUSWK.001_Band1_TOA_REF_doy2010351_aid0001.tif')











