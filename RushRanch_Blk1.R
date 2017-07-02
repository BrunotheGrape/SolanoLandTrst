library(tiff); library(raster); library(rgdal); library(sp) 
library(ggplot2); library(rasterVis); library(date)

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
ndvi052616 <- setMinMax(ndvi052616)
ndvi062316 <- setMinMax(ndvi062316)
ndvi062916 <- setMinMax(ndvi062916)
ndvi072716 <- setMinMax(ndvi072716)
ndvi081716 <- setMinMax(ndvi081716)
ndvi082416 <- setMinMax(ndvi082416)

ndvi050316av <- cellStats(ndvi050316, mean)
ndvi050316md <- cellStats(ndvi050316, median)
ndvi050316mx <- cellStats(ndvi050316, max)
ndvi050316mn <- cellStats(ndvi050316, min)

ndvi052616av <- cellStats(ndvi052616, mean)
ndvi052616md <- cellStats(ndvi052616, median)
ndvi052616mx <- cellStats(ndvi052616, max)
ndvi052616mn <- cellStats(ndvi052616, min)

ndvi062316av <- cellStats(ndvi062316, mean)
ndvi062316md <- cellStats(ndvi062316, median)
ndvi062316mx <- cellStats(ndvi062316, max)
ndvi062316mn <- cellStats(ndvi062316, min)

ndvi062916av <- cellStats(ndvi062916, mean)
ndvi062916md <- cellStats(ndvi062916, median)
ndvi062916mx <- cellStats(ndvi062916, max)
ndvi062916mn <- cellStats(ndvi062916, min)

ndvi072716av <- cellStats(ndvi072716, mean)
ndvi072716md <- cellStats(ndvi072716, median)
ndvi072716mx <- cellStats(ndvi072716, max)
ndvi072716mn <- cellStats(ndvi072716, min)

ndvi081716av <- cellStats(ndvi081716, mean)
ndvi081716md <- cellStats(ndvi081716, median)
ndvi081716mx <- cellStats(ndvi081716, max)
ndvi081716mn <- cellStats(ndvi081716, min)

ndvi082416av <- cellStats(ndvi082416, mean)
ndvi082416md <- cellStats(ndvi082416, median)
ndvi082416mx <- cellStats(ndvi082416, max)
ndvi082416mn <- cellStats(ndvi082416, min)

ndviav <- data.frame(Average = c(ndvi050316av, ndvi052616av, ndvi062316av, ndvi062916av,
                                 ndvi072716av, ndvi081716av, ndvi082416av))

ndvimd <- data.frame(Median = c(ndvi050316md, ndvi052616md, ndvi062316md, ndvi062916md,
                                 ndvi072716md, ndvi081716md, ndvi082416md))

ndvimx <- data.frame(Maximum = c(ndvi050316mx, ndvi052616mx, ndvi062316mx, ndvi062916mx,
                                 ndvi072716mx, ndvi081716mx, ndvi082416mx))

ndvimn <- data.frame(Minimum = c(ndvi050316mn, ndvi052616mn, ndvi062316mn, ndvi062916mn,
                                 ndvi072716mn, ndvi081716mn, ndvi082416mn))

rrbldf <- cbind(dt, ndviav)
rrbldf <- cbind(rrbldf, ndvimd)
rrbldf <- cbind(rrbldf, ndvimx)
rrbldf <- cbind(rrbldf, ndvimn)
