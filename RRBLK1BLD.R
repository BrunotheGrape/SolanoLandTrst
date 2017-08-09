library(tiff); library(raster); library(rgdal); library(sp) 
library(ggplot2); library(rasterVis); library(date)
library(caret); library(dplyr); library(vioplot); library(RColorBrewer)


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
#ndvi050316@extent
ndvi052616 <- setMinMax(ndvi052616)
#ndvi052616@extent
ndvi062316 <- setMinMax(ndvi062316)
#ndvi062316@extent
ndvi062916 <- setMinMax(ndvi062916)
#ndvi062916@extent
ndvi072716 <- setMinMax(ndvi072716)
#ndvi072716@extent
ndvi081716 <- setMinMax(ndvi081716)
#ndvi081716@extent
ndvi082416 <- setMinMax(ndvi082416)
#ndvi082416@extent

ndvi050316.4.1 <- crop(ndvi050316, extent(ndvi050316, 240, 319, 1 ,200))
ndvi052616.4.1 <- crop(ndvi052616, extent(ndvi052616, 240, 319, 1 ,200))
ndvi062316.4.1 <- crop(ndvi062316, extent(ndvi062316, 240, 319, 1 ,200))
ndvi062916.4.1 <- crop(ndvi062916, extent(ndvi062916, 240, 319, 1 ,200))
ndvi072716.4.1 <- crop(ndvi072716, extent(ndvi072716, 240, 319, 1 ,200))
ndvi081716.4.1 <- crop(ndvi081716, extent(ndvi081716, 240, 319, 1 ,200))
ndvi082416.4.1 <- crop(ndvi082416, extent(ndvi082416, 240, 319, 1 ,200))



# cellStats(ndvi050316, max)
# cellStats(ndvi050316, min)
# cellStats(ndvi050316, range)
# ndvi050316@crs
# ndvi050316@extent
# ndvi050316@proj=longlat
# 
# ndvi050316.1.1
# 
# image(ndvi050316)
# image(ndvi082416.4.1)

ndvi050316.4.1.st <- stack(ndvi050316.4.1)
ndvi052616.4.1.st <- stack(ndvi052616.4.1)
ndvi062316.4.1.st <- stack(ndvi062316.4.1)
ndvi062916.4.1.st <- stack(ndvi062916.4.1)
ndvi072716.4.1.st <- stack(ndvi072716.4.1)
ndvi081716.4.1.st <- stack(ndvi081716.4.1)
ndvi082416.4.1.st <- stack(ndvi082416.4.1)

ndvi050316.4.1.df <- as.data.frame(ndvi050316.4.1.st);colnames(ndvi050316.4.1.df) <- "NDVI"; ndvi050316.4.1.df$observation <- 1:nrow(ndvi050316.4.1.df)

ndvi052616.4.1.df <- as.data.frame(ndvi052616.4.1.st);colnames(ndvi052616.4.1.df) <- "NDVI"; ndvi052616.4.1.df$observation <- 1:nrow(ndvi052616.4.1.df)

ndvi062316.4.1.df <- as.data.frame(ndvi062316.4.1.st); colnames(ndvi062316.4.1.df) <- "NDVI"; ndvi062316.4.1.df$observation <- 1:nrow(ndvi062316.4.1.df)

ndvi062916.4.1.df <- as.data.frame(ndvi062916.4.1.st); colnames(ndvi062916.4.1.df) <- "NDVI"; ndvi062916.4.1.df$observation <- 1:nrow(ndvi062916.4.1.df)

ndvi072716.4.1.df <- as.data.frame(ndvi072716.4.1.st); colnames(ndvi072716.4.1.df) <- "NDVI"; ndvi072716.4.1.df$observation <- 1:nrow(ndvi072716.4.1.df)

ndvi081716.4.1.df <- as.data.frame(ndvi081716.4.1.st); colnames(ndvi081716.4.1.df) <- "NDVI"; ndvi081716.4.1.df$observation <- 1:nrow(ndvi081716.4.1.df)

ndvi082416.4.1.df <- as.data.frame(ndvi082416.4.1.st);colnames(ndvi082416.4.1.df) <- "NDVI"; ndvi082416.4.1.df$observation <- 1:nrow(ndvi082416.4.1.df)


ndvi050316.4.1.st.av <- cellStats(ndvi050316.4.1.st, mean)
ndvi050316.4.1.st.md <- cellStats(ndvi050316.4.1.st, median)
ndvi050316.4.1.st.mx <- cellStats(ndvi050316.4.1.st, max)
ndvi050316.4.1.st.mn <- cellStats(ndvi050316.4.1.st, min)
ndvi050316.4.1.st.sd <- sd(ndvi050316.4.1.df$NDVI, na.rm = TRUE)

