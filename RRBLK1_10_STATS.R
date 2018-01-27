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


Bnd2.2010001 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/77d9bef2-0fab-4932-acee-fd2cf97db941/WELDUSWK.001_Band2_TOA_REF_doy2010001_aid0001.tif')
Bnd2.2010008 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/59197108-e1fd-48f5-8a62-c75819d95c02/WELDUSWK.001_Band2_TOA_REF_doy2010008_aid0001.tif')
Bnd2.2010043 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/afd3acbb-e549-409d-9282-09ece862d176/WELDUSWK.001_Band2_TOA_REF_doy2010043_aid0001.tif')
Bnd2.2010050 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/61c81b0f-19dc-466e-8dd9-31842cc79cad/WELDUSWK.001_Band2_TOA_REF_doy2010050_aid0001.tif')
Bnd2.2010057 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/437df70a-9aaf-4e61-903f-5be562a263c2/WELDUSWK.001_Band2_TOA_REF_doy2010057_aid0001.tif')
Bnd2.2010064 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/bd293d5d-b16a-46c4-b8b8-a0b5637759bd/WELDUSWK.001_Band2_TOA_REF_doy2010064_aid0001.tif')
Bnd2.2010071 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/14c0e739-8bcd-45e3-887c-3a5366ab4eac/WELDUSWK.001_Band2_TOA_REF_doy2010071_aid0001.tif')
Bnd2.2010078 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/18d4a2a4-3213-4cf4-ad15-a0f6a27cb0b3/WELDUSWK.001_Band2_TOA_REF_doy2010078_aid0001.tif')
Bnd2.2010085 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/91968ff6-90f1-462d-b44e-697bc21e3796/WELDUSWK.001_Band2_TOA_REF_doy2010085_aid0001.tif')
Bnd2.2010092 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/6304c006-ca67-4fdb-9925-76e42b8125dc/WELDUSWK.001_Band2_TOA_REF_doy2010092_aid0001.tif')
Bnd2.2010099 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/b0aefb0b-5b8a-4064-a5c6-8dd1ebd2056e/WELDUSWK.001_Band2_TOA_REF_doy2010099_aid0001.tif')
Bnd2.2010106 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/0c34bb46-66eb-4833-bd75-4c3bd18b80da/WELDUSWK.001_Band2_TOA_REF_doy2010106_aid0001.tif')
Bnd2.2010113 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/eadea486-4797-46c7-b265-bc69a012b9c1/WELDUSWK.001_Band2_TOA_REF_doy2010113_aid0001.tif')
Bnd2.2010120 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/c0e54b67-3be0-4f14-bbba-a45ea82463b3/WELDUSWK.001_Band2_TOA_REF_doy2010120_aid0001.tif')
Bnd2.2010127 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/479fd440-2336-4e56-be2c-7f595803f051/WELDUSWK.001_Band2_TOA_REF_doy2010127_aid0001.tif')
Bnd2.2010134 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/993a51a7-3b97-49cb-b80d-34dbd7ebe0db/WELDUSWK.001_Band2_TOA_REF_doy2010134_aid0001.tif')
Bnd2.2010141 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/fa28e34e-dc15-4769-97ed-7d58263f22bf/WELDUSWK.001_Band2_TOA_REF_doy2010141_aid0001.tif')
Bnd2.2010148 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/d6bf97de-ad16-4ca8-be0e-490e58224184/WELDUSWK.001_Band2_TOA_REF_doy2010148_aid0001.tif')
Bnd2.2010155 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/9bd80005-9714-4a82-aac5-089f787ed1d0/WELDUSWK.001_Band2_TOA_REF_doy2010155_aid0001.tif')
Bnd2.2010162 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/7902d38f-e839-4963-8b79-81bbabf0c0ad/WELDUSWK.001_Band2_TOA_REF_doy2010162_aid0001.tif')
Bnd2.2010169 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/d69faff0-1209-4024-92e7-f38a42eeafe7/WELDUSWK.001_Band2_TOA_REF_doy2010169_aid0001.tif')
Bnd2.2010176 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/20a2324a-fd0e-4213-97aa-e95c1104a4eb/WELDUSWK.001_Band2_TOA_REF_doy2010176_aid0001.tif')
Bnd2.2010183 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/2ccfa53b-a3cd-408a-b5e3-e7fadef78496/WELDUSWK.001_Band2_TOA_REF_doy2010183_aid0001.tif')
Bnd2.2010190 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/9657ed06-cea4-4b98-869e-feacf5e31b90/WELDUSWK.001_Band2_TOA_REF_doy2010190_aid0001.tif')
Bnd2.2010197 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/454bfc63-9a76-425f-a2ed-c21b1db69e52/WELDUSWK.001_Band2_TOA_REF_doy2010197_aid0001.tif')
Bnd2.2010204 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/4a338fdb-242d-4ad9-94d7-d0e91a58e7b9/WELDUSWK.001_Band2_TOA_REF_doy2010204_aid0001.tif')
Bnd2.2010211 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/38788120-4845-4323-a5da-7f8f1d471022/WELDUSWK.001_Band2_TOA_REF_doy2010211_aid0001.tif')
Bnd2.2010225 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/e0859cdf-ad81-4177-88ce-d9eae4ab0f0a/WELDUSWK.001_Band2_TOA_REF_doy2010225_aid0001.tif')
Bnd2.2010232 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/d1fcd0bf-7a62-4d00-a128-cf9169dc8157/WELDUSWK.001_Band2_TOA_REF_doy2010232_aid0001.tif')
Bnd2.2010239 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/50ffd8e7-8b86-4758-a675-6f670aae5708/WELDUSWK.001_Band2_TOA_REF_doy2010239_aid0001.tif')
Bnd2.2010246 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/e1867c06-bf74-46e6-9c7c-fee1fbc51c58/WELDUSWK.001_Band2_TOA_REF_doy2010246_aid0001.tif')
Bnd2.2010253 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/56c5e0c7-2dcb-4bc7-ae4f-1187f764638a/WELDUSWK.001_Band2_TOA_REF_doy2010253_aid0001.tif')
Bnd2.2010260 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/0ac59368-3688-4265-9645-e7c8c5b42755/WELDUSWK.001_Band2_TOA_REF_doy2010260_aid0001.tif')
Bnd2.2010267 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/1a0a2d02-6581-4ac6-b96b-890d78846e98/WELDUSWK.001_Band2_TOA_REF_doy2010267_aid0001.tif')
Bnd2.2010274 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/6444cb20-4010-413d-922e-6a924f83ffb1/WELDUSWK.001_Band2_TOA_REF_doy2010274_aid0001.tif')
Bnd2.2010281 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/6d9bb6cb-0aa3-4531-9a5e-d67e0d7d3458/WELDUSWK.001_Band2_TOA_REF_doy2010281_aid0001.tif')
Bnd2.2010288 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/b3917bb7-3d54-4ec8-a07c-ea315d5ad522/WELDUSWK.001_Band2_TOA_REF_doy2010288_aid0001.tif')
Bnd2.2010295 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/532721d4-3b49-48da-8a40-dd4cec5e9e99/WELDUSWK.001_Band2_TOA_REF_doy2010295_aid0001.tif')
Bnd2.2010302 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/081705bf-2e3e-46ce-8140-d9d10a02b833/WELDUSWK.001_Band2_TOA_REF_doy2010302_aid0001.tif')
Bnd2.2010309 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/f600f71d-c945-4d9b-bf70-163593d39558/WELDUSWK.001_Band2_TOA_REF_doy2010309_aid0001.tif')
Bnd2.2010316 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/63ed619e-b6cf-4a2f-a317-d0763d63654c/WELDUSWK.001_Band2_TOA_REF_doy2010316_aid0001.tif')
Bnd2.2010330 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/02c4ea5c-4c99-45f2-95c0-858b3ed0efc8/WELDUSWK.001_Band2_TOA_REF_doy2010330_aid0001.tif')
Bnd2.2010337 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/99af7a98-8c06-4883-a6a7-3f1b0ff31519/WELDUSWK.001_Band2_TOA_REF_doy2010337_aid0001.tif')
Bnd2.2010344 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/a864d397-80c6-445c-bd93-78976d99d592/WELDUSWK.001_Band2_TOA_REF_doy2010344_aid0001.tif')
Bnd2.2010351 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/3b9c6689-4570-4afe-b8bf-38388d0942d3/WELDUSWK.001_Band2_TOA_REF_doy2010351_aid0001.tif')

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