ndvi052616.4.1.st.av <- cellStats(ndvi052616.4.1.st, mean)
ndvi052616.4.1.st.md <- cellStats(ndvi052616.4.1.st, median)
ndvi052616.4.1.st.mx <- cellStats(ndvi052616.4.1.st, max)
ndvi052616.4.1.st.mn <- cellStats(ndvi052616.4.1.st, min)
ndvi052616.4.1.st.sd <- sd(ndvi052616.4.1.df$NDVI, na.rm = TRUE)

ndvi062316.4.1.st.av <- cellStats(ndvi062316, mean)
ndvi062316.4.1.st.md <- cellStats(ndvi062316, median)
ndvi062316.4.1.st.mx <- cellStats(ndvi062316.4.1.st, max)
ndvi062316.4.1.st.mn <- cellStats(ndvi062316.4.1.st, min)
ndvi062316.4.1.st.sd <- sd(ndvi062316.4.1.df$NDVI, na.rm = TRUE)

ndvi062916.4.1.st.av <- cellStats(ndvi062916.4.1.st, mean)
ndvi062916.4.1.st.md <- cellStats(ndvi062916.4.1.st, median)
ndvi062916.4.1.st.mx <- cellStats(ndvi062916.4.1.st, max)
ndvi062916.4.1.st.mn <- cellStats(ndvi062916.4.1.st, min)
ndvi062916.4.1.st.sd <- sd(ndvi062916.4.1.df$NDVI, na.rm = TRUE)

ndvi072716.4.1.st.av <- cellStats(ndvi072716.4.1.st, mean)
ndvi072716.4.1.st.md <- cellStats(ndvi072716.4.1.st, median)
ndvi072716.4.1.st.mx <- cellStats(ndvi072716.4.1.st, max)
ndvi072716.4.1.st.mn <- cellStats(ndvi072716.4.1.st, min)
ndvi072716.4.1.st.sd <- sd(ndvi072716.4.1.df$NDVI, na.rm = TRUE)

ndvi081716.4.1.st.av <- cellStats(ndvi081716.4.1.st, mean)
ndvi081716.4.1.st.md <- cellStats(ndvi081716.4.1.st, median)
ndvi081716.4.1.st.mx <- cellStats(ndvi081716.4.1.st, max)
ndvi081716.4.1.st.mn <- cellStats(ndvi081716.4.1.st, min)
ndvi081716.4.1.st.sd <- sd(ndvi081716.4.1.df$NDVI, na.rm = TRUE)

ndvi082416.4.1.st.av <- cellStats(ndvi082416.4.1.st, mean)
ndvi082416.4.1.st.md <- cellStats(ndvi082416.4.1.st, median)
ndvi082416.4.1.st.mx <- cellStats(ndvi082416.4.1.st, max)
ndvi082416.4.1.st.mn <- cellStats(ndvi082416.4.1.st, min)
ndvi082416.4.1.st.sd <- sd(ndvi082416.4.1.df$NDVI, na.rm = TRUE)

ndviav <- data.frame(Average = c(ndvi050316.4.1.st.av, ndvi052616.4.1.st.av, ndvi062316.4.1.st.av, ndvi062916.4.1.st.av,
                                 ndvi072716.4.1.st.av, ndvi081716.4.1.st.av, ndvi082416.4.1.st.av))

ndvimd <- data.frame(Median = c(ndvi050316.4.1.st.md, ndvi052616.4.1.st.md, ndvi062316.4.1.st.md, ndvi062916.4.1.st.md,
                                ndvi072716.4.1.st.md, ndvi081716.4.1.st.md, ndvi082416.4.1.st.md))

ndvisd <- data.frame(StandardDeviation = c(ndvi050316.4.1.st.sd, ndvi052616.4.1.st.sd, ndvi062316.4.1.st.sd, ndvi062916.4.1.st.sd,
                                           ndvi072716.4.1.st.sd, ndvi081716.4.1.st.sd, ndvi082416.4.1.st.sd))

ndvimx <- data.frame(Maximum = c(ndvi050316.4.1.st.mx, ndvi052616.4.1.st.mx, ndvi062316.4.1.st.mx, ndvi062916.4.1.st.mx,
                                 ndvi072716.4.1.st.mx, ndvi081716.4.1.st.mx, ndvi082416.4.1.st.mx))

ndvimn <- data.frame(Minimum = c(ndvi050316.4.1.st.mn, ndvi052616.4.1.st.mn, ndvi062316.4.1.st.mn, ndvi062916.4.1.st.mn,
                                 ndvi072716.4.1.st.mn, ndvi081716.4.1.st.mn, ndvi082416.4.1.st.mn))


rrbldf <- cbind(dt, ndviav)
rrbldf <- cbind(rrbldf, ndvimd)
rrbldf <- cbind(rrbldf, ndvisd)
rrbldf <- cbind(rrbldf, ndvimx)
rrbldf <- cbind(rrbldf, ndvimn)
write.csv(rrbldf, "RushRanchBlk1_2016.4.1.csv")