Bnd3.2010001 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/a7cfb53f-0d40-498d-96cf-60f1cd37411e/WELDUSWK.001_Band3_TOA_REF_doy2010001_aid0001.tif')
Bnd3.2010008 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/0167d712-fbcc-43ea-a767-42914d506edc/WELDUSWK.001_Band3_TOA_REF_doy2010008_aid0001.tif')
Bnd3.2010043 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/fc045566-2d74-4712-90b6-cecd775fe515/WELDUSWK.001_Band3_TOA_REF_doy2010043_aid0001.tif')
Bnd3.2010050 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/a42739c4-c146-47e5-94ad-5fef97a2d28a/WELDUSWK.001_Band3_TOA_REF_doy2010050_aid0001.tif')
Bnd3.2010057 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/64408373-9b0c-4dea-9962-8b5374f15333/WELDUSWK.001_Band3_TOA_REF_doy2010057_aid0001.tif')
Bnd3.2010064 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/a25137d2-f83e-4276-8599-73d7ff7c5888/WELDUSWK.001_Band3_TOA_REF_doy2010064_aid0001.tif')
Bnd3.2010071 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/3ee32262-9c65-4cd0-876b-97294ea14cb3/WELDUSWK.001_Band3_TOA_REF_doy2010071_aid0001.tif')
Bnd3.2010078 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/5e00c7f3-ad44-4885-b617-6016dec4e09a/WELDUSWK.001_Band3_TOA_REF_doy2010078_aid0001.tif')
Bnd3.2010085 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/e822fe8b-b9a0-4588-8d72-fe7e66be4edf/WELDUSWK.001_Band3_TOA_REF_doy2010085_aid0001.tif')
Bnd3.2010092 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/181c240f-a01b-4314-ab61-b5e26ea0a7d4/WELDUSWK.001_Band3_TOA_REF_doy2010092_aid0001.tif')
Bnd3.2010099 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/45bc4549-0284-4ca5-aabc-0e0e478a1070/WELDUSWK.001_Band3_TOA_REF_doy2010099_aid0001.tif')
Bnd3.2010106 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/6da0adfe-ae14-4094-b84c-4ba76da167c2/WELDUSWK.001_Band3_TOA_REF_doy2010106_aid0001.tif')
Bnd3.2010113 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/99742baf-1834-4a5e-863b-06fdec64e41b/WELDUSWK.001_Band3_TOA_REF_doy2010113_aid0001.tif')
Bnd3.2010120 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/faaba36c-0209-455a-abba-12e182f33f36/WELDUSWK.001_Band3_TOA_REF_doy2010120_aid0001.tif')
Bnd3.2010127 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/12cb6dce-a8b2-4562-877b-1dfe3cd4a2d7/WELDUSWK.001_Band3_TOA_REF_doy2010127_aid0001.tif')
Bnd3.2010134 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/d9535290-05eb-456d-ad2d-fc86418caf60/WELDUSWK.001_Band3_TOA_REF_doy2010134_aid0001.tif')
Bnd3.2010141 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/49690671-dd65-4886-a44b-21b6740c31b8/WELDUSWK.001_Band3_TOA_REF_doy2010141_aid0001.tif')
Bnd3.2010148 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/8cf8c1d6-de75-446f-9c40-de833b0ac600/WELDUSWK.001_Band3_TOA_REF_doy2010148_aid0001.tif')
Bnd3.2010155 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/13c147f8-a433-4bcf-b1af-43d1ebb5d311/WELDUSWK.001_Band3_TOA_REF_doy2010155_aid0001.tif')
Bnd3.2010162 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/6e5876e7-502f-4e61-8684-b8abbe9f9214/WELDUSWK.001_Band3_TOA_REF_doy2010162_aid0001.tif')
Bnd3.2010169 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/6bd6f4bd-2e24-4b53-89d3-dba87d7ef6e7/WELDUSWK.001_Band3_TOA_REF_doy2010169_aid0001.tif')
Bnd3.2010176 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/a310a7bf-6b60-4c93-835c-dc72d3eeca72/WELDUSWK.001_Band3_TOA_REF_doy2010176_aid0001.tif')
Bnd3.2010183 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/7fc6ad51-c607-420b-9513-aca1fd57d7b3/WELDUSWK.001_Band3_TOA_REF_doy2010183_aid0001.tif')
Bnd3.2010190 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/9502fb09-ea13-42d9-99ef-d1f527062bd6/WELDUSWK.001_Band3_TOA_REF_doy2010190_aid0001.tif')
Bnd3.2010197 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/0ea284c2-02ab-422a-93bf-5e5c0c988708/WELDUSWK.001_Band3_TOA_REF_doy2010197_aid0001.tif')
Bnd3.2010204 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/3e47e96b-e9ff-4a96-ace4-ae4281798905/WELDUSWK.001_Band3_TOA_REF_doy2010204_aid0001.tif')
Bnd3.2010211 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/b70396a2-cdef-4262-a704-ea18c3b8e163/WELDUSWK.001_Band3_TOA_REF_doy2010211_aid0001.tif')
Bnd3.2010225 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/2c88b9ff-8c07-48b0-ad18-2b5bce3745dc/WELDUSWK.001_Band3_TOA_REF_doy2010225_aid0001.tif')
Bnd3.2010232 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/c880de6c-4388-45ab-b751-41d39c15ec1a/WELDUSWK.001_Band3_TOA_REF_doy2010232_aid0001.tif')
Bnd3.2010239 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/ab81b8b7-1c28-4173-b48e-d015417a8605/WELDUSWK.001_Band3_TOA_REF_doy2010239_aid0001.tif')
Bnd3.2010246 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/f20682b5-96b5-437a-9ed4-7cc9fe064e89/WELDUSWK.001_Band3_TOA_REF_doy2010246_aid0001.tif')
Bnd3.2010253 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/b8bd243c-f42b-47f8-9ddd-fd15ff04c2ec/WELDUSWK.001_Band3_TOA_REF_doy2010253_aid0001.tif')
Bnd3.2010260 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/c0e94e00-c1f5-43dd-b3da-deed9bbf7b06/WELDUSWK.001_Band3_TOA_REF_doy2010260_aid0001.tif')
Bnd3.2010267 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/1cb52e43-81f8-4661-8455-fadc7a0a1193/WELDUSWK.001_Band3_TOA_REF_doy2010267_aid0001.tif')
Bnd3.2010274 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/53c04c21-ac87-4643-aa4b-6db8c2efc542/WELDUSWK.001_Band3_TOA_REF_doy2010274_aid0001.tif')
Bnd3.2010281 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/a7767b98-761e-4601-bf87-62f3c75cfae9/WELDUSWK.001_Band3_TOA_REF_doy2010281_aid0001.tif')
Bnd3.2010288 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/f586ed0d-927d-4af2-b3a8-b9ac3f0c08ef/WELDUSWK.001_Band3_TOA_REF_doy2010288_aid0001.tif')
Bnd3.2010295 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/32ec0a6f-39a1-4a58-9715-c47473dc4f65/WELDUSWK.001_Band3_TOA_REF_doy2010295_aid0001.tif')
Bnd3.2010302 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/5a5195a7-12d6-445d-90cc-7ef737f8fdd3/WELDUSWK.001_Band3_TOA_REF_doy2010302_aid0001.tif')
Bnd3.2010309 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/c0af7998-0219-4bb3-b0ac-a5c8a86951e6/WELDUSWK.001_Band3_TOA_REF_doy2010309_aid0001.tif')
Bnd3.2010316 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/5bfd4cc1-fb9e-4ba0-904b-9b28714beda2/WELDUSWK.001_Band3_TOA_REF_doy2010316_aid0001.tif')
Bnd3.2010330 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/43df07e3-1dc1-4ab9-905b-32c9061c8002/WELDUSWK.001_Band3_TOA_REF_doy2010330_aid0001.tif')
Bnd3.2010337 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/e93c25c1-edea-45ff-9d9b-4fee15e2b436/WELDUSWK.001_Band3_TOA_REF_doy2010337_aid0001.tif')
Bnd3.2010344 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/68274694-ddb2-45ab-a0ed-7234a125e7fb/WELDUSWK.001_Band3_TOA_REF_doy2010344_aid0001.tif')
Bnd3.2010351 <- raster('https://lpdaacsvc.cr.usgs.gov/appeears/api/bundle/54c9e60d-be3e-4008-92c9-5a14f8cc270f/3e7fa2c7-ae2e-4610-8cc1-1ac7c8b27b84/WELDUSWK.001_Band3_TOA_REF_doy2010351_aid0001.tif')


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


