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

ndvi050316.1.4 <- crop(ndvi050316, extent(ndvi050316, 1, 79, 601, 800))
ndvi052616.1.4 <- crop(ndvi052616, extent(ndvi052616, 1, 79, 601, 800))
ndvi062316.1.4 <- crop(ndvi062316, extent(ndvi062316, 1, 79, 601, 800))
ndvi062916.1.4 <- crop(ndvi062916, extent(ndvi062916, 1, 79, 601, 800))
ndvi072716.1.4 <- crop(ndvi072716, extent(ndvi072716, 1, 79, 601, 800))
ndvi081716.1.4 <- crop(ndvi081716, extent(ndvi081716, 1, 79, 601, 800))
ndvi082416.1.4 <- crop(ndvi082416, extent(ndvi082416, 1, 79, 601, 800))



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
image(ndvi082416.1.4)

ndvi050316.1.4.st <- stack(ndvi050316.1.4)
ndvi052616.1.4.st <- stack(ndvi052616.1.4)
ndvi062316.1.4.st <- stack(ndvi062316.1.4)
ndvi062916.1.4.st <- stack(ndvi062916.1.4)
ndvi072716.1.4.st <- stack(ndvi072716.1.4)
ndvi081716.1.4.st <- stack(ndvi081716.1.4)
ndvi082416.1.4.st <- stack(ndvi082416.1.4)

ndvi050316.1.4.df <- as.data.frame(ndvi050316.1.4.st);colnames(ndvi050316.1.4.df) <- "NDVI"; ndvi050316.1.4.df$observation <- 1:nrow(ndvi050316.1.4.df)

ndvi052616.1.4.df <- as.data.frame(ndvi052616.1.4.st);colnames(ndvi052616.1.4.df) <- "NDVI"; ndvi052616.1.4.df$observation <- 1:nrow(ndvi052616.1.4.df)

ndvi062316.1.4.df <- as.data.frame(ndvi062316.1.4.st); colnames(ndvi062316.1.4.df) <- "NDVI"; ndvi062316.1.4.df$observation <- 1:nrow(ndvi062316.1.4.df)

ndvi062916.1.4.df <- as.data.frame(ndvi062916.1.4.st); colnames(ndvi062916.1.4.df) <- "NDVI"; ndvi062916.1.4.df$observation <- 1:nrow(ndvi062916.1.4.df)

ndvi072716.1.4.df <- as.data.frame(ndvi072716.1.4.st); colnames(ndvi072716.1.4.df) <- "NDVI"; ndvi072716.1.4.df$observation <- 1:nrow(ndvi072716.1.4.df)

ndvi081716.1.4.df <- as.data.frame(ndvi081716.1.4.st); colnames(ndvi081716.1.4.df) <- "NDVI"; ndvi081716.1.4.df$observation <- 1:nrow(ndvi081716.1.4.df)

ndvi082416.1.4.df <- as.data.frame(ndvi082416.1.4.st);colnames(ndvi082416.1.4.df) <- "NDVI"; ndvi082416.1.4.df$observation <- 1:nrow(ndvi082416.1.4.df)


ndvi050316.1.4.st.av <- cellStats(ndvi050316.1.4.st, mean)
ndvi050316.1.4.st.md <- cellStats(ndvi050316.1.4.st, median)
ndvi050316.1.4.st.mx <- cellStats(ndvi050316.1.4.st, max)
ndvi050316.1.4.st.mn <- cellStats(ndvi050316.1.4.st, min)
ndvi050316.1.4.st.sd <- sd(ndvi050316.1.4.df$NDVI, na.rm = TRUE)

ndvi052616.1.4.st.av <- cellStats(ndvi052616.1.4.st, mean)
ndvi052616.1.4.st.md <- cellStats(ndvi052616.1.4.st, median)
ndvi052616.1.4.st.mx <- cellStats(ndvi052616.1.4.st, max)
ndvi052616.1.4.st.mn <- cellStats(ndvi052616.1.4.st, min)
ndvi052616.1.4.st.sd <- sd(ndvi052616.1.4.df$NDVI, na.rm = TRUE)

ndvi062316.1.4.st.av <- cellStats(ndvi062316, mean)
ndvi062316.1.4.st.md <- cellStats(ndvi062316, median)
ndvi062316.1.4.st.mx <- cellStats(ndvi062316.1.4.st, max)
ndvi062316.1.4.st.mn <- cellStats(ndvi062316.1.4.st, min)
ndvi062316.1.4.st.sd <- sd(ndvi062316.1.4.df$NDVI, na.rm = TRUE)

ndvi062916.1.4.st.av <- cellStats(ndvi062916.1.4.st, mean)
ndvi062916.1.4.st.md <- cellStats(ndvi062916.1.4.st, median)
ndvi062916.1.4.st.mx <- cellStats(ndvi062916.1.4.st, max)
ndvi062916.1.4.st.mn <- cellStats(ndvi062916.1.4.st, min)
ndvi062916.1.4.st.sd <- sd(ndvi062916.1.4.df$NDVI, na.rm = TRUE)

ndvi072716.1.4.st.av <- cellStats(ndvi072716.1.4.st, mean)
ndvi072716.1.4.st.md <- cellStats(ndvi072716.1.4.st, median)
ndvi072716.1.4.st.mx <- cellStats(ndvi072716.1.4.st, max)
ndvi072716.1.4.st.mn <- cellStats(ndvi072716.1.4.st, min)
ndvi072716.1.4.st.sd <- sd(ndvi072716.1.4.df$NDVI, na.rm = TRUE)

ndvi081716.1.4.st.av <- cellStats(ndvi081716.1.4.st, mean)
ndvi081716.1.4.st.md <- cellStats(ndvi081716.1.4.st, median)
ndvi081716.1.4.st.mx <- cellStats(ndvi081716.1.4.st, max)
ndvi081716.1.4.st.mn <- cellStats(ndvi081716.1.4.st, min)
ndvi081716.1.4.st.sd <- sd(ndvi081716.1.4.df$NDVI, na.rm = TRUE)

ndvi082416.1.4.st.av <- cellStats(ndvi082416.1.4.st, mean)
ndvi082416.1.4.st.md <- cellStats(ndvi082416.1.4.st, median)
ndvi082416.1.4.st.mx <- cellStats(ndvi082416.1.4.st, max)
ndvi082416.1.4.st.mn <- cellStats(ndvi082416.1.4.st, min)
ndvi082416.1.4.st.sd <- sd(ndvi082416.1.4.df$NDVI, na.rm = TRUE)

ndviav <- data.frame(Average = c(ndvi050316.1.4.st.av, ndvi052616.1.4.st.av, ndvi062316.1.4.st.av, ndvi062916.1.4.st.av,
                                 ndvi072716.1.4.st.av, ndvi081716.1.4.st.av, ndvi082416.1.4.st.av))

ndvimd <- data.frame(Median = c(ndvi050316.1.4.st.md, ndvi052616.1.4.st.md, ndvi062316.1.4.st.md, ndvi062916.1.4.st.md,
                                ndvi072716.1.4.st.md, ndvi081716.1.4.st.md, ndvi082416.1.4.st.md))

ndvisd <- data.frame(StandardDeviation = c(ndvi050316.1.4.st.sd, ndvi052616.1.4.st.sd, ndvi062316.1.4.st.sd, ndvi062916.1.4.st.sd,
                                           ndvi072716.1.4.st.sd, ndvi081716.1.4.st.sd, ndvi082416.1.4.st.sd))

ndvimx <- data.frame(Maximum = c(ndvi050316.1.4.st.mx, ndvi052616.1.4.st.mx, ndvi062316.1.4.st.mx, ndvi062916.1.4.st.mx,
                                 ndvi072716.1.4.st.mx, ndvi081716.1.4.st.mx, ndvi082416.1.4.st.mx))

ndvimn <- data.frame(Minimum = c(ndvi050316.1.4.st.mn, ndvi052616.1.4.st.mn, ndvi062316.1.4.st.mn, ndvi062916.1.4.st.mn,
                                 ndvi072716.1.4.st.mn, ndvi081716.1.4.st.mn, ndvi082416.1.4.st.mn))


rrbldf <- cbind(dt, ndviav)
rrbldf <- cbind(rrbldf, ndvimd)
rrbldf <- cbind(rrbldf, ndvisd)
rrbldf <- cbind(rrbldf, ndvimx)
rrbldf <- cbind(rrbldf, ndvimn)
write.csv(rrbldf, "RushRanchBlk1_2016.4.1.csv")

options(device = "RStudioGD")
ndvi050316.1.4.us <- unstack(ndvi050316.1.4.df); colnames(ndvi050316.1.4.us) <- "NDVI"
ndvi052616.1.4.us <- unstack(ndvi052616.1.4.df); colnames(ndvi052616.1.4.us) <- "NDVI"
ndvi062316.1.4.us <- unstack(ndvi062316.1.4.df); colnames(ndvi062316.1.4.us) <- "NDVI"
ndvi062916.1.4.us <- unstack(ndvi062916.1.4.df); colnames(ndvi062916.1.4.us) <- "NDVI"
ndvi072716.1.4.us <- unstack(ndvi072716.1.4.df); colnames(ndvi072716.1.4.us) <- "NDVI"
ndvi081716.1.4.us <- unstack(ndvi081716.1.4.df); colnames(ndvi081716.1.4.us) <- "NDVI"
ndvi082416.1.4.us <- unstack(ndvi082416.1.4.df); colnames(ndvi082416.1.4.us) <- "NDVI"

ndvi050316.1.4.p <- ggplot(ndvi050316.1.4.us, aes(ndvi050316.1.4.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi050316.1.4.p <- ndvi050316.1.4.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi050316.1.4.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi050316.1.4.p <- ndvi050316.1.4.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi050316.1.4.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi050316.1.4.p <- ndvi050316.1.4.p + labs(title = "Rush Ranch Block 1, Section 4.1\nMay 3, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi050316.1.4.p
ggsave(file = "050316.4.1.png")

ndvi052616.1.4.p <- ggplot(ndvi052616.1.4.us, aes(ndvi052616.1.4.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi052616.1.4.p <- ndvi052616.1.4.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi052616.1.4.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi052616.1.4.p <- ndvi052616.1.4.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi052616.1.4.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi052616.1.4.p <- ndvi052616.1.4.p + labs(title = "Rush Ranch Block 1, Section 4.1\nMay 26, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi052616.1.4.p
ggsave(file = "052616.4.1.png")

ndvi062316.1.4.p <- ggplot(ndvi062316.1.4.us, aes(ndvi062316.1.4.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi062316.1.4.p <- ndvi062316.1.4.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi062316.1.4.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi062316.1.4.p <- ndvi062316.1.4.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi062316.1.4.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi062316.1.4.p <- ndvi062316.1.4.p + labs(title = "Rush Ranch Block 1, Section 4.1\nJune 23, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi062316.1.4.p
ggsave(file = "062316.4.1.png")

ndvi062916.1.4.p <- ggplot(ndvi062916.1.4.us, aes(ndvi062916.1.4.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi062916.1.4.p <- ndvi062916.1.4.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi062916.1.4.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi062916.1.4.p <- ndvi062916.1.4.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi062916.1.4.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi062916.1.4.p <- ndvi062916.1.4.p + labs(title = "Rush Ranch Block 1, Section 4.1\nJune 29, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi062916.1.4.p
ggsave(file = "062916.4.1.png")

ndvi072716.1.4.p <- ggplot(ndvi072716.1.4.us, aes(ndvi072716.1.4.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi072716.1.4.p <- ndvi072716.1.4.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi072716.1.4.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi072716.1.4.p <- ndvi072716.1.4.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi072716.1.4.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi072716.1.4.p <- ndvi072716.1.4.p + labs(title = "Rush Ranch Block 1, Section 4.1\nJuly 27, 2016 NDVI Values Histogram\n with mean &median", x = "")
ndvi072716.1.4.p
ggsave(file = "072716.4.1.png")

ndvi081716.1.4.p <- ggplot(ndvi081716.1.4.us, aes(ndvi081716.1.4.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi081716.1.4.p <- ndvi081716.1.4.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi081716.1.4.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi081716.1.4.p <- ndvi081716.1.4.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi081716.1.4.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi081716.1.4.p <- ndvi081716.1.4.p + labs(title = "Rush Ranch Block 1, Section 4.1\nAugust 17, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi081716.1.4.p
ggsave(file = "081716.4.1.png")

ndvi082416.1.4.p <- ggplot(ndvi082416.1.4.us, aes(ndvi082416.1.4.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi082416.1.4.p <- ndvi082416.1.4.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi082416.1.4.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi082416.1.4.p <- ndvi082416.1.4.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi082416.1.4.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi082416.1.4.p <- ndvi082416.1.4.p + labs(title = "Rush Ranch Block 1, Section 4.1\nAugust 24, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi082416.1.4.p
ggsave(file = "082416.4.1.png")

set.seed(131)
ndvi050316.1.4.us <- na.omit(ndvi050316.1.4.us); ndvi050316.1.4.rs <- sample_n(ndvi050316.1.4.us, 95); ndvi050316.1.4.rs$Date <- "a"
ndvi052616.1.4.us <- na.omit(ndvi052616.1.4.us); ndvi052616.1.4.rs <- sample_n(ndvi052616.1.4.us, 180); ndvi052616.1.4.rs$Date <- "b"
ndvi062316.1.4.us <- na.omit(ndvi062316.1.4.us); ndvi062316.1.4.rs <- sample_n(ndvi062316.1.4.us, 250); ndvi062316.1.4.rs$Date <- "c"
ndvi062916.1.4.us <- na.omit(ndvi062916.1.4.us); ndvi062916.1.4.rs <- sample_n(ndvi062916.1.4.us, 750); ndvi062916.1.4.rs$Date <- "d"
ndvi072716.1.4.us <- na.omit(ndvi072716.1.4.us); ndvi072716.1.4.rs <- sample_n(ndvi072716.1.4.us, 900); ndvi072716.1.4.rs$Date <- "e"
ndvi081716.1.4.us <- na.omit(ndvi081716.1.4.us); ndvi081716.1.4.rs <- sample_n(ndvi081716.1.4.us, 720); ndvi081716.1.4.rs$Date <- "f"
ndvi082416.1.4.us <- na.omit(ndvi082416.1.4.us); ndvi082416.1.4.rs <- sample_n(ndvi082416.1.4.us, 360); ndvi082416.1.4.rs$Date <- "g"

rrblrs <- rbind(ndvi082416.1.4.rs, ndvi081716.1.4.rs)
rrblrs <- rbind(rrblrs, ndvi072716.1.4.rs)
rrblrs <- rbind(rrblrs, ndvi062916.1.4.rs)
rrblrs <- rbind(rrblrs, ndvi062316.1.4.rs)
rrblrs <- rbind(rrblrs, ndvi052616.1.4.rs)
rrblrs <- rbind(rrblrs, ndvi050316.1.4.rs)




rrblrsp <- ggplot(rrblrs, aes(x = Date, y = NDVI)) + geom_violin(aes(fill = Date))
rrblrsp <- rrblrsp + scale_fill_brewer(palette="BrBG", labels = c("May 3", "May 26", "June 23", "June 26", "July 27", "Aug 17", "Aug 24"))
rrblrsp <- rrblrsp + xlab("") + theme_bw()+ theme(axis.text.x = element_blank()) + theme(plot.title = element_text(hjust = 0.5))
rrblrsp <- rrblrsp + stat_summary(fun.data=mean_sdl, mult=1, geom="pointrange", color="#bf812d")
rrblrsp <- rrblrsp + labs(title = "Rush Ranch Block 1, Section 4.1\n2016 NDVI Values")
rrblrsp
ggsave(file = "rrblrsp2016violin.4.1.png")

rrblrsp <- ggplot(rrblrs, aes(x = Date, y = NDVI)) + geom_boxplot(aes(fill = Date))
rrblrsp <- rrblrsp + scale_fill_brewer(palette="BrBG", labels = c("May 3", "May 26", "June 23", "June 26", "July 27", "Aug 17", "Aug 24"))
rrblrsp <- rrblrsp + xlab("") + theme_bw() + theme(axis.text.x = element_blank()) + theme(plot.title = element_text(hjust = 0.5))
rrblrsp <- rrblrsp + labs(title = "Rush Ranch Block 1, Section 4.1\n2016 NDVI Values")
rrblrsp
ggsave(file = "rrblrsp2016box.4.1.png")

#######################################################################

ndvi050316.2.4 <- crop(ndvi050316, extent(ndvi050316, 80, 159, 601, 800))
ndvi052616.2.4 <- crop(ndvi052616, extent(ndvi052616, 80, 159, 601, 800))
ndvi062316.2.4 <- crop(ndvi062316, extent(ndvi062316, 80, 159, 601, 800))
ndvi062916.2.4 <- crop(ndvi062916, extent(ndvi062916, 80, 159, 601, 800))
ndvi072716.2.4 <- crop(ndvi072716, extent(ndvi072716, 80, 159, 601, 800))
ndvi081716.2.4 <- crop(ndvi081716, extent(ndvi081716, 80, 159, 601, 800))
ndvi082416.2.4 <- crop(ndvi082416, extent(ndvi082416, 80, 159, 601, 800))



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
image(ndvi082416.2.4)

ndvi050316.2.4.st <- stack(ndvi050316.2.4)
ndvi052616.2.4.st <- stack(ndvi052616.2.4)
ndvi062316.2.4.st <- stack(ndvi062316.2.4)
ndvi062916.2.4.st <- stack(ndvi062916.2.4)
ndvi072716.2.4.st <- stack(ndvi072716.2.4)
ndvi081716.2.4.st <- stack(ndvi081716.2.4)
ndvi082416.2.4.st <- stack(ndvi082416.2.4)

ndvi050316.2.4.df <- as.data.frame(ndvi050316.2.4.st);colnames(ndvi050316.2.4.df) <- "NDVI"; ndvi050316.2.4.df$observation <- 1:nrow(ndvi050316.2.4.df)

ndvi052616.2.4.df <- as.data.frame(ndvi052616.2.4.st);colnames(ndvi052616.2.4.df) <- "NDVI"; ndvi052616.2.4.df$observation <- 1:nrow(ndvi052616.2.4.df)

ndvi062316.2.4.df <- as.data.frame(ndvi062316.2.4.st); colnames(ndvi062316.2.4.df) <- "NDVI"; ndvi062316.2.4.df$observation <- 1:nrow(ndvi062316.2.4.df)

ndvi062916.2.4.df <- as.data.frame(ndvi062916.2.4.st); colnames(ndvi062916.2.4.df) <- "NDVI"; ndvi062916.2.4.df$observation <- 1:nrow(ndvi062916.2.4.df)

ndvi072716.2.4.df <- as.data.frame(ndvi072716.2.4.st); colnames(ndvi072716.2.4.df) <- "NDVI"; ndvi072716.2.4.df$observation <- 1:nrow(ndvi072716.2.4.df)

ndvi081716.2.4.df <- as.data.frame(ndvi081716.2.4.st); colnames(ndvi081716.2.4.df) <- "NDVI"; ndvi081716.2.4.df$observation <- 1:nrow(ndvi081716.2.4.df)

ndvi082416.2.4.df <- as.data.frame(ndvi082416.2.4.st);colnames(ndvi082416.2.4.df) <- "NDVI"; ndvi082416.2.4.df$observation <- 1:nrow(ndvi082416.2.4.df)


ndvi050316.2.4.st.av <- cellStats(ndvi050316.2.4.st, mean)
ndvi050316.2.4.st.md <- cellStats(ndvi050316.2.4.st, median)
ndvi050316.2.4.st.mx <- cellStats(ndvi050316.2.4.st, max)
ndvi050316.2.4.st.mn <- cellStats(ndvi050316.2.4.st, min)
ndvi050316.2.4.st.sd <- sd(ndvi050316.2.4.df$NDVI, na.rm = TRUE)

ndvi052616.2.4.st.av <- cellStats(ndvi052616.2.4.st, mean)
ndvi052616.2.4.st.md <- cellStats(ndvi052616.2.4.st, median)
ndvi052616.2.4.st.mx <- cellStats(ndvi052616.2.4.st, max)
ndvi052616.2.4.st.mn <- cellStats(ndvi052616.2.4.st, min)
ndvi052616.2.4.st.sd <- sd(ndvi052616.2.4.df$NDVI, na.rm = TRUE)

ndvi062316.2.4.st.av <- cellStats(ndvi062316, mean)
ndvi062316.2.4.st.md <- cellStats(ndvi062316, median)
ndvi062316.2.4.st.mx <- cellStats(ndvi062316.2.4.st, max)
ndvi062316.2.4.st.mn <- cellStats(ndvi062316.2.4.st, min)
ndvi062316.2.4.st.sd <- sd(ndvi062316.2.4.df$NDVI, na.rm = TRUE)

ndvi062916.2.4.st.av <- cellStats(ndvi062916.2.4.st, mean)
ndvi062916.2.4.st.md <- cellStats(ndvi062916.2.4.st, median)
ndvi062916.2.4.st.mx <- cellStats(ndvi062916.2.4.st, max)
ndvi062916.2.4.st.mn <- cellStats(ndvi062916.2.4.st, min)
ndvi062916.2.4.st.sd <- sd(ndvi062916.2.4.df$NDVI, na.rm = TRUE)

ndvi072716.2.4.st.av <- cellStats(ndvi072716.2.4.st, mean)
ndvi072716.2.4.st.md <- cellStats(ndvi072716.2.4.st, median)
ndvi072716.2.4.st.mx <- cellStats(ndvi072716.2.4.st, max)
ndvi072716.2.4.st.mn <- cellStats(ndvi072716.2.4.st, min)
ndvi072716.2.4.st.sd <- sd(ndvi072716.2.4.df$NDVI, na.rm = TRUE)

ndvi081716.2.4.st.av <- cellStats(ndvi081716.2.4.st, mean)
ndvi081716.2.4.st.md <- cellStats(ndvi081716.2.4.st, median)
ndvi081716.2.4.st.mx <- cellStats(ndvi081716.2.4.st, max)
ndvi081716.2.4.st.mn <- cellStats(ndvi081716.2.4.st, min)
ndvi081716.2.4.st.sd <- sd(ndvi081716.2.4.df$NDVI, na.rm = TRUE)

ndvi082416.2.4.st.av <- cellStats(ndvi082416.2.4.st, mean)
ndvi082416.2.4.st.md <- cellStats(ndvi082416.2.4.st, median)
ndvi082416.2.4.st.mx <- cellStats(ndvi082416.2.4.st, max)
ndvi082416.2.4.st.mn <- cellStats(ndvi082416.2.4.st, min)
ndvi082416.2.4.st.sd <- sd(ndvi082416.2.4.df$NDVI, na.rm = TRUE)

ndviav <- data.frame(Average = c(ndvi050316.2.4.st.av, ndvi052616.2.4.st.av, ndvi062316.2.4.st.av, ndvi062916.2.4.st.av,
                                 ndvi072716.2.4.st.av, ndvi081716.2.4.st.av, ndvi082416.2.4.st.av))

ndvimd <- data.frame(Median = c(ndvi050316.2.4.st.md, ndvi052616.2.4.st.md, ndvi062316.2.4.st.md, ndvi062916.2.4.st.md,
                                ndvi072716.2.4.st.md, ndvi081716.2.4.st.md, ndvi082416.2.4.st.md))

ndvisd <- data.frame(StandardDeviation = c(ndvi050316.2.4.st.sd, ndvi052616.2.4.st.sd, ndvi062316.2.4.st.sd, ndvi062916.2.4.st.sd,
                                           ndvi072716.2.4.st.sd, ndvi081716.2.4.st.sd, ndvi082416.2.4.st.sd))

ndvimx <- data.frame(Maximum = c(ndvi050316.2.4.st.mx, ndvi052616.2.4.st.mx, ndvi062316.2.4.st.mx, ndvi062916.2.4.st.mx,
                                 ndvi072716.2.4.st.mx, ndvi081716.2.4.st.mx, ndvi082416.2.4.st.mx))

ndvimn <- data.frame(Minimum = c(ndvi050316.2.4.st.mn, ndvi052616.2.4.st.mn, ndvi062316.2.4.st.mn, ndvi062916.2.4.st.mn,
                                 ndvi072716.2.4.st.mn, ndvi081716.2.4.st.mn, ndvi082416.2.4.st.mn))


rrbldf <- cbind(dt, ndviav)
rrbldf <- cbind(rrbldf, ndvimd)
rrbldf <- cbind(rrbldf, ndvisd)
rrbldf <- cbind(rrbldf, ndvimx)
rrbldf <- cbind(rrbldf, ndvimn)
write.csv(rrbldf, "RushRanchBlk1_2016.4.2.csv")

options(device = "RStudioGD")
ndvi050316.2.4.us <- unstack(ndvi050316.2.4.df); colnames(ndvi050316.2.4.us) <- "NDVI"
ndvi052616.2.4.us <- unstack(ndvi052616.2.4.df); colnames(ndvi052616.2.4.us) <- "NDVI"
ndvi062316.2.4.us <- unstack(ndvi062316.2.4.df); colnames(ndvi062316.2.4.us) <- "NDVI"
ndvi062916.2.4.us <- unstack(ndvi062916.2.4.df); colnames(ndvi062916.2.4.us) <- "NDVI"
ndvi072716.2.4.us <- unstack(ndvi072716.2.4.df); colnames(ndvi072716.2.4.us) <- "NDVI"
ndvi081716.2.4.us <- unstack(ndvi081716.2.4.df); colnames(ndvi081716.2.4.us) <- "NDVI"
ndvi082416.2.4.us <- unstack(ndvi082416.2.4.df); colnames(ndvi082416.2.4.us) <- "NDVI"

ndvi050316.2.4.p <- ggplot(ndvi050316.2.4.us, aes(ndvi050316.2.4.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi050316.2.4.p <- ndvi050316.2.4.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi050316.2.4.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi050316.2.4.p <- ndvi050316.2.4.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi050316.2.4.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi050316.2.4.p <- ndvi050316.2.4.p + labs(title = "Rush Ranch Block 1, Section 4.2\nMay 3, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi050316.2.4.p
ggsave(file = "050316.4.2.png")

ndvi052616.2.4.p <- ggplot(ndvi052616.2.4.us, aes(ndvi052616.2.4.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi052616.2.4.p <- ndvi052616.2.4.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi052616.2.4.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi052616.2.4.p <- ndvi052616.2.4.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi052616.2.4.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi052616.2.4.p <- ndvi052616.2.4.p + labs(title = "Rush Ranch Block 1, Section 4.2\nMay 26, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi052616.2.4.p
ggsave(file = "052616.4.2.png")

ndvi062316.2.4.p <- ggplot(ndvi062316.2.4.us, aes(ndvi062316.2.4.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi062316.2.4.p <- ndvi062316.2.4.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi062316.2.4.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi062316.2.4.p <- ndvi062316.2.4.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi062316.2.4.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi062316.2.4.p <- ndvi062316.2.4.p + labs(title = "Rush Ranch Block 1, Section 4.2\nJune 23, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi062316.2.4.p
ggsave(file = "062316.4.2.png")

ndvi062916.2.4.p <- ggplot(ndvi062916.2.4.us, aes(ndvi062916.2.4.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi062916.2.4.p <- ndvi062916.2.4.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi062916.2.4.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi062916.2.4.p <- ndvi062916.2.4.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi062916.2.4.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi062916.2.4.p <- ndvi062916.2.4.p + labs(title = "Rush Ranch Block 1, Section 4.2\nJune 29, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi062916.2.4.p
ggsave(file = "062916.4.2.png")

ndvi072716.2.4.p <- ggplot(ndvi072716.2.4.us, aes(ndvi072716.2.4.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi072716.2.4.p <- ndvi072716.2.4.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi072716.2.4.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi072716.2.4.p <- ndvi072716.2.4.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi072716.2.4.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi072716.2.4.p <- ndvi072716.2.4.p + labs(title = "Rush Ranch Block 1, Section 4.2\nJuly 27, 2016 NDVI Values Histogram\n with mean &median", x = "")
ndvi072716.2.4.p
ggsave(file = "072716.4.2.png")

ndvi081716.2.4.p <- ggplot(ndvi081716.2.4.us, aes(ndvi081716.2.4.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi081716.2.4.p <- ndvi081716.2.4.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi081716.2.4.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi081716.2.4.p <- ndvi081716.2.4.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi081716.2.4.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi081716.2.4.p <- ndvi081716.2.4.p + labs(title = "Rush Ranch Block 1, Section 4.2\nAugust 17, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi081716.2.4.p
ggsave(file = "081716.4.2.png")

ndvi082416.2.4.p <- ggplot(ndvi082416.2.4.us, aes(ndvi082416.2.4.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi082416.2.4.p <- ndvi082416.2.4.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi082416.2.4.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi082416.2.4.p <- ndvi082416.2.4.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi082416.2.4.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi082416.2.4.p <- ndvi082416.2.4.p + labs(title = "Rush Ranch Block 1, Section 4.2\nAugust 24, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi082416.2.4.p
ggsave(file = "082416.4.2.png")

set.seed(131)
ndvi050316.2.4.us <- na.omit(ndvi050316.2.4.us); ndvi050316.2.4.rs <- sample_n(ndvi050316.2.4.us, 6250); ndvi050316.2.4.rs$Date <- "a"
ndvi052616.2.4.us <- na.omit(ndvi052616.2.4.us); ndvi052616.2.4.rs <- sample_n(ndvi052616.2.4.us, 6250); ndvi052616.2.4.rs$Date <- "b"
ndvi062316.2.4.us <- na.omit(ndvi062316.2.4.us); ndvi062316.2.4.rs <- sample_n(ndvi062316.2.4.us, 6250); ndvi062316.2.4.rs$Date <- "c"
ndvi062916.2.4.us <- na.omit(ndvi062916.2.4.us); ndvi062916.2.4.rs <- sample_n(ndvi062916.2.4.us, 6250); ndvi062916.2.4.rs$Date <- "d"
ndvi072716.2.4.us <- na.omit(ndvi072716.2.4.us); ndvi072716.2.4.rs <- sample_n(ndvi072716.2.4.us, 6250); ndvi072716.2.4.rs$Date <- "e"
ndvi081716.2.4.us <- na.omit(ndvi081716.2.4.us); ndvi081716.2.4.rs <- sample_n(ndvi081716.2.4.us, 6250); ndvi081716.2.4.rs$Date <- "f"
ndvi082416.2.4.us <- na.omit(ndvi082416.2.4.us); ndvi082416.2.4.rs <- sample_n(ndvi082416.2.4.us, 6250); ndvi082416.2.4.rs$Date <- "g"

rrblrs <- rbind(ndvi082416.2.4.rs, ndvi081716.2.4.rs)
rrblrs <- rbind(rrblrs, ndvi072716.2.4.rs)
rrblrs <- rbind(rrblrs, ndvi062916.2.4.rs)
rrblrs <- rbind(rrblrs, ndvi062316.2.4.rs)
rrblrs <- rbind(rrblrs, ndvi052616.2.4.rs)
rrblrs <- rbind(rrblrs, ndvi050316.2.4.rs)




rrblrsp <- ggplot(rrblrs, aes(x = Date, y = NDVI)) + geom_violin(aes(fill = Date))
rrblrsp <- rrblrsp + scale_fill_brewer(palette="BrBG", labels = c("May 3", "May 26", "June 23", "June 26", "July 27", "Aug 17", "Aug 24"))
rrblrsp <- rrblrsp + xlab("") + theme_bw()+ theme(axis.text.x = element_blank()) + theme(plot.title = element_text(hjust = 0.5))
rrblrsp <- rrblrsp + stat_summary(fun.data=mean_sdl, mult=1, geom="pointrange", color="#bf812d")
rrblrsp <- rrblrsp + labs(title = "Rush Ranch Block 1, Section 4.2\n2016 NDVI Values")
rrblrsp
ggsave(file = "rrblrsp2016violin.4.2.png")

rrblrsp <- ggplot(rrblrs, aes(x = Date, y = NDVI)) + geom_boxplot(aes(fill = Date))
rrblrsp <- rrblrsp + scale_fill_brewer(palette="BrBG", labels = c("May 3", "May 26", "June 23", "June 26", "July 27", "Aug 17", "Aug 24"))
rrblrsp <- rrblrsp + xlab("") + theme_bw() + theme(axis.text.x = element_blank()) + theme(plot.title = element_text(hjust = 0.5))
rrblrsp <- rrblrsp + labs(title = "Rush Ranch Block 1, Section 4.2\n2016 NDVI Values")
rrblrsp
ggsave(file = "rrblrsp2016box.4.2.png")

####################################################################

ndvi050316.3.4 <- crop(ndvi050316, extent(ndvi050316, 160, 239, 601, 800))
ndvi052616.3.4 <- crop(ndvi052616, extent(ndvi052616, 160, 239, 601, 800))
ndvi062316.3.4 <- crop(ndvi062316, extent(ndvi062316, 160, 239, 601, 800))
ndvi062916.3.4 <- crop(ndvi062916, extent(ndvi062916, 160, 239, 601, 800))
ndvi072716.3.4 <- crop(ndvi072716, extent(ndvi072716, 160, 239, 601, 800))
ndvi081716.3.4 <- crop(ndvi081716, extent(ndvi081716, 160, 239, 601, 800))
ndvi082416.3.4 <- crop(ndvi082416, extent(ndvi082416, 160, 239, 601, 800))



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
image(ndvi082416.3.4)

ndvi050316.3.4.st <- stack(ndvi050316.3.4)
ndvi052616.3.4.st <- stack(ndvi052616.3.4)
ndvi062316.3.4.st <- stack(ndvi062316.3.4)
ndvi062916.3.4.st <- stack(ndvi062916.3.4)
ndvi072716.3.4.st <- stack(ndvi072716.3.4)
ndvi081716.3.4.st <- stack(ndvi081716.3.4)
ndvi082416.3.4.st <- stack(ndvi082416.3.4)

ndvi050316.3.4.df <- as.data.frame(ndvi050316.3.4.st);colnames(ndvi050316.3.4.df) <- "NDVI"; ndvi050316.3.4.df$observation <- 1:nrow(ndvi050316.3.4.df)

ndvi052616.3.4.df <- as.data.frame(ndvi052616.3.4.st);colnames(ndvi052616.3.4.df) <- "NDVI"; ndvi052616.3.4.df$observation <- 1:nrow(ndvi052616.3.4.df)

ndvi062316.3.4.df <- as.data.frame(ndvi062316.3.4.st); colnames(ndvi062316.3.4.df) <- "NDVI"; ndvi062316.3.4.df$observation <- 1:nrow(ndvi062316.3.4.df)

ndvi062916.3.4.df <- as.data.frame(ndvi062916.3.4.st); colnames(ndvi062916.3.4.df) <- "NDVI"; ndvi062916.3.4.df$observation <- 1:nrow(ndvi062916.3.4.df)

ndvi072716.3.4.df <- as.data.frame(ndvi072716.3.4.st); colnames(ndvi072716.3.4.df) <- "NDVI"; ndvi072716.3.4.df$observation <- 1:nrow(ndvi072716.3.4.df)

ndvi081716.3.4.df <- as.data.frame(ndvi081716.3.4.st); colnames(ndvi081716.3.4.df) <- "NDVI"; ndvi081716.3.4.df$observation <- 1:nrow(ndvi081716.3.4.df)

ndvi082416.3.4.df <- as.data.frame(ndvi082416.3.4.st);colnames(ndvi082416.3.4.df) <- "NDVI"; ndvi082416.3.4.df$observation <- 1:nrow(ndvi082416.3.4.df)


ndvi050316.3.4.st.av <- cellStats(ndvi050316.3.4.st, mean)
ndvi050316.3.4.st.md <- cellStats(ndvi050316.3.4.st, median)
ndvi050316.3.4.st.mx <- cellStats(ndvi050316.3.4.st, max)
ndvi050316.3.4.st.mn <- cellStats(ndvi050316.3.4.st, min)
ndvi050316.3.4.st.sd <- sd(ndvi050316.3.4.df$NDVI, na.rm = TRUE)

ndvi052616.3.4.st.av <- cellStats(ndvi052616.3.4.st, mean)
ndvi052616.3.4.st.md <- cellStats(ndvi052616.3.4.st, median)
ndvi052616.3.4.st.mx <- cellStats(ndvi052616.3.4.st, max)
ndvi052616.3.4.st.mn <- cellStats(ndvi052616.3.4.st, min)
ndvi052616.3.4.st.sd <- sd(ndvi052616.3.4.df$NDVI, na.rm = TRUE)

ndvi062316.3.4.st.av <- cellStats(ndvi062316, mean)
ndvi062316.3.4.st.md <- cellStats(ndvi062316, median)
ndvi062316.3.4.st.mx <- cellStats(ndvi062316.3.4.st, max)
ndvi062316.3.4.st.mn <- cellStats(ndvi062316.3.4.st, min)
ndvi062316.3.4.st.sd <- sd(ndvi062316.3.4.df$NDVI, na.rm = TRUE)

ndvi062916.3.4.st.av <- cellStats(ndvi062916.3.4.st, mean)
ndvi062916.3.4.st.md <- cellStats(ndvi062916.3.4.st, median)
ndvi062916.3.4.st.mx <- cellStats(ndvi062916.3.4.st, max)
ndvi062916.3.4.st.mn <- cellStats(ndvi062916.3.4.st, min)
ndvi062916.3.4.st.sd <- sd(ndvi062916.3.4.df$NDVI, na.rm = TRUE)

ndvi072716.3.4.st.av <- cellStats(ndvi072716.3.4.st, mean)
ndvi072716.3.4.st.md <- cellStats(ndvi072716.3.4.st, median)
ndvi072716.3.4.st.mx <- cellStats(ndvi072716.3.4.st, max)
ndvi072716.3.4.st.mn <- cellStats(ndvi072716.3.4.st, min)
ndvi072716.3.4.st.sd <- sd(ndvi072716.3.4.df$NDVI, na.rm = TRUE)

ndvi081716.3.4.st.av <- cellStats(ndvi081716.3.4.st, mean)
ndvi081716.3.4.st.md <- cellStats(ndvi081716.3.4.st, median)
ndvi081716.3.4.st.mx <- cellStats(ndvi081716.3.4.st, max)
ndvi081716.3.4.st.mn <- cellStats(ndvi081716.3.4.st, min)
ndvi081716.3.4.st.sd <- sd(ndvi081716.3.4.df$NDVI, na.rm = TRUE)

ndvi082416.3.4.st.av <- cellStats(ndvi082416.3.4.st, mean)
ndvi082416.3.4.st.md <- cellStats(ndvi082416.3.4.st, median)
ndvi082416.3.4.st.mx <- cellStats(ndvi082416.3.4.st, max)
ndvi082416.3.4.st.mn <- cellStats(ndvi082416.3.4.st, min)
ndvi082416.3.4.st.sd <- sd(ndvi082416.3.4.df$NDVI, na.rm = TRUE)

ndviav <- data.frame(Average = c(ndvi050316.3.4.st.av, ndvi052616.3.4.st.av, ndvi062316.3.4.st.av, ndvi062916.3.4.st.av,
                                 ndvi072716.3.4.st.av, ndvi081716.3.4.st.av, ndvi082416.3.4.st.av))

ndvimd <- data.frame(Median = c(ndvi050316.3.4.st.md, ndvi052616.3.4.st.md, ndvi062316.3.4.st.md, ndvi062916.3.4.st.md,
                                ndvi072716.3.4.st.md, ndvi081716.3.4.st.md, ndvi082416.3.4.st.md))

ndvisd <- data.frame(StandardDeviation = c(ndvi050316.3.4.st.sd, ndvi052616.3.4.st.sd, ndvi062316.3.4.st.sd, ndvi062916.3.4.st.sd,
                                           ndvi072716.3.4.st.sd, ndvi081716.3.4.st.sd, ndvi082416.3.4.st.sd))

ndvimx <- data.frame(Maximum = c(ndvi050316.3.4.st.mx, ndvi052616.3.4.st.mx, ndvi062316.3.4.st.mx, ndvi062916.3.4.st.mx,
                                 ndvi072716.3.4.st.mx, ndvi081716.3.4.st.mx, ndvi082416.3.4.st.mx))

ndvimn <- data.frame(Minimum = c(ndvi050316.3.4.st.mn, ndvi052616.3.4.st.mn, ndvi062316.3.4.st.mn, ndvi062916.3.4.st.mn,
                                 ndvi072716.3.4.st.mn, ndvi081716.3.4.st.mn, ndvi082416.3.4.st.mn))


rrbldf <- cbind(dt, ndviav)
rrbldf <- cbind(rrbldf, ndvimd)
rrbldf <- cbind(rrbldf, ndvisd)
rrbldf <- cbind(rrbldf, ndvimx)
rrbldf <- cbind(rrbldf, ndvimn)
write.csv(rrbldf, "RushRanchBlk1_2016.4.3.csv")

options(device = "RStudioGD")
ndvi050316.3.4.us <- unstack(ndvi050316.3.4.df); colnames(ndvi050316.3.4.us) <- "NDVI"
ndvi052616.3.4.us <- unstack(ndvi052616.3.4.df); colnames(ndvi052616.3.4.us) <- "NDVI"
ndvi062316.3.4.us <- unstack(ndvi062316.3.4.df); colnames(ndvi062316.3.4.us) <- "NDVI"
ndvi062916.3.4.us <- unstack(ndvi062916.3.4.df); colnames(ndvi062916.3.4.us) <- "NDVI"
ndvi072716.3.4.us <- unstack(ndvi072716.3.4.df); colnames(ndvi072716.3.4.us) <- "NDVI"
ndvi081716.3.4.us <- unstack(ndvi081716.3.4.df); colnames(ndvi081716.3.4.us) <- "NDVI"
ndvi082416.3.4.us <- unstack(ndvi082416.3.4.df); colnames(ndvi082416.3.4.us) <- "NDVI"

ndvi050316.3.4.p <- ggplot(ndvi050316.3.4.us, aes(ndvi050316.3.4.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi050316.3.4.p <- ndvi050316.3.4.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi050316.3.4.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi050316.3.4.p <- ndvi050316.3.4.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi050316.3.4.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi050316.3.4.p <- ndvi050316.3.4.p + labs(title = "Rush Ranch Block 1, Section 4.3\nMay 3, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi050316.3.4.p
ggsave(file = "050316.4.3.png")

ndvi052616.3.4.p <- ggplot(ndvi052616.3.4.us, aes(ndvi052616.3.4.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi052616.3.4.p <- ndvi052616.3.4.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi052616.3.4.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi052616.3.4.p <- ndvi052616.3.4.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi052616.3.4.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi052616.3.4.p <- ndvi052616.3.4.p + labs(title = "Rush Ranch Block 1, Section 4.3\nMay 26, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi052616.3.4.p
ggsave(file = "052616.4.3.png")

ndvi062316.3.4.p <- ggplot(ndvi062316.3.4.us, aes(ndvi062316.3.4.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi062316.3.4.p <- ndvi062316.3.4.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi062316.3.4.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi062316.3.4.p <- ndvi062316.3.4.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi062316.3.4.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi062316.3.4.p <- ndvi062316.3.4.p + labs(title = "Rush Ranch Block 1, Section 4.3\nJune 23, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi062316.3.4.p
ggsave(file = "062316.4.3.png")

ndvi062916.3.4.p <- ggplot(ndvi062916.3.4.us, aes(ndvi062916.3.4.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi062916.3.4.p <- ndvi062916.3.4.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi062916.3.4.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi062916.3.4.p <- ndvi062916.3.4.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi062916.3.4.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi062916.3.4.p <- ndvi062916.3.4.p + labs(title = "Rush Ranch Block 1, Section 4.3\nJune 29, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi062916.3.4.p
ggsave(file = "062916.4.3.png")

ndvi072716.3.4.p <- ggplot(ndvi072716.3.4.us, aes(ndvi072716.3.4.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi072716.3.4.p <- ndvi072716.3.4.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi072716.3.4.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi072716.3.4.p <- ndvi072716.3.4.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi072716.3.4.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi072716.3.4.p <- ndvi072716.3.4.p + labs(title = "Rush Ranch Block 1, Section 4.3\nJuly 27, 2016 NDVI Values Histogram\n with mean &median", x = "")
ndvi072716.3.4.p
ggsave(file = "072716.4.3.png")

ndvi081716.3.4.p <- ggplot(ndvi081716.3.4.us, aes(ndvi081716.3.4.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi081716.3.4.p <- ndvi081716.3.4.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi081716.3.4.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi081716.3.4.p <- ndvi081716.3.4.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi081716.3.4.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi081716.3.4.p <- ndvi081716.3.4.p + labs(title = "Rush Ranch Block 1, Section 4.3\nAugust 17, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi081716.3.4.p
ggsave(file = "081716.4.3.png")

ndvi082416.3.4.p <- ggplot(ndvi082416.3.4.us, aes(ndvi082416.3.4.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi082416.3.4.p <- ndvi082416.3.4.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi082416.3.4.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi082416.3.4.p <- ndvi082416.3.4.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi082416.3.4.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi082416.3.4.p <- ndvi082416.3.4.p + labs(title = "Rush Ranch Block 1, Section 4.3\nAugust 24, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi082416.3.4.p
ggsave(file = "082416.4.3.png")

set.seed(131)
ndvi050316.3.4.us <- na.omit(ndvi050316.3.4.us); ndvi050316.3.4.rs <- sample_n(ndvi050316.3.4.us, 13000); ndvi050316.3.4.rs$Date <- "a"
ndvi052616.3.4.us <- na.omit(ndvi052616.3.4.us); ndvi052616.3.4.rs <- sample_n(ndvi052616.3.4.us, 13000); ndvi052616.3.4.rs$Date <- "b"
ndvi062316.3.4.us <- na.omit(ndvi062316.3.4.us); ndvi062316.3.4.rs <- sample_n(ndvi062316.3.4.us, 13000); ndvi062316.3.4.rs$Date <- "c"
ndvi062916.3.4.us <- na.omit(ndvi062916.3.4.us); ndvi062916.3.4.rs <- sample_n(ndvi062916.3.4.us, 13000); ndvi062916.3.4.rs$Date <- "d"
ndvi072716.3.4.us <- na.omit(ndvi072716.3.4.us); ndvi072716.3.4.rs <- sample_n(ndvi072716.3.4.us, 13000); ndvi072716.3.4.rs$Date <- "e"
ndvi081716.3.4.us <- na.omit(ndvi081716.3.4.us); ndvi081716.3.4.rs <- sample_n(ndvi081716.3.4.us, 13000); ndvi081716.3.4.rs$Date <- "f"
ndvi082416.3.4.us <- na.omit(ndvi082416.3.4.us); ndvi082416.3.4.rs <- sample_n(ndvi082416.3.4.us, 13000); ndvi082416.3.4.rs$Date <- "g"

rrblrs <- rbind(ndvi082416.3.4.rs, ndvi081716.3.4.rs)
rrblrs <- rbind(rrblrs, ndvi072716.3.4.rs)
rrblrs <- rbind(rrblrs, ndvi062916.3.4.rs)
rrblrs <- rbind(rrblrs, ndvi062316.3.4.rs)
rrblrs <- rbind(rrblrs, ndvi052616.3.4.rs)
rrblrs <- rbind(rrblrs, ndvi050316.3.4.rs)




rrblrsp <- ggplot(rrblrs, aes(x = Date, y = NDVI)) + geom_violin(aes(fill = Date))
rrblrsp <- rrblrsp + scale_fill_brewer(palette="BrBG", labels = c("May 3", "May 26", "June 23", "June 26", "July 27", "Aug 17", "Aug 24"))
rrblrsp <- rrblrsp + xlab("") + theme_bw()+ theme(axis.text.x = element_blank()) + theme(plot.title = element_text(hjust = 0.5))
rrblrsp <- rrblrsp + stat_summary(fun.data=mean_sdl, mult=1, geom="pointrange", color="#bf812d")
rrblrsp <- rrblrsp + labs(title = "Rush Ranch Block 1, Section 4.3\n2016 NDVI Values")
rrblrsp
ggsave(file = "rrblrsp2016violin.4.3.png")

rrblrsp <- ggplot(rrblrs, aes(x = Date, y = NDVI)) + geom_boxplot(aes(fill = Date))
rrblrsp <- rrblrsp + scale_fill_brewer(palette="BrBG", labels = c("May 3", "May 26", "June 23", "June 26", "July 27", "Aug 17", "Aug 24"))
rrblrsp <- rrblrsp + xlab("") + theme_bw() + theme(axis.text.x = element_blank()) + theme(plot.title = element_text(hjust = 0.5))
rrblrsp <- rrblrsp + labs(title = "Rush Ranch Block 1, Section 4.3\n2016 NDVI Values")
rrblrsp
ggsave(file = "rrblrsp2016box.4.3.png")

##############################################################
ndvi050316.4.4 <- crop(ndvi050316, extent(ndvi050316, 240, 319, 601, 800))
ndvi052616.4.4 <- crop(ndvi052616, extent(ndvi052616, 240, 319, 601, 800))
ndvi062316.4.4 <- crop(ndvi062316, extent(ndvi062316, 240, 319, 601, 800))
ndvi062916.4.4 <- crop(ndvi062916, extent(ndvi062916, 240, 319, 601, 800))
ndvi072716.4.4 <- crop(ndvi072716, extent(ndvi072716, 240, 319, 601, 800))
ndvi081716.4.4 <- crop(ndvi081716, extent(ndvi081716, 240, 319, 601, 800))
ndvi082416.4.4 <- crop(ndvi082416, extent(ndvi082416, 240, 319, 601, 800))



# cellStats(ndvi050316, max)
# cellStats(ndvi050316, min)
# cellStats(ndvi050316, range)
# ndvi050316@crs
# ndvi050316@extent
# ndvi050316@proj=longlat
# 
#ndvi050316.1.1
# 
# image(ndvi050316)
image(ndvi082416.4.4)

ndvi050316.4.4.st <- stack(ndvi050316.4.4)
ndvi052616.4.4.st <- stack(ndvi052616.4.4)
ndvi062316.4.4.st <- stack(ndvi062316.4.4)
ndvi062916.4.4.st <- stack(ndvi062916.4.4)
ndvi072716.4.4.st <- stack(ndvi072716.4.4)
ndvi081716.4.4.st <- stack(ndvi081716.4.4)
ndvi082416.4.4.st <- stack(ndvi082416.4.4)

ndvi050316.4.4.df <- as.data.frame(ndvi050316.4.4.st);colnames(ndvi050316.4.4.df) <- "NDVI"; ndvi050316.4.4.df$observation <- 1:nrow(ndvi050316.4.4.df)

ndvi052616.4.4.df <- as.data.frame(ndvi052616.4.4.st);colnames(ndvi052616.4.4.df) <- "NDVI"; ndvi052616.4.4.df$observation <- 1:nrow(ndvi052616.4.4.df)

ndvi062316.4.4.df <- as.data.frame(ndvi062316.4.4.st); colnames(ndvi062316.4.4.df) <- "NDVI"; ndvi062316.4.4.df$observation <- 1:nrow(ndvi062316.4.4.df)

ndvi062916.4.4.df <- as.data.frame(ndvi062916.4.4.st); colnames(ndvi062916.4.4.df) <- "NDVI"; ndvi062916.4.4.df$observation <- 1:nrow(ndvi062916.4.4.df)

ndvi072716.4.4.df <- as.data.frame(ndvi072716.4.4.st); colnames(ndvi072716.4.4.df) <- "NDVI"; ndvi072716.4.4.df$observation <- 1:nrow(ndvi072716.4.4.df)

ndvi081716.4.4.df <- as.data.frame(ndvi081716.4.4.st); colnames(ndvi081716.4.4.df) <- "NDVI"; ndvi081716.4.4.df$observation <- 1:nrow(ndvi081716.4.4.df)

ndvi082416.4.4.df <- as.data.frame(ndvi082416.4.4.st);colnames(ndvi082416.4.4.df) <- "NDVI"; ndvi082416.4.4.df$observation <- 1:nrow(ndvi082416.4.4.df)


ndvi050316.4.4.st.av <- cellStats(ndvi050316.4.4.st, mean)
ndvi050316.4.4.st.md <- cellStats(ndvi050316.4.4.st, median)
ndvi050316.4.4.st.mx <- cellStats(ndvi050316.4.4.st, max)
ndvi050316.4.4.st.mn <- cellStats(ndvi050316.4.4.st, min)
ndvi050316.4.4.st.sd <- sd(ndvi050316.4.4.df$NDVI, na.rm = TRUE)

ndvi052616.4.4.st.av <- cellStats(ndvi052616.4.4.st, mean)
ndvi052616.4.4.st.md <- cellStats(ndvi052616.4.4.st, median)
ndvi052616.4.4.st.mx <- cellStats(ndvi052616.4.4.st, max)
ndvi052616.4.4.st.mn <- cellStats(ndvi052616.4.4.st, min)
ndvi052616.4.4.st.sd <- sd(ndvi052616.4.4.df$NDVI, na.rm = TRUE)

ndvi062316.4.4.st.av <- cellStats(ndvi062316, mean)
ndvi062316.4.4.st.md <- cellStats(ndvi062316, median)
ndvi062316.4.4.st.mx <- cellStats(ndvi062316.4.4.st, max)
ndvi062316.4.4.st.mn <- cellStats(ndvi062316.4.4.st, min)
ndvi062316.4.4.st.sd <- sd(ndvi062316.4.4.df$NDVI, na.rm = TRUE)

ndvi062916.4.4.st.av <- cellStats(ndvi062916.4.4.st, mean)
ndvi062916.4.4.st.md <- cellStats(ndvi062916.4.4.st, median)
ndvi062916.4.4.st.mx <- cellStats(ndvi062916.4.4.st, max)
ndvi062916.4.4.st.mn <- cellStats(ndvi062916.4.4.st, min)
ndvi062916.4.4.st.sd <- sd(ndvi062916.4.4.df$NDVI, na.rm = TRUE)

ndvi072716.4.4.st.av <- cellStats(ndvi072716.4.4.st, mean)
ndvi072716.4.4.st.md <- cellStats(ndvi072716.4.4.st, median)
ndvi072716.4.4.st.mx <- cellStats(ndvi072716.4.4.st, max)
ndvi072716.4.4.st.mn <- cellStats(ndvi072716.4.4.st, min)
ndvi072716.4.4.st.sd <- sd(ndvi072716.4.4.df$NDVI, na.rm = TRUE)

ndvi081716.4.4.st.av <- cellStats(ndvi081716.4.4.st, mean)
ndvi081716.4.4.st.md <- cellStats(ndvi081716.4.4.st, median)
ndvi081716.4.4.st.mx <- cellStats(ndvi081716.4.4.st, max)
ndvi081716.4.4.st.mn <- cellStats(ndvi081716.4.4.st, min)
ndvi081716.4.4.st.sd <- sd(ndvi081716.4.4.df$NDVI, na.rm = TRUE)

ndvi082416.4.4.st.av <- cellStats(ndvi082416.4.4.st, mean)
ndvi082416.4.4.st.md <- cellStats(ndvi082416.4.4.st, median)
ndvi082416.4.4.st.mx <- cellStats(ndvi082416.4.4.st, max)
ndvi082416.4.4.st.mn <- cellStats(ndvi082416.4.4.st, min)
ndvi082416.4.4.st.sd <- sd(ndvi082416.4.4.df$NDVI, na.rm = TRUE)

ndviav <- data.frame(Average = c(ndvi050316.4.4.st.av, ndvi052616.4.4.st.av, ndvi062316.4.4.st.av, ndvi062916.4.4.st.av,
                                 ndvi072716.4.4.st.av, ndvi081716.4.4.st.av, ndvi082416.4.4.st.av))

ndvimd <- data.frame(Median = c(ndvi050316.4.4.st.md, ndvi052616.4.4.st.md, ndvi062316.4.4.st.md, ndvi062916.4.4.st.md,
                                ndvi072716.4.4.st.md, ndvi081716.4.4.st.md, ndvi082416.4.4.st.md))

ndvisd <- data.frame(StandardDeviation = c(ndvi050316.4.4.st.sd, ndvi052616.4.4.st.sd, ndvi062316.4.4.st.sd, ndvi062916.4.4.st.sd,
                                           ndvi072716.4.4.st.sd, ndvi081716.4.4.st.sd, ndvi082416.4.4.st.sd))

ndvimx <- data.frame(Maximum = c(ndvi050316.4.4.st.mx, ndvi052616.4.4.st.mx, ndvi062316.4.4.st.mx, ndvi062916.4.4.st.mx,
                                 ndvi072716.4.4.st.mx, ndvi081716.4.4.st.mx, ndvi082416.4.4.st.mx))

ndvimn <- data.frame(Minimum = c(ndvi050316.4.4.st.mn, ndvi052616.4.4.st.mn, ndvi062316.4.4.st.mn, ndvi062916.4.4.st.mn,
                                 ndvi072716.4.4.st.mn, ndvi081716.4.4.st.mn, ndvi082416.4.4.st.mn))


rrbldf <- cbind(dt, ndviav)
rrbldf <- cbind(rrbldf, ndvimd)
rrbldf <- cbind(rrbldf, ndvisd)
rrbldf <- cbind(rrbldf, ndvimx)
rrbldf <- cbind(rrbldf, ndvimn)
write.csv(rrbldf, "RushRanchBlk1_2016.4.4.csv")

options(device = "RStudioGD")
ndvi050316.4.4.us <- unstack(ndvi050316.4.4.df); colnames(ndvi050316.4.4.us) <- "NDVI"
ndvi052616.4.4.us <- unstack(ndvi052616.4.4.df); colnames(ndvi052616.4.4.us) <- "NDVI"
ndvi062316.4.4.us <- unstack(ndvi062316.4.4.df); colnames(ndvi062316.4.4.us) <- "NDVI"
ndvi062916.4.4.us <- unstack(ndvi062916.4.4.df); colnames(ndvi062916.4.4.us) <- "NDVI"
ndvi072716.4.4.us <- unstack(ndvi072716.4.4.df); colnames(ndvi072716.4.4.us) <- "NDVI"
ndvi081716.4.4.us <- unstack(ndvi081716.4.4.df); colnames(ndvi081716.4.4.us) <- "NDVI"
ndvi082416.4.4.us <- unstack(ndvi082416.4.4.df); colnames(ndvi082416.4.4.us) <- "NDVI"

ndvi050316.4.4.p <- ggplot(ndvi050316.4.4.us, aes(ndvi050316.4.4.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi050316.4.4.p <- ndvi050316.4.4.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi050316.4.4.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi050316.4.4.p <- ndvi050316.4.4.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi050316.4.4.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi050316.4.4.p <- ndvi050316.4.4.p + labs(title = "Rush Ranch Block 1, Section 4.4\nMay 3, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi050316.4.4.p
ggsave(file = "050316.4.4.png")

ndvi052616.4.4.p <- ggplot(ndvi052616.4.4.us, aes(ndvi052616.4.4.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi052616.4.4.p <- ndvi052616.4.4.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi052616.4.4.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi052616.4.4.p <- ndvi052616.4.4.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi052616.4.4.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi052616.4.4.p <- ndvi052616.4.4.p + labs(title = "Rush Ranch Block 1, Section 4.4\nMay 26, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi052616.4.4.p
ggsave(file = "052616.4.4.png")

ndvi062316.4.4.p <- ggplot(ndvi062316.4.4.us, aes(ndvi062316.4.4.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi062316.4.4.p <- ndvi062316.4.4.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi062316.4.4.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi062316.4.4.p <- ndvi062316.4.4.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi062316.4.4.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi062316.4.4.p <- ndvi062316.4.4.p + labs(title = "Rush Ranch Block 1, Section 4.4\nJune 23, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi062316.4.4.p
ggsave(file = "062316.4.4.png")

ndvi062916.4.4.p <- ggplot(ndvi062916.4.4.us, aes(ndvi062916.4.4.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi062916.4.4.p <- ndvi062916.4.4.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi062916.4.4.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi062916.4.4.p <- ndvi062916.4.4.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi062916.4.4.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi062916.4.4.p <- ndvi062916.4.4.p + labs(title = "Rush Ranch Block 1, Section 4.4\nJune 29, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi062916.4.4.p
ggsave(file = "062916.4.4.png")

ndvi072716.4.4.p <- ggplot(ndvi072716.4.4.us, aes(ndvi072716.4.4.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi072716.4.4.p <- ndvi072716.4.4.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi072716.4.4.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi072716.4.4.p <- ndvi072716.4.4.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi072716.4.4.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi072716.4.4.p <- ndvi072716.4.4.p + labs(title = "Rush Ranch Block 1, Section 4.4\nJuly 27, 2016 NDVI Values Histogram\n with mean &median", x = "")
ndvi072716.4.4.p
ggsave(file = "072716.4.4.png")

ndvi081716.4.4.p <- ggplot(ndvi081716.4.4.us, aes(ndvi081716.4.4.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi081716.4.4.p <- ndvi081716.4.4.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi081716.4.4.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi081716.4.4.p <- ndvi081716.4.4.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi081716.4.4.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi081716.4.4.p <- ndvi081716.4.4.p + labs(title = "Rush Ranch Block 1, Section 4.4\nAugust 17, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi081716.4.4.p
ggsave(file = "081716.4.4.png")

ndvi082416.4.4.p <- ggplot(ndvi082416.4.4.us, aes(ndvi082416.4.4.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi082416.4.4.p <- ndvi082416.4.4.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi082416.4.4.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi082416.4.4.p <- ndvi082416.4.4.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi082416.4.4.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi082416.4.4.p <- ndvi082416.4.4.p + labs(title = "Rush Ranch Block 1, Section 4.4\nAugust 24, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi082416.4.4.p
ggsave(file = "082416.4.4.png")

set.seed(131)
ndvi050316.4.4.us <- na.omit(ndvi050316.4.4.us); ndvi050316.4.4.rs <- sample_n(ndvi050316.4.4.us, 15000); ndvi050316.4.4.rs$Date <- "a"
ndvi052616.4.4.us <- na.omit(ndvi052616.4.4.us); ndvi052616.4.4.rs <- sample_n(ndvi052616.4.4.us, 15000); ndvi052616.4.4.rs$Date <- "b"
ndvi062316.4.4.us <- na.omit(ndvi062316.4.4.us); ndvi062316.4.4.rs <- sample_n(ndvi062316.4.4.us, 15000); ndvi062316.4.4.rs$Date <- "c"
ndvi062916.4.4.us <- na.omit(ndvi062916.4.4.us); ndvi062916.4.4.rs <- sample_n(ndvi062916.4.4.us, 15000); ndvi062916.4.4.rs$Date <- "d"
ndvi072716.4.4.us <- na.omit(ndvi072716.4.4.us); ndvi072716.4.4.rs <- sample_n(ndvi072716.4.4.us, 15000); ndvi072716.4.4.rs$Date <- "e"
ndvi081716.4.4.us <- na.omit(ndvi081716.4.4.us); ndvi081716.4.4.rs <- sample_n(ndvi081716.4.4.us, 15000); ndvi081716.4.4.rs$Date <- "f"
ndvi082416.4.4.us <- na.omit(ndvi082416.4.4.us); ndvi082416.4.4.rs <- sample_n(ndvi082416.4.4.us, 15000); ndvi082416.4.4.rs$Date <- "g"

rrblrs <- rbind(ndvi082416.4.4.rs, ndvi081716.4.4.rs)
rrblrs <- rbind(rrblrs, ndvi072716.4.4.rs)
rrblrs <- rbind(rrblrs, ndvi062916.4.4.rs)
rrblrs <- rbind(rrblrs, ndvi062316.4.4.rs)
rrblrs <- rbind(rrblrs, ndvi052616.4.4.rs)
rrblrs <- rbind(rrblrs, ndvi050316.4.4.rs)




rrblrsp <- ggplot(rrblrs, aes(x = Date, y = NDVI)) + geom_violin(aes(fill = Date))
rrblrsp <- rrblrsp + scale_fill_brewer(palette="BrBG", labels = c("May 3", "May 26", "June 23", "June 26", "July 27", "Aug 17", "Aug 24"))
rrblrsp <- rrblrsp + xlab("") + theme_bw()+ theme(axis.text.x = element_blank()) + theme(plot.title = element_text(hjust = 0.5))
rrblrsp <- rrblrsp + stat_summary(fun.data=mean_sdl, mult=1, geom="pointrange", color="#bf812d")
rrblrsp <- rrblrsp + labs(title = "Rush Ranch Block 1, Section 4.4\n2016 NDVI Values")
rrblrsp
ggsave(file = "rrblrsp2016violin.4.4.png")

rrblrsp <- ggplot(rrblrs, aes(x = Date, y = NDVI)) + geom_boxplot(aes(fill = Date))
rrblrsp <- rrblrsp + scale_fill_brewer(palette="BrBG", labels = c("May 3", "May 26", "June 23", "June 26", "July 27", "Aug 17", "Aug 24"))
rrblrsp <- rrblrsp + xlab("") + theme_bw() + theme(axis.text.x = element_blank()) + theme(plot.title = element_text(hjust = 0.5))
rrblrsp <- rrblrsp + labs(title = "Rush Ranch Block 1, Section 4.4\n2016 NDVI Values")
rrblrsp
ggsave(file = "rrblrsp2016box.4.4.png")


################################################################


ndvi050316.5.4 <- crop(ndvi050316, extent(ndvi050316, 320, 399, 601, 800))
ndvi052616.5.4 <- crop(ndvi052616, extent(ndvi052616, 320, 399, 601, 800))
ndvi062316.5.4 <- crop(ndvi062316, extent(ndvi062316, 320, 399, 601, 800))
ndvi062916.5.4 <- crop(ndvi062916, extent(ndvi062916, 320, 399, 601, 800))
ndvi072716.5.4 <- crop(ndvi072716, extent(ndvi072716, 320, 399, 601, 800))
ndvi081716.5.4 <- crop(ndvi081716, extent(ndvi081716, 320, 399, 601, 800))
ndvi082416.5.4 <- crop(ndvi082416, extent(ndvi082416, 320, 399, 601, 800))



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
image(ndvi082416.5.4)

ndvi050316.5.4.st <- stack(ndvi050316.5.4)
ndvi052616.5.4.st <- stack(ndvi052616.5.4)
ndvi062316.5.4.st <- stack(ndvi062316.5.4)
ndvi062916.5.4.st <- stack(ndvi062916.5.4)
ndvi072716.5.4.st <- stack(ndvi072716.5.4)
ndvi081716.5.4.st <- stack(ndvi081716.5.4)
ndvi082416.5.4.st <- stack(ndvi082416.5.4)

ndvi050316.5.4.df <- as.data.frame(ndvi050316.5.4.st);colnames(ndvi050316.5.4.df) <- "NDVI"; ndvi050316.5.4.df$observation <- 1:nrow(ndvi050316.5.4.df)

ndvi052616.5.4.df <- as.data.frame(ndvi052616.5.4.st);colnames(ndvi052616.5.4.df) <- "NDVI"; ndvi052616.5.4.df$observation <- 1:nrow(ndvi052616.5.4.df)

ndvi062316.5.4.df <- as.data.frame(ndvi062316.5.4.st); colnames(ndvi062316.5.4.df) <- "NDVI"; ndvi062316.5.4.df$observation <- 1:nrow(ndvi062316.5.4.df)

ndvi062916.5.4.df <- as.data.frame(ndvi062916.5.4.st); colnames(ndvi062916.5.4.df) <- "NDVI"; ndvi062916.5.4.df$observation <- 1:nrow(ndvi062916.5.4.df)

ndvi072716.5.4.df <- as.data.frame(ndvi072716.5.4.st); colnames(ndvi072716.5.4.df) <- "NDVI"; ndvi072716.5.4.df$observation <- 1:nrow(ndvi072716.5.4.df)

ndvi081716.5.4.df <- as.data.frame(ndvi081716.5.4.st); colnames(ndvi081716.5.4.df) <- "NDVI"; ndvi081716.5.4.df$observation <- 1:nrow(ndvi081716.5.4.df)

ndvi082416.5.4.df <- as.data.frame(ndvi082416.5.4.st);colnames(ndvi082416.5.4.df) <- "NDVI"; ndvi082416.5.4.df$observation <- 1:nrow(ndvi082416.5.4.df)


ndvi050316.5.4.st.av <- cellStats(ndvi050316.5.4.st, mean)
ndvi050316.5.4.st.md <- cellStats(ndvi050316.5.4.st, median)
ndvi050316.5.4.st.mx <- cellStats(ndvi050316.5.4.st, max)
ndvi050316.5.4.st.mn <- cellStats(ndvi050316.5.4.st, min)
ndvi050316.5.4.st.sd <- sd(ndvi050316.5.4.df$NDVI, na.rm = TRUE)

ndvi052616.5.4.st.av <- cellStats(ndvi052616.5.4.st, mean)
ndvi052616.5.4.st.md <- cellStats(ndvi052616.5.4.st, median)
ndvi052616.5.4.st.mx <- cellStats(ndvi052616.5.4.st, max)
ndvi052616.5.4.st.mn <- cellStats(ndvi052616.5.4.st, min)
ndvi052616.5.4.st.sd <- sd(ndvi052616.5.4.df$NDVI, na.rm = TRUE)

ndvi062316.5.4.st.av <- cellStats(ndvi062316, mean)
ndvi062316.5.4.st.md <- cellStats(ndvi062316, median)
ndvi062316.5.4.st.mx <- cellStats(ndvi062316.5.4.st, max)
ndvi062316.5.4.st.mn <- cellStats(ndvi062316.5.4.st, min)
ndvi062316.5.4.st.sd <- sd(ndvi062316.5.4.df$NDVI, na.rm = TRUE)

ndvi062916.5.4.st.av <- cellStats(ndvi062916.5.4.st, mean)
ndvi062916.5.4.st.md <- cellStats(ndvi062916.5.4.st, median)
ndvi062916.5.4.st.mx <- cellStats(ndvi062916.5.4.st, max)
ndvi062916.5.4.st.mn <- cellStats(ndvi062916.5.4.st, min)
ndvi062916.5.4.st.sd <- sd(ndvi062916.5.4.df$NDVI, na.rm = TRUE)

ndvi072716.5.4.st.av <- cellStats(ndvi072716.5.4.st, mean)
ndvi072716.5.4.st.md <- cellStats(ndvi072716.5.4.st, median)
ndvi072716.5.4.st.mx <- cellStats(ndvi072716.5.4.st, max)
ndvi072716.5.4.st.mn <- cellStats(ndvi072716.5.4.st, min)
ndvi072716.5.4.st.sd <- sd(ndvi072716.5.4.df$NDVI, na.rm = TRUE)

ndvi081716.5.4.st.av <- cellStats(ndvi081716.5.4.st, mean)
ndvi081716.5.4.st.md <- cellStats(ndvi081716.5.4.st, median)
ndvi081716.5.4.st.mx <- cellStats(ndvi081716.5.4.st, max)
ndvi081716.5.4.st.mn <- cellStats(ndvi081716.5.4.st, min)
ndvi081716.5.4.st.sd <- sd(ndvi081716.5.4.df$NDVI, na.rm = TRUE)

ndvi082416.5.4.st.av <- cellStats(ndvi082416.5.4.st, mean)
ndvi082416.5.4.st.md <- cellStats(ndvi082416.5.4.st, median)
ndvi082416.5.4.st.mx <- cellStats(ndvi082416.5.4.st, max)
ndvi082416.5.4.st.mn <- cellStats(ndvi082416.5.4.st, min)
ndvi082416.5.4.st.sd <- sd(ndvi082416.5.4.df$NDVI, na.rm = TRUE)

ndviav <- data.frame(Average = c(ndvi050316.5.4.st.av, ndvi052616.5.4.st.av, ndvi062316.5.4.st.av, ndvi062916.5.4.st.av,
                                 ndvi072716.5.4.st.av, ndvi081716.5.4.st.av, ndvi082416.5.4.st.av))

ndvimd <- data.frame(Median = c(ndvi050316.5.4.st.md, ndvi052616.5.4.st.md, ndvi062316.5.4.st.md, ndvi062916.5.4.st.md,
                                ndvi072716.5.4.st.md, ndvi081716.5.4.st.md, ndvi082416.5.4.st.md))

ndvisd <- data.frame(StandardDeviation = c(ndvi050316.5.4.st.sd, ndvi052616.5.4.st.sd, ndvi062316.5.4.st.sd, ndvi062916.5.4.st.sd,
                                           ndvi072716.5.4.st.sd, ndvi081716.5.4.st.sd, ndvi082416.5.4.st.sd))

ndvimx <- data.frame(Maximum = c(ndvi050316.5.4.st.mx, ndvi052616.5.4.st.mx, ndvi062316.5.4.st.mx, ndvi062916.5.4.st.mx,
                                 ndvi072716.5.4.st.mx, ndvi081716.5.4.st.mx, ndvi082416.5.4.st.mx))

ndvimn <- data.frame(Minimum = c(ndvi050316.5.4.st.mn, ndvi052616.5.4.st.mn, ndvi062316.5.4.st.mn, ndvi062916.5.4.st.mn,
                                 ndvi072716.5.4.st.mn, ndvi081716.5.4.st.mn, ndvi082416.5.4.st.mn))


rrbldf <- cbind(dt, ndviav)
rrbldf <- cbind(rrbldf, ndvimd)
rrbldf <- cbind(rrbldf, ndvisd)
rrbldf <- cbind(rrbldf, ndvimx)
rrbldf <- cbind(rrbldf, ndvimn)
write.csv(rrbldf, "RushRanchBlk1_2016.4.5.csv")

options(device = "RStudioGD")
ndvi050316.5.4.us <- unstack(ndvi050316.5.4.df); colnames(ndvi050316.5.4.us) <- "NDVI"
ndvi052616.5.4.us <- unstack(ndvi052616.5.4.df); colnames(ndvi052616.5.4.us) <- "NDVI"
ndvi062316.5.4.us <- unstack(ndvi062316.5.4.df); colnames(ndvi062316.5.4.us) <- "NDVI"
ndvi062916.5.4.us <- unstack(ndvi062916.5.4.df); colnames(ndvi062916.5.4.us) <- "NDVI"
ndvi072716.5.4.us <- unstack(ndvi072716.5.4.df); colnames(ndvi072716.5.4.us) <- "NDVI"
ndvi081716.5.4.us <- unstack(ndvi081716.5.4.df); colnames(ndvi081716.5.4.us) <- "NDVI"
ndvi082416.5.4.us <- unstack(ndvi082416.5.4.df); colnames(ndvi082416.5.4.us) <- "NDVI"

ndvi050316.5.4.p <- ggplot(ndvi050316.5.4.us, aes(ndvi050316.5.4.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi050316.5.4.p <- ndvi050316.5.4.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi050316.5.4.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi050316.5.4.p <- ndvi050316.5.4.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi050316.5.4.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi050316.5.4.p <- ndvi050316.5.4.p + labs(title = "Rush Ranch Block 1, Section 4.5\nMay 3, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi050316.5.4.p
ggsave(file = "050316.4.5.png")

ndvi052616.5.4.p <- ggplot(ndvi052616.5.4.us, aes(ndvi052616.5.4.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi052616.5.4.p <- ndvi052616.5.4.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi052616.5.4.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi052616.5.4.p <- ndvi052616.5.4.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi052616.5.4.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi052616.5.4.p <- ndvi052616.5.4.p + labs(title = "Rush Ranch Block 1, Section 4.5\nMay 26, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi052616.5.4.p
ggsave(file = "052616.4.5.png")

ndvi062316.5.4.p <- ggplot(ndvi062316.5.4.us, aes(ndvi062316.5.4.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi062316.5.4.p <- ndvi062316.5.4.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi062316.5.4.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi062316.5.4.p <- ndvi062316.5.4.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi062316.5.4.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi062316.5.4.p <- ndvi062316.5.4.p + labs(title = "Rush Ranch Block 1, Section 4.5\nJune 23, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi062316.5.4.p
ggsave(file = "062316.4.5.png")

ndvi062916.5.4.p <- ggplot(ndvi062916.5.4.us, aes(ndvi062916.5.4.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi062916.5.4.p <- ndvi062916.5.4.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi062916.5.4.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi062916.5.4.p <- ndvi062916.5.4.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi062916.5.4.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi062916.5.4.p <- ndvi062916.5.4.p + labs(title = "Rush Ranch Block 1, Section 4.5\nJune 29, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi062916.5.4.p
ggsave(file = "062916.4.5.png")

ndvi072716.5.4.p <- ggplot(ndvi072716.5.4.us, aes(ndvi072716.5.4.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi072716.5.4.p <- ndvi072716.5.4.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi072716.5.4.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi072716.5.4.p <- ndvi072716.5.4.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi072716.5.4.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi072716.5.4.p <- ndvi072716.5.4.p + labs(title = "Rush Ranch Block 1, Section 4.5\nJuly 27, 2016 NDVI Values Histogram\n with mean &median", x = "")
ndvi072716.5.4.p
ggsave(file = "072716.4.5.png")

ndvi081716.5.4.p <- ggplot(ndvi081716.5.4.us, aes(ndvi081716.5.4.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi081716.5.4.p <- ndvi081716.5.4.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi081716.5.4.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi081716.5.4.p <- ndvi081716.5.4.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi081716.5.4.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi081716.5.4.p <- ndvi081716.5.4.p + labs(title = "Rush Ranch Block 1, Section 4.5\nAugust 17, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi081716.5.4.p
ggsave(file = "081716.4.5.png")

ndvi082416.5.4.p <- ggplot(ndvi082416.5.4.us, aes(ndvi082416.5.4.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi082416.5.4.p <- ndvi082416.5.4.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi082416.5.4.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi082416.5.4.p <- ndvi082416.5.4.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi082416.5.4.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi082416.5.4.p <- ndvi082416.5.4.p + labs(title = "Rush Ranch Block 1, Section 4.5\nAugust 24, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi082416.5.4.p
ggsave(file = "082416.4.5.png")

set.seed(131)
ndvi050316.5.4.us <- na.omit(ndvi050316.5.4.us); ndvi050316.5.4.rs <- sample_n(ndvi050316.5.4.us, 15000); ndvi050316.5.4.rs$Date <- "a"
ndvi052616.5.4.us <- na.omit(ndvi052616.5.4.us); ndvi052616.5.4.rs <- sample_n(ndvi052616.5.4.us, 15000); ndvi052616.5.4.rs$Date <- "b"
ndvi062316.5.4.us <- na.omit(ndvi062316.5.4.us); ndvi062316.5.4.rs <- sample_n(ndvi062316.5.4.us, 15000); ndvi062316.5.4.rs$Date <- "c"
ndvi062916.5.4.us <- na.omit(ndvi062916.5.4.us); ndvi062916.5.4.rs <- sample_n(ndvi062916.5.4.us, 15000); ndvi062916.5.4.rs$Date <- "d"
ndvi072716.5.4.us <- na.omit(ndvi072716.5.4.us); ndvi072716.5.4.rs <- sample_n(ndvi072716.5.4.us, 15000); ndvi072716.5.4.rs$Date <- "e"
ndvi081716.5.4.us <- na.omit(ndvi081716.5.4.us); ndvi081716.5.4.rs <- sample_n(ndvi081716.5.4.us, 15000); ndvi081716.5.4.rs$Date <- "f"
ndvi082416.5.4.us <- na.omit(ndvi082416.5.4.us); ndvi082416.5.4.rs <- sample_n(ndvi082416.5.4.us, 15000); ndvi082416.5.4.rs$Date <- "g"

rrblrs <- rbind(ndvi082416.5.4.rs, ndvi081716.5.4.rs)
rrblrs <- rbind(rrblrs, ndvi072716.5.4.rs)
rrblrs <- rbind(rrblrs, ndvi062916.5.4.rs)
rrblrs <- rbind(rrblrs, ndvi062316.5.4.rs)
rrblrs <- rbind(rrblrs, ndvi052616.5.4.rs)
rrblrs <- rbind(rrblrs, ndvi050316.5.4.rs)




rrblrsp <- ggplot(rrblrs, aes(x = Date, y = NDVI)) + geom_violin(aes(fill = Date))
rrblrsp <- rrblrsp + scale_fill_brewer(palette="BrBG", labels = c("May 3", "May 26", "June 23", "June 26", "July 27", "Aug 17", "Aug 24"))
rrblrsp <- rrblrsp + xlab("") + theme_bw()+ theme(axis.text.x = element_blank()) + theme(plot.title = element_text(hjust = 0.5))
rrblrsp <- rrblrsp + stat_summary(fun.data=mean_sdl, mult=1, geom="pointrange", color="#bf812d")
rrblrsp <- rrblrsp + labs(title = "Rush Ranch Block 1, Section 4.5\n2016 NDVI Values")
rrblrsp
ggsave(file = "rrblrsp2016violin.4.5.png")

rrblrsp <- ggplot(rrblrs, aes(x = Date, y = NDVI)) + geom_boxplot(aes(fill = Date))
rrblrsp <- rrblrsp + scale_fill_brewer(palette="BrBG", labels = c("May 3", "May 26", "June 23", "June 26", "July 27", "Aug 17", "Aug 24"))
rrblrsp <- rrblrsp + xlab("") + theme_bw() + theme(axis.text.x = element_blank()) + theme(plot.title = element_text(hjust = 0.5))
rrblrsp <- rrblrsp + labs(title = "Rush Ranch Block 1, Section 4.5\n2016 NDVI Values")
rrblrsp
ggsave(file = "rrblrsp2016box.4.5.png")

###########################################################################

ndvi050316.6.3 <- crop(ndvi050316, extent(ndvi050316, 400, 479, 601, 800))
ndvi052616.6.3 <- crop(ndvi052616, extent(ndvi052616, 400, 479, 601, 800))
ndvi062316.6.3 <- crop(ndvi062316, extent(ndvi062316, 400, 479, 601, 800))
ndvi062916.6.3 <- crop(ndvi062916, extent(ndvi062916, 400, 479, 601, 800))
ndvi072716.6.3 <- crop(ndvi072716, extent(ndvi072716, 400, 479, 601, 800))
ndvi081716.6.3 <- crop(ndvi081716, extent(ndvi081716, 400, 479, 601, 800))
ndvi082416.6.3 <- crop(ndvi082416, extent(ndvi082416, 400, 479, 601, 800))



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
image(ndvi082416.6.3)

ndvi050316.6.3.st <- stack(ndvi050316.6.3)
ndvi052616.6.3.st <- stack(ndvi052616.6.3)
ndvi062316.6.3.st <- stack(ndvi062316.6.3)
ndvi062916.6.3.st <- stack(ndvi062916.6.3)
ndvi072716.6.3.st <- stack(ndvi072716.6.3)
ndvi081716.6.3.st <- stack(ndvi081716.6.3)
ndvi082416.6.3.st <- stack(ndvi082416.6.3)

ndvi050316.6.3.df <- as.data.frame(ndvi050316.6.3.st);colnames(ndvi050316.6.3.df) <- "NDVI"; ndvi050316.6.3.df$observation <- 1:nrow(ndvi050316.6.3.df)

ndvi052616.6.3.df <- as.data.frame(ndvi052616.6.3.st);colnames(ndvi052616.6.3.df) <- "NDVI"; ndvi052616.6.3.df$observation <- 1:nrow(ndvi052616.6.3.df)

ndvi062316.6.3.df <- as.data.frame(ndvi062316.6.3.st); colnames(ndvi062316.6.3.df) <- "NDVI"; ndvi062316.6.3.df$observation <- 1:nrow(ndvi062316.6.3.df)

ndvi062916.6.3.df <- as.data.frame(ndvi062916.6.3.st); colnames(ndvi062916.6.3.df) <- "NDVI"; ndvi062916.6.3.df$observation <- 1:nrow(ndvi062916.6.3.df)

ndvi072716.6.3.df <- as.data.frame(ndvi072716.6.3.st); colnames(ndvi072716.6.3.df) <- "NDVI"; ndvi072716.6.3.df$observation <- 1:nrow(ndvi072716.6.3.df)

ndvi081716.6.3.df <- as.data.frame(ndvi081716.6.3.st); colnames(ndvi081716.6.3.df) <- "NDVI"; ndvi081716.6.3.df$observation <- 1:nrow(ndvi081716.6.3.df)

ndvi082416.6.3.df <- as.data.frame(ndvi082416.6.3.st);colnames(ndvi082416.6.3.df) <- "NDVI"; ndvi082416.6.3.df$observation <- 1:nrow(ndvi082416.6.3.df)


ndvi050316.6.3.st.av <- cellStats(ndvi050316.6.3.st, mean)
ndvi050316.6.3.st.md <- cellStats(ndvi050316.6.3.st, median)
ndvi050316.6.3.st.mx <- cellStats(ndvi050316.6.3.st, max)
ndvi050316.6.3.st.mn <- cellStats(ndvi050316.6.3.st, min)
ndvi050316.6.3.st.sd <- sd(ndvi050316.6.3.df$NDVI, na.rm = TRUE)

ndvi052616.6.3.st.av <- cellStats(ndvi052616.6.3.st, mean)
ndvi052616.6.3.st.md <- cellStats(ndvi052616.6.3.st, median)
ndvi052616.6.3.st.mx <- cellStats(ndvi052616.6.3.st, max)
ndvi052616.6.3.st.mn <- cellStats(ndvi052616.6.3.st, min)
ndvi052616.6.3.st.sd <- sd(ndvi052616.6.3.df$NDVI, na.rm = TRUE)

ndvi062316.6.3.st.av <- cellStats(ndvi062316, mean)
ndvi062316.6.3.st.md <- cellStats(ndvi062316, median)
ndvi062316.6.3.st.mx <- cellStats(ndvi062316.6.3.st, max)
ndvi062316.6.3.st.mn <- cellStats(ndvi062316.6.3.st, min)
ndvi062316.6.3.st.sd <- sd(ndvi062316.6.3.df$NDVI, na.rm = TRUE)

ndvi062916.6.3.st.av <- cellStats(ndvi062916.6.3.st, mean)
ndvi062916.6.3.st.md <- cellStats(ndvi062916.6.3.st, median)
ndvi062916.6.3.st.mx <- cellStats(ndvi062916.6.3.st, max)
ndvi062916.6.3.st.mn <- cellStats(ndvi062916.6.3.st, min)
ndvi062916.6.3.st.sd <- sd(ndvi062916.6.3.df$NDVI, na.rm = TRUE)

ndvi072716.6.3.st.av <- cellStats(ndvi072716.6.3.st, mean)
ndvi072716.6.3.st.md <- cellStats(ndvi072716.6.3.st, median)
ndvi072716.6.3.st.mx <- cellStats(ndvi072716.6.3.st, max)
ndvi072716.6.3.st.mn <- cellStats(ndvi072716.6.3.st, min)
ndvi072716.6.3.st.sd <- sd(ndvi072716.6.3.df$NDVI, na.rm = TRUE)

ndvi081716.6.3.st.av <- cellStats(ndvi081716.6.3.st, mean)
ndvi081716.6.3.st.md <- cellStats(ndvi081716.6.3.st, median)
ndvi081716.6.3.st.mx <- cellStats(ndvi081716.6.3.st, max)
ndvi081716.6.3.st.mn <- cellStats(ndvi081716.6.3.st, min)
ndvi081716.6.3.st.sd <- sd(ndvi081716.6.3.df$NDVI, na.rm = TRUE)

ndvi082416.6.3.st.av <- cellStats(ndvi082416.6.3.st, mean)
ndvi082416.6.3.st.md <- cellStats(ndvi082416.6.3.st, median)
ndvi082416.6.3.st.mx <- cellStats(ndvi082416.6.3.st, max)
ndvi082416.6.3.st.mn <- cellStats(ndvi082416.6.3.st, min)
ndvi082416.6.3.st.sd <- sd(ndvi082416.6.3.df$NDVI, na.rm = TRUE)

ndviav <- data.frame(Average = c(ndvi050316.6.3.st.av, ndvi052616.6.3.st.av, ndvi062316.6.3.st.av, ndvi062916.6.3.st.av,
                                 ndvi072716.6.3.st.av, ndvi081716.6.3.st.av, ndvi082416.6.3.st.av))

ndvimd <- data.frame(Median = c(ndvi050316.6.3.st.md, ndvi052616.6.3.st.md, ndvi062316.6.3.st.md, ndvi062916.6.3.st.md,
                                ndvi072716.6.3.st.md, ndvi081716.6.3.st.md, ndvi082416.6.3.st.md))

ndvisd <- data.frame(StandardDeviation = c(ndvi050316.6.3.st.sd, ndvi052616.6.3.st.sd, ndvi062316.6.3.st.sd, ndvi062916.6.3.st.sd,
                                           ndvi072716.6.3.st.sd, ndvi081716.6.3.st.sd, ndvi082416.6.3.st.sd))

ndvimx <- data.frame(Maximum = c(ndvi050316.6.3.st.mx, ndvi052616.6.3.st.mx, ndvi062316.6.3.st.mx, ndvi062916.6.3.st.mx,
                                 ndvi072716.6.3.st.mx, ndvi081716.6.3.st.mx, ndvi082416.6.3.st.mx))

ndvimn <- data.frame(Minimum = c(ndvi050316.6.3.st.mn, ndvi052616.6.3.st.mn, ndvi062316.6.3.st.mn, ndvi062916.6.3.st.mn,
                                 ndvi072716.6.3.st.mn, ndvi081716.6.3.st.mn, ndvi082416.6.3.st.mn))


rrbldf <- cbind(dt, ndviav)
rrbldf <- cbind(rrbldf, ndvimd)
rrbldf <- cbind(rrbldf, ndvisd)
rrbldf <- cbind(rrbldf, ndvimx)
rrbldf <- cbind(rrbldf, ndvimn)
write.csv(rrbldf, "RushRanchBlk1_2016.3.6.csv")

options(device = "RStudioGD")
ndvi050316.6.3.us <- unstack(ndvi050316.6.3.df); colnames(ndvi050316.6.3.us) <- "NDVI"
ndvi052616.6.3.us <- unstack(ndvi052616.6.3.df); colnames(ndvi052616.6.3.us) <- "NDVI"
ndvi062316.6.3.us <- unstack(ndvi062316.6.3.df); colnames(ndvi062316.6.3.us) <- "NDVI"
ndvi062916.6.3.us <- unstack(ndvi062916.6.3.df); colnames(ndvi062916.6.3.us) <- "NDVI"
ndvi072716.6.3.us <- unstack(ndvi072716.6.3.df); colnames(ndvi072716.6.3.us) <- "NDVI"
ndvi081716.6.3.us <- unstack(ndvi081716.6.3.df); colnames(ndvi081716.6.3.us) <- "NDVI"
ndvi082416.6.3.us <- unstack(ndvi082416.6.3.df); colnames(ndvi082416.6.3.us) <- "NDVI"

ndvi050316.6.3.p <- ggplot(ndvi050316.6.3.us, aes(ndvi050316.6.3.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi050316.6.3.p <- ndvi050316.6.3.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi050316.6.3.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi050316.6.3.p <- ndvi050316.6.3.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi050316.6.3.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi050316.6.3.p <- ndvi050316.6.3.p + labs(title = "Rush Ranch Block 1, Section 3.6\nMay 3, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi050316.6.3.p
ggsave(file = "050316.3.6.png")

ndvi052616.6.3.p <- ggplot(ndvi052616.6.3.us, aes(ndvi052616.6.3.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi052616.6.3.p <- ndvi052616.6.3.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi052616.6.3.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi052616.6.3.p <- ndvi052616.6.3.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi052616.6.3.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi052616.6.3.p <- ndvi052616.6.3.p + labs(title = "Rush Ranch Block 1, Section 3.6\nMay 26, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi052616.6.3.p
ggsave(file = "052616.3.6.png")

ndvi062316.6.3.p <- ggplot(ndvi062316.6.3.us, aes(ndvi062316.6.3.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi062316.6.3.p <- ndvi062316.6.3.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi062316.6.3.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi062316.6.3.p <- ndvi062316.6.3.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi062316.6.3.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi062316.6.3.p <- ndvi062316.6.3.p + labs(title = "Rush Ranch Block 1, Section 3.6\nJune 23, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi062316.6.3.p
ggsave(file = "062316.3.6.png")

ndvi062916.6.3.p <- ggplot(ndvi062916.6.3.us, aes(ndvi062916.6.3.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi062916.6.3.p <- ndvi062916.6.3.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi062916.6.3.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi062916.6.3.p <- ndvi062916.6.3.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi062916.6.3.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi062916.6.3.p <- ndvi062916.6.3.p + labs(title = "Rush Ranch Block 1, Section 3.6\nJune 29, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi062916.6.3.p
ggsave(file = "062916.3.6.png")

ndvi072716.6.3.p <- ggplot(ndvi072716.6.3.us, aes(ndvi072716.6.3.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi072716.6.3.p <- ndvi072716.6.3.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi072716.6.3.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi072716.6.3.p <- ndvi072716.6.3.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi072716.6.3.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi072716.6.3.p <- ndvi072716.6.3.p + labs(title = "Rush Ranch Block 1, Section 3.6\nJuly 27, 2016 NDVI Values Histogram\n with mean &median", x = "")
ndvi072716.6.3.p
ggsave(file = "072716.3.6.png")

ndvi081716.6.3.p <- ggplot(ndvi081716.6.3.us, aes(ndvi081716.6.3.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi081716.6.3.p <- ndvi081716.6.3.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi081716.6.3.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi081716.6.3.p <- ndvi081716.6.3.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi081716.6.3.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi081716.6.3.p <- ndvi081716.6.3.p + labs(title = "Rush Ranch Block 1, Section 3.6\nAugust 17, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi081716.6.3.p
ggsave(file = "081716.3.6.png")

ndvi082416.6.3.p <- ggplot(ndvi082416.6.3.us, aes(ndvi082416.6.3.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi082416.6.3.p <- ndvi082416.6.3.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi082416.6.3.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi082416.6.3.p <- ndvi082416.6.3.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi082416.6.3.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi082416.6.3.p <- ndvi082416.6.3.p + labs(title = "Rush Ranch Block 1, Section 3.6\nAugust 24, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi082416.6.3.p
ggsave(file = "082416.3.6.png")

set.seed(131)
ndvi050316.6.3.us <- na.omit(ndvi050316.6.3.us); ndvi050316.6.3.rs <- sample_n(ndvi050316.6.3.us, 15000); ndvi050316.6.3.rs$Date <- "a"
ndvi052616.6.3.us <- na.omit(ndvi052616.6.3.us); ndvi052616.6.3.rs <- sample_n(ndvi052616.6.3.us, 15000); ndvi052616.6.3.rs$Date <- "b"
ndvi062316.6.3.us <- na.omit(ndvi062316.6.3.us); ndvi062316.6.3.rs <- sample_n(ndvi062316.6.3.us, 15000); ndvi062316.6.3.rs$Date <- "c"
ndvi062916.6.3.us <- na.omit(ndvi062916.6.3.us); ndvi062916.6.3.rs <- sample_n(ndvi062916.6.3.us, 15000); ndvi062916.6.3.rs$Date <- "d"
ndvi072716.6.3.us <- na.omit(ndvi072716.6.3.us); ndvi072716.6.3.rs <- sample_n(ndvi072716.6.3.us, 15000); ndvi072716.6.3.rs$Date <- "e"
ndvi081716.6.3.us <- na.omit(ndvi081716.6.3.us); ndvi081716.6.3.rs <- sample_n(ndvi081716.6.3.us, 15000); ndvi081716.6.3.rs$Date <- "f"
ndvi082416.6.3.us <- na.omit(ndvi082416.6.3.us); ndvi082416.6.3.rs <- sample_n(ndvi082416.6.3.us, 15000); ndvi082416.6.3.rs$Date <- "g"

rrblrs <- rbind(ndvi082416.6.3.rs, ndvi081716.6.3.rs)
rrblrs <- rbind(rrblrs, ndvi072716.6.3.rs)
rrblrs <- rbind(rrblrs, ndvi062916.6.3.rs)
rrblrs <- rbind(rrblrs, ndvi062316.6.3.rs)
rrblrs <- rbind(rrblrs, ndvi052616.6.3.rs)
rrblrs <- rbind(rrblrs, ndvi050316.6.3.rs)




rrblrsp <- ggplot(rrblrs, aes(x = Date, y = NDVI)) + geom_violin(aes(fill = Date))
rrblrsp <- rrblrsp + scale_fill_brewer(palette="BrBG", labels = c("May 3", "May 26", "June 23", "June 26", "July 27", "Aug 17", "Aug 24"))
rrblrsp <- rrblrsp + xlab("") + theme_bw()+ theme(axis.text.x = element_blank()) + theme(plot.title = element_text(hjust = 0.5))
rrblrsp <- rrblrsp + stat_summary(fun.data=mean_sdl, mult=1, geom="pointrange", color="#bf812d")
rrblrsp <- rrblrsp + labs(title = "Rush Ranch Block 1, Section 3.6\n2016 NDVI Values")
rrblrsp
ggsave(file = "rrblrsp2016violin.3.6.png")

rrblrsp <- ggplot(rrblrs, aes(x = Date, y = NDVI)) + geom_boxplot(aes(fill = Date))
rrblrsp <- rrblrsp + scale_fill_brewer(palette="BrBG", labels = c("May 3", "May 26", "June 23", "June 26", "July 27", "Aug 17", "Aug 24"))
rrblrsp <- rrblrsp + xlab("") + theme_bw() + theme(axis.text.x = element_blank()) + theme(plot.title = element_text(hjust = 0.5))
rrblrsp <- rrblrsp + labs(title = "Rush Ranch Block 1, Section 3.6\n2016 NDVI Values")
rrblrsp
ggsave(file = "rrblrsp2016box.3.6.png")

##########################################################################

ndvi050316.7.3 <- crop(ndvi050316, extent(ndvi050316, 480, 559, 601, 800))
ndvi052616.7.3 <- crop(ndvi052616, extent(ndvi052616, 480, 559, 601, 800))
ndvi062316.7.3 <- crop(ndvi062316, extent(ndvi062316, 480, 559, 601, 800))
ndvi062916.7.3 <- crop(ndvi062916, extent(ndvi062916, 480, 559, 601, 800))
ndvi072716.7.3 <- crop(ndvi072716, extent(ndvi072716, 480, 559, 601, 800))
ndvi081716.7.3 <- crop(ndvi081716, extent(ndvi081716, 480, 559, 601, 800))
ndvi082416.7.3 <- crop(ndvi082416, extent(ndvi082416, 480, 559, 601, 800))



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
image(ndvi082416.7.3)

ndvi050316.7.3.st <- stack(ndvi050316.7.3)
ndvi052616.7.3.st <- stack(ndvi052616.7.3)
ndvi062316.7.3.st <- stack(ndvi062316.7.3)
ndvi062916.7.3.st <- stack(ndvi062916.7.3)
ndvi072716.7.3.st <- stack(ndvi072716.7.3)
ndvi081716.7.3.st <- stack(ndvi081716.7.3)
ndvi082416.7.3.st <- stack(ndvi082416.7.3)

ndvi050316.7.3.df <- as.data.frame(ndvi050316.7.3.st);colnames(ndvi050316.7.3.df) <- "NDVI"; ndvi050316.7.3.df$observation <- 1:nrow(ndvi050316.7.3.df)

ndvi052616.7.3.df <- as.data.frame(ndvi052616.7.3.st);colnames(ndvi052616.7.3.df) <- "NDVI"; ndvi052616.7.3.df$observation <- 1:nrow(ndvi052616.7.3.df)

ndvi062316.7.3.df <- as.data.frame(ndvi062316.7.3.st); colnames(ndvi062316.7.3.df) <- "NDVI"; ndvi062316.7.3.df$observation <- 1:nrow(ndvi062316.7.3.df)

ndvi062916.7.3.df <- as.data.frame(ndvi062916.7.3.st); colnames(ndvi062916.7.3.df) <- "NDVI"; ndvi062916.7.3.df$observation <- 1:nrow(ndvi062916.7.3.df)

ndvi072716.7.3.df <- as.data.frame(ndvi072716.7.3.st); colnames(ndvi072716.7.3.df) <- "NDVI"; ndvi072716.7.3.df$observation <- 1:nrow(ndvi072716.7.3.df)

ndvi081716.7.3.df <- as.data.frame(ndvi081716.7.3.st); colnames(ndvi081716.7.3.df) <- "NDVI"; ndvi081716.7.3.df$observation <- 1:nrow(ndvi081716.7.3.df)

ndvi082416.7.3.df <- as.data.frame(ndvi082416.7.3.st);colnames(ndvi082416.7.3.df) <- "NDVI"; ndvi082416.7.3.df$observation <- 1:nrow(ndvi082416.7.3.df)


ndvi050316.7.3.st.av <- cellStats(ndvi050316.7.3.st, mean)
ndvi050316.7.3.st.md <- cellStats(ndvi050316.7.3.st, median)
ndvi050316.7.3.st.mx <- cellStats(ndvi050316.7.3.st, max)
ndvi050316.7.3.st.mn <- cellStats(ndvi050316.7.3.st, min)
ndvi050316.7.3.st.sd <- sd(ndvi050316.7.3.df$NDVI, na.rm = TRUE)

ndvi052616.7.3.st.av <- cellStats(ndvi052616.7.3.st, mean)
ndvi052616.7.3.st.md <- cellStats(ndvi052616.7.3.st, median)
ndvi052616.7.3.st.mx <- cellStats(ndvi052616.7.3.st, max)
ndvi052616.7.3.st.mn <- cellStats(ndvi052616.7.3.st, min)
ndvi052616.7.3.st.sd <- sd(ndvi052616.7.3.df$NDVI, na.rm = TRUE)

ndvi062316.7.3.st.av <- cellStats(ndvi062316, mean)
ndvi062316.7.3.st.md <- cellStats(ndvi062316, median)
ndvi062316.7.3.st.mx <- cellStats(ndvi062316.7.3.st, max)
ndvi062316.7.3.st.mn <- cellStats(ndvi062316.7.3.st, min)
ndvi062316.7.3.st.sd <- sd(ndvi062316.7.3.df$NDVI, na.rm = TRUE)

ndvi062916.7.3.st.av <- cellStats(ndvi062916.7.3.st, mean)
ndvi062916.7.3.st.md <- cellStats(ndvi062916.7.3.st, median)
ndvi062916.7.3.st.mx <- cellStats(ndvi062916.7.3.st, max)
ndvi062916.7.3.st.mn <- cellStats(ndvi062916.7.3.st, min)
ndvi062916.7.3.st.sd <- sd(ndvi062916.7.3.df$NDVI, na.rm = TRUE)

ndvi072716.7.3.st.av <- cellStats(ndvi072716.7.3.st, mean)
ndvi072716.7.3.st.md <- cellStats(ndvi072716.7.3.st, median)
ndvi072716.7.3.st.mx <- cellStats(ndvi072716.7.3.st, max)
ndvi072716.7.3.st.mn <- cellStats(ndvi072716.7.3.st, min)
ndvi072716.7.3.st.sd <- sd(ndvi072716.7.3.df$NDVI, na.rm = TRUE)

ndvi081716.7.3.st.av <- cellStats(ndvi081716.7.3.st, mean)
ndvi081716.7.3.st.md <- cellStats(ndvi081716.7.3.st, median)
ndvi081716.7.3.st.mx <- cellStats(ndvi081716.7.3.st, max)
ndvi081716.7.3.st.mn <- cellStats(ndvi081716.7.3.st, min)
ndvi081716.7.3.st.sd <- sd(ndvi081716.7.3.df$NDVI, na.rm = TRUE)

ndvi082416.7.3.st.av <- cellStats(ndvi082416.7.3.st, mean)
ndvi082416.7.3.st.md <- cellStats(ndvi082416.7.3.st, median)
ndvi082416.7.3.st.mx <- cellStats(ndvi082416.7.3.st, max)
ndvi082416.7.3.st.mn <- cellStats(ndvi082416.7.3.st, min)
ndvi082416.7.3.st.sd <- sd(ndvi082416.7.3.df$NDVI, na.rm = TRUE)

ndviav <- data.frame(Average = c(ndvi050316.7.3.st.av, ndvi052616.7.3.st.av, ndvi062316.7.3.st.av, ndvi062916.7.3.st.av,
                                 ndvi072716.7.3.st.av, ndvi081716.7.3.st.av, ndvi082416.7.3.st.av))

ndvimd <- data.frame(Median = c(ndvi050316.7.3.st.md, ndvi052616.7.3.st.md, ndvi062316.7.3.st.md, ndvi062916.7.3.st.md,
                                ndvi072716.7.3.st.md, ndvi081716.7.3.st.md, ndvi082416.7.3.st.md))

ndvisd <- data.frame(StandardDeviation = c(ndvi050316.7.3.st.sd, ndvi052616.7.3.st.sd, ndvi062316.7.3.st.sd, ndvi062916.7.3.st.sd,
                                           ndvi072716.7.3.st.sd, ndvi081716.7.3.st.sd, ndvi082416.7.3.st.sd))

ndvimx <- data.frame(Maximum = c(ndvi050316.7.3.st.mx, ndvi052616.7.3.st.mx, ndvi062316.7.3.st.mx, ndvi062916.7.3.st.mx,
                                 ndvi072716.7.3.st.mx, ndvi081716.7.3.st.mx, ndvi082416.7.3.st.mx))

ndvimn <- data.frame(Minimum = c(ndvi050316.7.3.st.mn, ndvi052616.7.3.st.mn, ndvi062316.7.3.st.mn, ndvi062916.7.3.st.mn,
                                 ndvi072716.7.3.st.mn, ndvi081716.7.3.st.mn, ndvi082416.7.3.st.mn))


rrbldf <- cbind(dt, ndviav)
rrbldf <- cbind(rrbldf, ndvimd)
rrbldf <- cbind(rrbldf, ndvisd)
rrbldf <- cbind(rrbldf, ndvimx)
rrbldf <- cbind(rrbldf, ndvimn)
write.csv(rrbldf, "RushRanchBlk1_2016.3.7.csv")

options(device = "RStudioGD")
ndvi050316.7.3.us <- unstack(ndvi050316.7.3.df); colnames(ndvi050316.7.3.us) <- "NDVI"
ndvi052616.7.3.us <- unstack(ndvi052616.7.3.df); colnames(ndvi052616.7.3.us) <- "NDVI"
ndvi062316.7.3.us <- unstack(ndvi062316.7.3.df); colnames(ndvi062316.7.3.us) <- "NDVI"
ndvi062916.7.3.us <- unstack(ndvi062916.7.3.df); colnames(ndvi062916.7.3.us) <- "NDVI"
ndvi072716.7.3.us <- unstack(ndvi072716.7.3.df); colnames(ndvi072716.7.3.us) <- "NDVI"
ndvi081716.7.3.us <- unstack(ndvi081716.7.3.df); colnames(ndvi081716.7.3.us) <- "NDVI"
ndvi082416.7.3.us <- unstack(ndvi082416.7.3.df); colnames(ndvi082416.7.3.us) <- "NDVI"

ndvi050316.7.3.p <- ggplot(ndvi050316.7.3.us, aes(ndvi050316.7.3.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi050316.7.3.p <- ndvi050316.7.3.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi050316.7.3.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi050316.7.3.p <- ndvi050316.7.3.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi050316.7.3.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi050316.7.3.p <- ndvi050316.7.3.p + labs(title = "Rush Ranch Block 1, Section 3.7\nMay 3, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi050316.7.3.p
ggsave(file = "050316.3.7.png")

ndvi052616.7.3.p <- ggplot(ndvi052616.7.3.us, aes(ndvi052616.7.3.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi052616.7.3.p <- ndvi052616.7.3.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi052616.7.3.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi052616.7.3.p <- ndvi052616.7.3.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi052616.7.3.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi052616.7.3.p <- ndvi052616.7.3.p + labs(title = "Rush Ranch Block 1, Section 3.7\nMay 26, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi052616.7.3.p
ggsave(file = "052616.3.7.png")

ndvi062316.7.3.p <- ggplot(ndvi062316.7.3.us, aes(ndvi062316.7.3.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi062316.7.3.p <- ndvi062316.7.3.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi062316.7.3.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi062316.7.3.p <- ndvi062316.7.3.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi062316.7.3.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi062316.7.3.p <- ndvi062316.7.3.p + labs(title = "Rush Ranch Block 1, Section 3.7\nJune 23, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi062316.7.3.p
ggsave(file = "062316.3.7.png")

ndvi062916.7.3.p <- ggplot(ndvi062916.7.3.us, aes(ndvi062916.7.3.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi062916.7.3.p <- ndvi062916.7.3.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi062916.7.3.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi062916.7.3.p <- ndvi062916.7.3.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi062916.7.3.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi062916.7.3.p <- ndvi062916.7.3.p + labs(title = "Rush Ranch Block 1, Section 3.7\nJune 29, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi062916.7.3.p
ggsave(file = "062916.3.7.png")

ndvi072716.7.3.p <- ggplot(ndvi072716.7.3.us, aes(ndvi072716.7.3.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi072716.7.3.p <- ndvi072716.7.3.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi072716.7.3.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi072716.7.3.p <- ndvi072716.7.3.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi072716.7.3.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi072716.7.3.p <- ndvi072716.7.3.p + labs(title = "Rush Ranch Block 1, Section 3.7\nJuly 27, 2016 NDVI Values Histogram\n with mean &median", x = "")
ndvi072716.7.3.p
ggsave(file = "072716.3.7.png")

ndvi081716.7.3.p <- ggplot(ndvi081716.7.3.us, aes(ndvi081716.7.3.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi081716.7.3.p <- ndvi081716.7.3.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi081716.7.3.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi081716.7.3.p <- ndvi081716.7.3.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi081716.7.3.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi081716.7.3.p <- ndvi081716.7.3.p + labs(title = "Rush Ranch Block 1, Section 3.7\nAugust 17, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi081716.7.3.p
ggsave(file = "081716.3.7.png")

ndvi082416.7.3.p <- ggplot(ndvi082416.7.3.us, aes(ndvi082416.7.3.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi082416.7.3.p <- ndvi082416.7.3.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi082416.7.3.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi082416.7.3.p <- ndvi082416.7.3.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi082416.7.3.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi082416.7.3.p <- ndvi082416.7.3.p + labs(title = "Rush Ranch Block 1, Section 3.7\nAugust 24, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi082416.7.3.p
ggsave(file = "082416.3.7.png")

set.seed(131)
ndvi050316.7.3.us <- na.omit(ndvi050316.7.3.us); ndvi050316.7.3.rs <- sample_n(ndvi050316.7.3.us, 15000); ndvi050316.7.3.rs$Date <- "a"
ndvi052616.7.3.us <- na.omit(ndvi052616.7.3.us); ndvi052616.7.3.rs <- sample_n(ndvi052616.7.3.us, 15000); ndvi052616.7.3.rs$Date <- "b"
ndvi062316.7.3.us <- na.omit(ndvi062316.7.3.us); ndvi062316.7.3.rs <- sample_n(ndvi062316.7.3.us, 15000); ndvi062316.7.3.rs$Date <- "c"
ndvi062916.7.3.us <- na.omit(ndvi062916.7.3.us); ndvi062916.7.3.rs <- sample_n(ndvi062916.7.3.us, 15000); ndvi062916.7.3.rs$Date <- "d"
ndvi072716.7.3.us <- na.omit(ndvi072716.7.3.us); ndvi072716.7.3.rs <- sample_n(ndvi072716.7.3.us, 15000); ndvi072716.7.3.rs$Date <- "e"
ndvi081716.7.3.us <- na.omit(ndvi081716.7.3.us); ndvi081716.7.3.rs <- sample_n(ndvi081716.7.3.us, 15000); ndvi081716.7.3.rs$Date <- "f"
ndvi082416.7.3.us <- na.omit(ndvi082416.7.3.us); ndvi082416.7.3.rs <- sample_n(ndvi082416.7.3.us, 15000); ndvi082416.7.3.rs$Date <- "g"

rrblrs <- rbind(ndvi082416.7.3.rs, ndvi081716.7.3.rs)
rrblrs <- rbind(rrblrs, ndvi072716.7.3.rs)
rrblrs <- rbind(rrblrs, ndvi062916.7.3.rs)
rrblrs <- rbind(rrblrs, ndvi062316.7.3.rs)
rrblrs <- rbind(rrblrs, ndvi052616.7.3.rs)
rrblrs <- rbind(rrblrs, ndvi050316.7.3.rs)




rrblrsp <- ggplot(rrblrs, aes(x = Date, y = NDVI)) + geom_violin(aes(fill = Date))
rrblrsp <- rrblrsp + scale_fill_brewer(palette="BrBG", labels = c("May 3", "May 26", "June 23", "June 26", "July 27", "Aug 17", "Aug 24"))
rrblrsp <- rrblrsp + xlab("") + theme_bw()+ theme(axis.text.x = element_blank()) + theme(plot.title = element_text(hjust = 0.5))
rrblrsp <- rrblrsp + stat_summary(fun.data=mean_sdl, mult=1, geom="pointrange", color="#bf812d")
rrblrsp <- rrblrsp + labs(title = "Rush Ranch Block 1, Section 3.7\n2016 NDVI Values")
rrblrsp
ggsave(file = "rrblrsp2016violin.3.7.png")

rrblrsp <- ggplot(rrblrs, aes(x = Date, y = NDVI)) + geom_boxplot(aes(fill = Date))
rrblrsp <- rrblrsp + scale_fill_brewer(palette="BrBG", labels = c("May 3", "May 26", "June 23", "June 26", "July 27", "Aug 17", "Aug 24"))
rrblrsp <- rrblrsp + xlab("") + theme_bw() + theme(axis.text.x = element_blank()) + theme(plot.title = element_text(hjust = 0.5))
rrblrsp <- rrblrsp + labs(title = "Rush Ranch Block 1, Section 3.7\n2016 NDVI Values")
rrblrsp
ggsave(file = "rrblrsp2016box.3.7.png")

####################################################################

ndvi050316.8.3 <- crop(ndvi050316, extent(ndvi050316, 560, 639, 601, 800))
ndvi052616.8.3 <- crop(ndvi052616, extent(ndvi052616, 560, 639, 601, 800))
ndvi062316.8.3 <- crop(ndvi062316, extent(ndvi062316, 560, 639, 601, 800))
ndvi062916.8.3 <- crop(ndvi062916, extent(ndvi062916, 560, 639, 601, 800))
ndvi072716.8.3 <- crop(ndvi072716, extent(ndvi072716, 560, 639, 601, 800))
ndvi081716.8.3 <- crop(ndvi081716, extent(ndvi081716, 560, 639, 601, 800))
ndvi082416.8.3 <- crop(ndvi082416, extent(ndvi082416, 560, 639, 601, 800))



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
image(ndvi082416.8.3)

ndvi050316.8.3.st <- stack(ndvi050316.8.3)
ndvi052616.8.3.st <- stack(ndvi052616.8.3)
ndvi062316.8.3.st <- stack(ndvi062316.8.3)
ndvi062916.8.3.st <- stack(ndvi062916.8.3)
ndvi072716.8.3.st <- stack(ndvi072716.8.3)
ndvi081716.8.3.st <- stack(ndvi081716.8.3)
ndvi082416.8.3.st <- stack(ndvi082416.8.3)

ndvi050316.8.3.df <- as.data.frame(ndvi050316.8.3.st);colnames(ndvi050316.8.3.df) <- "NDVI"; ndvi050316.8.3.df$observation <- 1:nrow(ndvi050316.8.3.df)

ndvi052616.8.3.df <- as.data.frame(ndvi052616.8.3.st);colnames(ndvi052616.8.3.df) <- "NDVI"; ndvi052616.8.3.df$observation <- 1:nrow(ndvi052616.8.3.df)

ndvi062316.8.3.df <- as.data.frame(ndvi062316.8.3.st); colnames(ndvi062316.8.3.df) <- "NDVI"; ndvi062316.8.3.df$observation <- 1:nrow(ndvi062316.8.3.df)

ndvi062916.8.3.df <- as.data.frame(ndvi062916.8.3.st); colnames(ndvi062916.8.3.df) <- "NDVI"; ndvi062916.8.3.df$observation <- 1:nrow(ndvi062916.8.3.df)

ndvi072716.8.3.df <- as.data.frame(ndvi072716.8.3.st); colnames(ndvi072716.8.3.df) <- "NDVI"; ndvi072716.8.3.df$observation <- 1:nrow(ndvi072716.8.3.df)

ndvi081716.8.3.df <- as.data.frame(ndvi081716.8.3.st); colnames(ndvi081716.8.3.df) <- "NDVI"; ndvi081716.8.3.df$observation <- 1:nrow(ndvi081716.8.3.df)

ndvi082416.8.3.df <- as.data.frame(ndvi082416.8.3.st);colnames(ndvi082416.8.3.df) <- "NDVI"; ndvi082416.8.3.df$observation <- 1:nrow(ndvi082416.8.3.df)


ndvi050316.8.3.st.av <- cellStats(ndvi050316.8.3.st, mean)
ndvi050316.8.3.st.md <- cellStats(ndvi050316.8.3.st, median)
ndvi050316.8.3.st.mx <- cellStats(ndvi050316.8.3.st, max)
ndvi050316.8.3.st.mn <- cellStats(ndvi050316.8.3.st, min)
ndvi050316.8.3.st.sd <- sd(ndvi050316.8.3.df$NDVI, na.rm = TRUE)

ndvi052616.8.3.st.av <- cellStats(ndvi052616.8.3.st, mean)
ndvi052616.8.3.st.md <- cellStats(ndvi052616.8.3.st, median)
ndvi052616.8.3.st.mx <- cellStats(ndvi052616.8.3.st, max)
ndvi052616.8.3.st.mn <- cellStats(ndvi052616.8.3.st, min)
ndvi052616.8.3.st.sd <- sd(ndvi052616.8.3.df$NDVI, na.rm = TRUE)

ndvi062316.8.3.st.av <- cellStats(ndvi062316, mean)
ndvi062316.8.3.st.md <- cellStats(ndvi062316, median)
ndvi062316.8.3.st.mx <- cellStats(ndvi062316.8.3.st, max)
ndvi062316.8.3.st.mn <- cellStats(ndvi062316.8.3.st, min)
ndvi062316.8.3.st.sd <- sd(ndvi062316.8.3.df$NDVI, na.rm = TRUE)

ndvi062916.8.3.st.av <- cellStats(ndvi062916.8.3.st, mean)
ndvi062916.8.3.st.md <- cellStats(ndvi062916.8.3.st, median)
ndvi062916.8.3.st.mx <- cellStats(ndvi062916.8.3.st, max)
ndvi062916.8.3.st.mn <- cellStats(ndvi062916.8.3.st, min)
ndvi062916.8.3.st.sd <- sd(ndvi062916.8.3.df$NDVI, na.rm = TRUE)

ndvi072716.8.3.st.av <- cellStats(ndvi072716.8.3.st, mean)
ndvi072716.8.3.st.md <- cellStats(ndvi072716.8.3.st, median)
ndvi072716.8.3.st.mx <- cellStats(ndvi072716.8.3.st, max)
ndvi072716.8.3.st.mn <- cellStats(ndvi072716.8.3.st, min)
ndvi072716.8.3.st.sd <- sd(ndvi072716.8.3.df$NDVI, na.rm = TRUE)

ndvi081716.8.3.st.av <- cellStats(ndvi081716.8.3.st, mean)
ndvi081716.8.3.st.md <- cellStats(ndvi081716.8.3.st, median)
ndvi081716.8.3.st.mx <- cellStats(ndvi081716.8.3.st, max)
ndvi081716.8.3.st.mn <- cellStats(ndvi081716.8.3.st, min)
ndvi081716.8.3.st.sd <- sd(ndvi081716.8.3.df$NDVI, na.rm = TRUE)

ndvi082416.8.3.st.av <- cellStats(ndvi082416.8.3.st, mean)
ndvi082416.8.3.st.md <- cellStats(ndvi082416.8.3.st, median)
ndvi082416.8.3.st.mx <- cellStats(ndvi082416.8.3.st, max)
ndvi082416.8.3.st.mn <- cellStats(ndvi082416.8.3.st, min)
ndvi082416.8.3.st.sd <- sd(ndvi082416.8.3.df$NDVI, na.rm = TRUE)

ndviav <- data.frame(Average = c(ndvi050316.8.3.st.av, ndvi052616.8.3.st.av, ndvi062316.8.3.st.av, ndvi062916.8.3.st.av,
                                 ndvi072716.8.3.st.av, ndvi081716.8.3.st.av, ndvi082416.8.3.st.av))

ndvimd <- data.frame(Median = c(ndvi050316.8.3.st.md, ndvi052616.8.3.st.md, ndvi062316.8.3.st.md, ndvi062916.8.3.st.md,
                                ndvi072716.8.3.st.md, ndvi081716.8.3.st.md, ndvi082416.8.3.st.md))

ndvisd <- data.frame(StandardDeviation = c(ndvi050316.8.3.st.sd, ndvi052616.8.3.st.sd, ndvi062316.8.3.st.sd, ndvi062916.8.3.st.sd,
                                           ndvi072716.8.3.st.sd, ndvi081716.8.3.st.sd, ndvi082416.8.3.st.sd))

ndvimx <- data.frame(Maximum = c(ndvi050316.8.3.st.mx, ndvi052616.8.3.st.mx, ndvi062316.8.3.st.mx, ndvi062916.8.3.st.mx,
                                 ndvi072716.8.3.st.mx, ndvi081716.8.3.st.mx, ndvi082416.8.3.st.mx))

ndvimn <- data.frame(Minimum = c(ndvi050316.8.3.st.mn, ndvi052616.8.3.st.mn, ndvi062316.8.3.st.mn, ndvi062916.8.3.st.mn,
                                 ndvi072716.8.3.st.mn, ndvi081716.8.3.st.mn, ndvi082416.8.3.st.mn))


rrbldf <- cbind(dt, ndviav)
rrbldf <- cbind(rrbldf, ndvimd)
rrbldf <- cbind(rrbldf, ndvisd)
rrbldf <- cbind(rrbldf, ndvimx)
rrbldf <- cbind(rrbldf, ndvimn)
write.csv(rrbldf, "RushRanchBlk1_2016.3.8.csv")

options(device = "RStudioGD")
ndvi050316.8.3.us <- unstack(ndvi050316.8.3.df); colnames(ndvi050316.8.3.us) <- "NDVI"
ndvi052616.8.3.us <- unstack(ndvi052616.8.3.df); colnames(ndvi052616.8.3.us) <- "NDVI"
ndvi062316.8.3.us <- unstack(ndvi062316.8.3.df); colnames(ndvi062316.8.3.us) <- "NDVI"
ndvi062916.8.3.us <- unstack(ndvi062916.8.3.df); colnames(ndvi062916.8.3.us) <- "NDVI"
ndvi072716.8.3.us <- unstack(ndvi072716.8.3.df); colnames(ndvi072716.8.3.us) <- "NDVI"
ndvi081716.8.3.us <- unstack(ndvi081716.8.3.df); colnames(ndvi081716.8.3.us) <- "NDVI"
ndvi082416.8.3.us <- unstack(ndvi082416.8.3.df); colnames(ndvi082416.8.3.us) <- "NDVI"

ndvi050316.8.3.p <- ggplot(ndvi050316.8.3.us, aes(ndvi050316.8.3.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi050316.8.3.p <- ndvi050316.8.3.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi050316.8.3.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi050316.8.3.p <- ndvi050316.8.3.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi050316.8.3.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi050316.8.3.p <- ndvi050316.8.3.p + labs(title = "Rush Ranch Block 1, Section 3.8\nMay 3, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi050316.8.3.p
ggsave(file = "050316.3.8.png")

ndvi052616.8.3.p <- ggplot(ndvi052616.8.3.us, aes(ndvi052616.8.3.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi052616.8.3.p <- ndvi052616.8.3.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi052616.8.3.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi052616.8.3.p <- ndvi052616.8.3.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi052616.8.3.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi052616.8.3.p <- ndvi052616.8.3.p + labs(title = "Rush Ranch Block 1, Section 3.8\nMay 26, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi052616.8.3.p
ggsave(file = "052616.3.8.png")

ndvi062316.8.3.p <- ggplot(ndvi062316.8.3.us, aes(ndvi062316.8.3.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi062316.8.3.p <- ndvi062316.8.3.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi062316.8.3.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi062316.8.3.p <- ndvi062316.8.3.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi062316.8.3.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi062316.8.3.p <- ndvi062316.8.3.p + labs(title = "Rush Ranch Block 1, Section 3.8\nJune 23, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi062316.8.3.p
ggsave(file = "062316.3.8.png")

ndvi062916.8.3.p <- ggplot(ndvi062916.8.3.us, aes(ndvi062916.8.3.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi062916.8.3.p <- ndvi062916.8.3.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi062916.8.3.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi062916.8.3.p <- ndvi062916.8.3.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi062916.8.3.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi062916.8.3.p <- ndvi062916.8.3.p + labs(title = "Rush Ranch Block 1, Section 3.8\nJune 29, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi062916.8.3.p
ggsave(file = "062916.3.8.png")

ndvi072716.8.3.p <- ggplot(ndvi072716.8.3.us, aes(ndvi072716.8.3.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi072716.8.3.p <- ndvi072716.8.3.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi072716.8.3.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi072716.8.3.p <- ndvi072716.8.3.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi072716.8.3.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi072716.8.3.p <- ndvi072716.8.3.p + labs(title = "Rush Ranch Block 1, Section 3.8\nJuly 27, 2016 NDVI Values Histogram\n with mean &median", x = "")
ndvi072716.8.3.p
ggsave(file = "072716.3.8.png")

ndvi081716.8.3.p <- ggplot(ndvi081716.8.3.us, aes(ndvi081716.8.3.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi081716.8.3.p <- ndvi081716.8.3.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi081716.8.3.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi081716.8.3.p <- ndvi081716.8.3.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi081716.8.3.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi081716.8.3.p <- ndvi081716.8.3.p + labs(title = "Rush Ranch Block 1, Section 3.8\nAugust 17, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi081716.8.3.p
ggsave(file = "081716.3.8.png")

ndvi082416.8.3.p <- ggplot(ndvi082416.8.3.us, aes(ndvi082416.8.3.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi082416.8.3.p <- ndvi082416.8.3.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi082416.8.3.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi082416.8.3.p <- ndvi082416.8.3.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi082416.8.3.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi082416.8.3.p <- ndvi082416.8.3.p + labs(title = "Rush Ranch Block 1, Section 3.8\nAugust 24, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi082416.8.3.p
ggsave(file = "082416.3.8.png")

set.seed(131)
ndvi050316.8.3.us <- na.omit(ndvi050316.8.3.us); ndvi050316.8.3.rs <- sample_n(ndvi050316.8.3.us, 15000); ndvi050316.8.3.rs$Date <- "a"
ndvi052616.8.3.us <- na.omit(ndvi052616.8.3.us); ndvi052616.8.3.rs <- sample_n(ndvi052616.8.3.us, 15000); ndvi052616.8.3.rs$Date <- "b"
ndvi062316.8.3.us <- na.omit(ndvi062316.8.3.us); ndvi062316.8.3.rs <- sample_n(ndvi062316.8.3.us, 15000); ndvi062316.8.3.rs$Date <- "c"
ndvi062916.8.3.us <- na.omit(ndvi062916.8.3.us); ndvi062916.8.3.rs <- sample_n(ndvi062916.8.3.us, 15000); ndvi062916.8.3.rs$Date <- "d"
ndvi072716.8.3.us <- na.omit(ndvi072716.8.3.us); ndvi072716.8.3.rs <- sample_n(ndvi072716.8.3.us, 15000); ndvi072716.8.3.rs$Date <- "e"
ndvi081716.8.3.us <- na.omit(ndvi081716.8.3.us); ndvi081716.8.3.rs <- sample_n(ndvi081716.8.3.us, 15000); ndvi081716.8.3.rs$Date <- "f"
ndvi082416.8.3.us <- na.omit(ndvi082416.8.3.us); ndvi082416.8.3.rs <- sample_n(ndvi082416.8.3.us, 15000); ndvi082416.8.3.rs$Date <- "g"

rrblrs <- rbind(ndvi082416.8.3.rs, ndvi081716.8.3.rs)
rrblrs <- rbind(rrblrs, ndvi072716.8.3.rs)
rrblrs <- rbind(rrblrs, ndvi062916.8.3.rs)
rrblrs <- rbind(rrblrs, ndvi062316.8.3.rs)
rrblrs <- rbind(rrblrs, ndvi052616.8.3.rs)
rrblrs <- rbind(rrblrs, ndvi050316.8.3.rs)




rrblrsp <- ggplot(rrblrs, aes(x = Date, y = NDVI)) + geom_violin(aes(fill = Date))
rrblrsp <- rrblrsp + scale_fill_brewer(palette="BrBG", labels = c("May 3", "May 26", "June 23", "June 26", "July 27", "Aug 17", "Aug 24"))
rrblrsp <- rrblrsp + xlab("") + theme_bw()+ theme(axis.text.x = element_blank()) + theme(plot.title = element_text(hjust = 0.5))
rrblrsp <- rrblrsp + stat_summary(fun.data=mean_sdl, mult=1, geom="pointrange", color="#bf812d")
rrblrsp <- rrblrsp + labs(title = "Rush Ranch Block 1, Section 3.8\n2016 NDVI Values")
rrblrsp
ggsave(file = "rrblrsp2016violin.3.8.png")

rrblrsp <- ggplot(rrblrs, aes(x = Date, y = NDVI)) + geom_boxplot(aes(fill = Date))
rrblrsp <- rrblrsp + scale_fill_brewer(palette="BrBG", labels = c("May 3", "May 26", "June 23", "June 26", "July 27", "Aug 17", "Aug 24"))
rrblrsp <- rrblrsp + xlab("") + theme_bw() + theme(axis.text.x = element_blank()) + theme(plot.title = element_text(hjust = 0.5))
rrblrsp <- rrblrsp + labs(title = "Rush Ranch Block 1, Section 3.8\n2016 NDVI Values")
rrblrsp
ggsave(file = "rrblrsp2016box.3.8.png")

#######################################################

ndvi050316.9.3 <- crop(ndvi050316, extent(ndvi050316, 640, 719, 601, 800))
ndvi052616.9.3 <- crop(ndvi052616, extent(ndvi052616, 640, 719, 601, 800))
ndvi062316.9.3 <- crop(ndvi062316, extent(ndvi062316, 640, 719, 601, 800))
ndvi062916.9.3 <- crop(ndvi062916, extent(ndvi062916, 640, 719, 601, 800))
ndvi072716.9.3 <- crop(ndvi072716, extent(ndvi072716, 640, 719, 601, 800))
ndvi081716.9.3 <- crop(ndvi081716, extent(ndvi081716, 640, 719, 601, 800))
ndvi082416.9.3 <- crop(ndvi082416, extent(ndvi082416, 640, 719, 601, 800))



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
image(ndvi082416.9.3)

ndvi050316.9.3.st <- stack(ndvi050316.9.3)
ndvi052616.9.3.st <- stack(ndvi052616.9.3)
ndvi062316.9.3.st <- stack(ndvi062316.9.3)
ndvi062916.9.3.st <- stack(ndvi062916.9.3)
ndvi072716.9.3.st <- stack(ndvi072716.9.3)
ndvi081716.9.3.st <- stack(ndvi081716.9.3)
ndvi082416.9.3.st <- stack(ndvi082416.9.3)

ndvi050316.9.3.df <- as.data.frame(ndvi050316.9.3.st);colnames(ndvi050316.9.3.df) <- "NDVI"; ndvi050316.9.3.df$observation <- 1:nrow(ndvi050316.9.3.df)

ndvi052616.9.3.df <- as.data.frame(ndvi052616.9.3.st);colnames(ndvi052616.9.3.df) <- "NDVI"; ndvi052616.9.3.df$observation <- 1:nrow(ndvi052616.9.3.df)

ndvi062316.9.3.df <- as.data.frame(ndvi062316.9.3.st); colnames(ndvi062316.9.3.df) <- "NDVI"; ndvi062316.9.3.df$observation <- 1:nrow(ndvi062316.9.3.df)

ndvi062916.9.3.df <- as.data.frame(ndvi062916.9.3.st); colnames(ndvi062916.9.3.df) <- "NDVI"; ndvi062916.9.3.df$observation <- 1:nrow(ndvi062916.9.3.df)

ndvi072716.9.3.df <- as.data.frame(ndvi072716.9.3.st); colnames(ndvi072716.9.3.df) <- "NDVI"; ndvi072716.9.3.df$observation <- 1:nrow(ndvi072716.9.3.df)

ndvi081716.9.3.df <- as.data.frame(ndvi081716.9.3.st); colnames(ndvi081716.9.3.df) <- "NDVI"; ndvi081716.9.3.df$observation <- 1:nrow(ndvi081716.9.3.df)

ndvi082416.9.3.df <- as.data.frame(ndvi082416.9.3.st);colnames(ndvi082416.9.3.df) <- "NDVI"; ndvi082416.9.3.df$observation <- 1:nrow(ndvi082416.9.3.df)


ndvi050316.9.3.st.av <- cellStats(ndvi050316.9.3.st, mean)
ndvi050316.9.3.st.md <- cellStats(ndvi050316.9.3.st, median)
ndvi050316.9.3.st.mx <- cellStats(ndvi050316.9.3.st, max)
ndvi050316.9.3.st.mn <- cellStats(ndvi050316.9.3.st, min)
ndvi050316.9.3.st.sd <- sd(ndvi050316.9.3.df$NDVI, na.rm = TRUE)

ndvi052616.9.3.st.av <- cellStats(ndvi052616.9.3.st, mean)
ndvi052616.9.3.st.md <- cellStats(ndvi052616.9.3.st, median)
ndvi052616.9.3.st.mx <- cellStats(ndvi052616.9.3.st, max)
ndvi052616.9.3.st.mn <- cellStats(ndvi052616.9.3.st, min)
ndvi052616.9.3.st.sd <- sd(ndvi052616.9.3.df$NDVI, na.rm = TRUE)

ndvi062316.9.3.st.av <- cellStats(ndvi062316, mean)
ndvi062316.9.3.st.md <- cellStats(ndvi062316, median)
ndvi062316.9.3.st.mx <- cellStats(ndvi062316.9.3.st, max)
ndvi062316.9.3.st.mn <- cellStats(ndvi062316.9.3.st, min)
ndvi062316.9.3.st.sd <- sd(ndvi062316.9.3.df$NDVI, na.rm = TRUE)

ndvi062916.9.3.st.av <- cellStats(ndvi062916.9.3.st, mean)
ndvi062916.9.3.st.md <- cellStats(ndvi062916.9.3.st, median)
ndvi062916.9.3.st.mx <- cellStats(ndvi062916.9.3.st, max)
ndvi062916.9.3.st.mn <- cellStats(ndvi062916.9.3.st, min)
ndvi062916.9.3.st.sd <- sd(ndvi062916.9.3.df$NDVI, na.rm = TRUE)

ndvi072716.9.3.st.av <- cellStats(ndvi072716.9.3.st, mean)
ndvi072716.9.3.st.md <- cellStats(ndvi072716.9.3.st, median)
ndvi072716.9.3.st.mx <- cellStats(ndvi072716.9.3.st, max)
ndvi072716.9.3.st.mn <- cellStats(ndvi072716.9.3.st, min)
ndvi072716.9.3.st.sd <- sd(ndvi072716.9.3.df$NDVI, na.rm = TRUE)

ndvi081716.9.3.st.av <- cellStats(ndvi081716.9.3.st, mean)
ndvi081716.9.3.st.md <- cellStats(ndvi081716.9.3.st, median)
ndvi081716.9.3.st.mx <- cellStats(ndvi081716.9.3.st, max)
ndvi081716.9.3.st.mn <- cellStats(ndvi081716.9.3.st, min)
ndvi081716.9.3.st.sd <- sd(ndvi081716.9.3.df$NDVI, na.rm = TRUE)

ndvi082416.9.3.st.av <- cellStats(ndvi082416.9.3.st, mean)
ndvi082416.9.3.st.md <- cellStats(ndvi082416.9.3.st, median)
ndvi082416.9.3.st.mx <- cellStats(ndvi082416.9.3.st, max)
ndvi082416.9.3.st.mn <- cellStats(ndvi082416.9.3.st, min)
ndvi082416.9.3.st.sd <- sd(ndvi082416.9.3.df$NDVI, na.rm = TRUE)

ndviav <- data.frame(Average = c(ndvi050316.9.3.st.av, ndvi052616.9.3.st.av, ndvi062316.9.3.st.av, ndvi062916.9.3.st.av,
                                 ndvi072716.9.3.st.av, ndvi081716.9.3.st.av, ndvi082416.9.3.st.av))

ndvimd <- data.frame(Median = c(ndvi050316.9.3.st.md, ndvi052616.9.3.st.md, ndvi062316.9.3.st.md, ndvi062916.9.3.st.md,
                                ndvi072716.9.3.st.md, ndvi081716.9.3.st.md, ndvi082416.9.3.st.md))

ndvisd <- data.frame(StandardDeviation = c(ndvi050316.9.3.st.sd, ndvi052616.9.3.st.sd, ndvi062316.9.3.st.sd, ndvi062916.9.3.st.sd,
                                           ndvi072716.9.3.st.sd, ndvi081716.9.3.st.sd, ndvi082416.9.3.st.sd))

ndvimx <- data.frame(Maximum = c(ndvi050316.9.3.st.mx, ndvi052616.9.3.st.mx, ndvi062316.9.3.st.mx, ndvi062916.9.3.st.mx,
                                 ndvi072716.9.3.st.mx, ndvi081716.9.3.st.mx, ndvi082416.9.3.st.mx))

ndvimn <- data.frame(Minimum = c(ndvi050316.9.3.st.mn, ndvi052616.9.3.st.mn, ndvi062316.9.3.st.mn, ndvi062916.9.3.st.mn,
                                 ndvi072716.9.3.st.mn, ndvi081716.9.3.st.mn, ndvi082416.9.3.st.mn))


rrbldf <- cbind(dt, ndviav)
rrbldf <- cbind(rrbldf, ndvimd)
rrbldf <- cbind(rrbldf, ndvisd)
rrbldf <- cbind(rrbldf, ndvimx)
rrbldf <- cbind(rrbldf, ndvimn)
write.csv(rrbldf, "RushRanchBlk1_2016.3.9.csv")

options(device = "RStudioGD")
ndvi050316.9.3.us <- unstack(ndvi050316.9.3.df); colnames(ndvi050316.9.3.us) <- "NDVI"
ndvi052616.9.3.us <- unstack(ndvi052616.9.3.df); colnames(ndvi052616.9.3.us) <- "NDVI"
ndvi062316.9.3.us <- unstack(ndvi062316.9.3.df); colnames(ndvi062316.9.3.us) <- "NDVI"
ndvi062916.9.3.us <- unstack(ndvi062916.9.3.df); colnames(ndvi062916.9.3.us) <- "NDVI"
ndvi072716.9.3.us <- unstack(ndvi072716.9.3.df); colnames(ndvi072716.9.3.us) <- "NDVI"
ndvi081716.9.3.us <- unstack(ndvi081716.9.3.df); colnames(ndvi081716.9.3.us) <- "NDVI"
ndvi082416.9.3.us <- unstack(ndvi082416.9.3.df); colnames(ndvi082416.9.3.us) <- "NDVI"

ndvi050316.9.3.p <- ggplot(ndvi050316.9.3.us, aes(ndvi050316.9.3.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi050316.9.3.p <- ndvi050316.9.3.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi050316.9.3.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi050316.9.3.p <- ndvi050316.9.3.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi050316.9.3.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi050316.9.3.p <- ndvi050316.9.3.p + labs(title = "Rush Ranch Block 1, Section 3.9\nMay 3, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi050316.9.3.p
ggsave(file = "050316.3.9.png")

ndvi052616.9.3.p <- ggplot(ndvi052616.9.3.us, aes(ndvi052616.9.3.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi052616.9.3.p <- ndvi052616.9.3.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi052616.9.3.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi052616.9.3.p <- ndvi052616.9.3.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi052616.9.3.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi052616.9.3.p <- ndvi052616.9.3.p + labs(title = "Rush Ranch Block 1, Section 3.9\nMay 26, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi052616.9.3.p
ggsave(file = "052616.3.9.png")

ndvi062316.9.3.p <- ggplot(ndvi062316.9.3.us, aes(ndvi062316.9.3.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi062316.9.3.p <- ndvi062316.9.3.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi062316.9.3.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi062316.9.3.p <- ndvi062316.9.3.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi062316.9.3.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi062316.9.3.p <- ndvi062316.9.3.p + labs(title = "Rush Ranch Block 1, Section 3.9\nJune 23, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi062316.9.3.p
ggsave(file = "062316.3.9.png")

ndvi062916.9.3.p <- ggplot(ndvi062916.9.3.us, aes(ndvi062916.9.3.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi062916.9.3.p <- ndvi062916.9.3.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi062916.9.3.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi062916.9.3.p <- ndvi062916.9.3.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi062916.9.3.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi062916.9.3.p <- ndvi062916.9.3.p + labs(title = "Rush Ranch Block 1, Section 3.9\nJune 29, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi062916.9.3.p
ggsave(file = "062916.3.9.png")

ndvi072716.9.3.p <- ggplot(ndvi072716.9.3.us, aes(ndvi072716.9.3.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi072716.9.3.p <- ndvi072716.9.3.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi072716.9.3.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi072716.9.3.p <- ndvi072716.9.3.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi072716.9.3.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi072716.9.3.p <- ndvi072716.9.3.p + labs(title = "Rush Ranch Block 1, Section 3.9\nJuly 27, 2016 NDVI Values Histogram\n with mean &median", x = "")
ndvi072716.9.3.p
ggsave(file = "072716.3.9.png")

ndvi081716.9.3.p <- ggplot(ndvi081716.9.3.us, aes(ndvi081716.9.3.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi081716.9.3.p <- ndvi081716.9.3.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi081716.9.3.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi081716.9.3.p <- ndvi081716.9.3.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi081716.9.3.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi081716.9.3.p <- ndvi081716.9.3.p + labs(title = "Rush Ranch Block 1, Section 3.9\nAugust 17, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi081716.9.3.p
ggsave(file = "081716.3.9.png")

ndvi082416.9.3.p <- ggplot(ndvi082416.9.3.us, aes(ndvi082416.9.3.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi082416.9.3.p <- ndvi082416.9.3.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi082416.9.3.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi082416.9.3.p <- ndvi082416.9.3.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi082416.9.3.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi082416.9.3.p <- ndvi082416.9.3.p + labs(title = "Rush Ranch Block 1, Section 3.9\nAugust 24, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi082416.9.3.p
ggsave(file = "082416.3.9.png")

set.seed(131)
ndvi050316.9.3.us <- na.omit(ndvi050316.9.3.us); ndvi050316.9.3.rs <- sample_n(ndvi050316.9.3.us, 15000); ndvi050316.9.3.rs$Date <- "a"
ndvi052616.9.3.us <- na.omit(ndvi052616.9.3.us); ndvi052616.9.3.rs <- sample_n(ndvi052616.9.3.us, 15000); ndvi052616.9.3.rs$Date <- "b"
ndvi062316.9.3.us <- na.omit(ndvi062316.9.3.us); ndvi062316.9.3.rs <- sample_n(ndvi062316.9.3.us, 15000); ndvi062316.9.3.rs$Date <- "c"
ndvi062916.9.3.us <- na.omit(ndvi062916.9.3.us); ndvi062916.9.3.rs <- sample_n(ndvi062916.9.3.us, 15000); ndvi062916.9.3.rs$Date <- "d"
ndvi072716.9.3.us <- na.omit(ndvi072716.9.3.us); ndvi072716.9.3.rs <- sample_n(ndvi072716.9.3.us, 15000); ndvi072716.9.3.rs$Date <- "e"
ndvi081716.9.3.us <- na.omit(ndvi081716.9.3.us); ndvi081716.9.3.rs <- sample_n(ndvi081716.9.3.us, 15000); ndvi081716.9.3.rs$Date <- "f"
ndvi082416.9.3.us <- na.omit(ndvi082416.9.3.us); ndvi082416.9.3.rs <- sample_n(ndvi082416.9.3.us, 15000); ndvi082416.9.3.rs$Date <- "g"

rrblrs <- rbind(ndvi082416.9.3.rs, ndvi081716.9.3.rs)
rrblrs <- rbind(rrblrs, ndvi072716.9.3.rs)
rrblrs <- rbind(rrblrs, ndvi062916.9.3.rs)
rrblrs <- rbind(rrblrs, ndvi062316.9.3.rs)
rrblrs <- rbind(rrblrs, ndvi052616.9.3.rs)
rrblrs <- rbind(rrblrs, ndvi050316.9.3.rs)




rrblrsp <- ggplot(rrblrs, aes(x = Date, y = NDVI)) + geom_violin(aes(fill = Date))
rrblrsp <- rrblrsp + scale_fill_brewer(palette="BrBG", labels = c("May 3", "May 26", "June 23", "June 26", "July 27", "Aug 17", "Aug 24"))
rrblrsp <- rrblrsp + xlab("") + theme_bw()+ theme(axis.text.x = element_blank()) + theme(plot.title = element_text(hjust = 0.5))
rrblrsp <- rrblrsp + stat_summary(fun.data=mean_sdl, mult=1, geom="pointrange", color="#bf812d")
rrblrsp <- rrblrsp + labs(title = "Rush Ranch Block 1, Section 3.9\n2016 NDVI Values")
rrblrsp
ggsave(file = "rrblrsp2016violin.3.9.png")

rrblrsp <- ggplot(rrblrs, aes(x = Date, y = NDVI)) + geom_boxplot(aes(fill = Date))
rrblrsp <- rrblrsp + scale_fill_brewer(palette="BrBG", labels = c("May 3", "May 26", "June 23", "June 26", "July 27", "Aug 17", "Aug 24"))
rrblrsp <- rrblrsp + xlab("") + theme_bw() + theme(axis.text.x = element_blank()) + theme(plot.title = element_text(hjust = 0.5))
rrblrsp <- rrblrsp + labs(title = "Rush Ranch Block 1, Section 3.9\n2016 NDVI Values")
rrblrsp
ggsave(file = "rrblrsp2016box.3.9.png")


#################################################################################

ndvi050316.10.3 <- crop(ndvi050316, extent(ndvi050316, 720, 798, 601, 800))
ndvi052616.10.3 <- crop(ndvi052616, extent(ndvi052616, 720, 798, 601, 800))
ndvi062316.10.3 <- crop(ndvi062316, extent(ndvi062316, 720, 795, 601, 800))
ndvi062916.10.3 <- crop(ndvi062916, extent(ndvi062916, 720, 771, 601, 800))
ndvi072716.10.3 <- crop(ndvi072716, extent(ndvi072716, 720, 766, 601, 800))
ndvi081716.10.3 <- crop(ndvi081716, extent(ndvi081716, 720, 771, 601, 800))
ndvi082416.10.3 <- crop(ndvi082416, extent(ndvi082416, 720, 790, 601, 800))



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
image(ndvi082416.10.3)

ndvi050316.10.3.st <- stack(ndvi050316.10.3)
ndvi052616.10.3.st <- stack(ndvi052616.10.3)
ndvi062316.10.3.st <- stack(ndvi062316.10.3)
ndvi062916.10.3.st <- stack(ndvi062916.10.3)
ndvi072716.10.3.st <- stack(ndvi072716.10.3)
ndvi081716.10.3.st <- stack(ndvi081716.10.3)
ndvi082416.10.3.st <- stack(ndvi082416.10.3)

ndvi050316.10.3.df <- as.data.frame(ndvi050316.10.3.st);colnames(ndvi050316.10.3.df) <- "NDVI"; ndvi050316.10.3.df$observation <- 1:nrow(ndvi050316.10.3.df)

ndvi052616.10.3.df <- as.data.frame(ndvi052616.10.3.st);colnames(ndvi052616.10.3.df) <- "NDVI"; ndvi052616.10.3.df$observation <- 1:nrow(ndvi052616.10.3.df)

ndvi062316.10.3.df <- as.data.frame(ndvi062316.10.3.st); colnames(ndvi062316.10.3.df) <- "NDVI"; ndvi062316.10.3.df$observation <- 1:nrow(ndvi062316.10.3.df)

ndvi062916.10.3.df <- as.data.frame(ndvi062916.10.3.st); colnames(ndvi062916.10.3.df) <- "NDVI"; ndvi062916.10.3.df$observation <- 1:nrow(ndvi062916.10.3.df)

ndvi072716.10.3.df <- as.data.frame(ndvi072716.10.3.st); colnames(ndvi072716.10.3.df) <- "NDVI"; ndvi072716.10.3.df$observation <- 1:nrow(ndvi072716.10.3.df)

ndvi081716.10.3.df <- as.data.frame(ndvi081716.10.3.st); colnames(ndvi081716.10.3.df) <- "NDVI"; ndvi081716.10.3.df$observation <- 1:nrow(ndvi081716.10.3.df)

ndvi082416.10.3.df <- as.data.frame(ndvi082416.10.3.st);colnames(ndvi082416.10.3.df) <- "NDVI"; ndvi082416.10.3.df$observation <- 1:nrow(ndvi082416.10.3.df)


ndvi050316.10.3.st.av <- cellStats(ndvi050316.10.3.st, mean)
ndvi050316.10.3.st.md <- cellStats(ndvi050316.10.3.st, median)
ndvi050316.10.3.st.mx <- cellStats(ndvi050316.10.3.st, max)
ndvi050316.10.3.st.mn <- cellStats(ndvi050316.10.3.st, min)
ndvi050316.10.3.st.sd <- sd(ndvi050316.10.3.df$NDVI, na.rm = TRUE)

ndvi052616.10.3.st.av <- cellStats(ndvi052616.10.3.st, mean)
ndvi052616.10.3.st.md <- cellStats(ndvi052616.10.3.st, median)
ndvi052616.10.3.st.mx <- cellStats(ndvi052616.10.3.st, max)
ndvi052616.10.3.st.mn <- cellStats(ndvi052616.10.3.st, min)
ndvi052616.10.3.st.sd <- sd(ndvi052616.10.3.df$NDVI, na.rm = TRUE)

ndvi062316.10.3.st.av <- cellStats(ndvi062316, mean)
ndvi062316.10.3.st.md <- cellStats(ndvi062316, median)
ndvi062316.10.3.st.mx <- cellStats(ndvi062316.10.3.st, max)
ndvi062316.10.3.st.mn <- cellStats(ndvi062316.10.3.st, min)
ndvi062316.10.3.st.sd <- sd(ndvi062316.10.3.df$NDVI, na.rm = TRUE)

ndvi062916.10.3.st.av <- cellStats(ndvi062916.10.3.st, mean)
ndvi062916.10.3.st.md <- cellStats(ndvi062916.10.3.st, median)
ndvi062916.10.3.st.mx <- cellStats(ndvi062916.10.3.st, max)
ndvi062916.10.3.st.mn <- cellStats(ndvi062916.10.3.st, min)
ndvi062916.10.3.st.sd <- sd(ndvi062916.10.3.df$NDVI, na.rm = TRUE)

ndvi072716.10.3.st.av <- cellStats(ndvi072716.10.3.st, mean)
ndvi072716.10.3.st.md <- cellStats(ndvi072716.10.3.st, median)
ndvi072716.10.3.st.mx <- cellStats(ndvi072716.10.3.st, max)
ndvi072716.10.3.st.mn <- cellStats(ndvi072716.10.3.st, min)
ndvi072716.10.3.st.sd <- sd(ndvi072716.10.3.df$NDVI, na.rm = TRUE)

ndvi081716.10.3.st.av <- cellStats(ndvi081716.10.3.st, mean)
ndvi081716.10.3.st.md <- cellStats(ndvi081716.10.3.st, median)
ndvi081716.10.3.st.mx <- cellStats(ndvi081716.10.3.st, max)
ndvi081716.10.3.st.mn <- cellStats(ndvi081716.10.3.st, min)
ndvi081716.10.3.st.sd <- sd(ndvi081716.10.3.df$NDVI, na.rm = TRUE)

ndvi082416.10.3.st.av <- cellStats(ndvi082416.10.3.st, mean)
ndvi082416.10.3.st.md <- cellStats(ndvi082416.10.3.st, median)
ndvi082416.10.3.st.mx <- cellStats(ndvi082416.10.3.st, max)
ndvi082416.10.3.st.mn <- cellStats(ndvi082416.10.3.st, min)
ndvi082416.10.3.st.sd <- sd(ndvi082416.10.3.df$NDVI, na.rm = TRUE)

ndviav <- data.frame(Average = c(ndvi050316.10.3.st.av, ndvi052616.10.3.st.av, ndvi062316.10.3.st.av, ndvi062916.10.3.st.av,
                                 ndvi072716.10.3.st.av, ndvi081716.10.3.st.av, ndvi082416.10.3.st.av))

ndvimd <- data.frame(Median = c(ndvi050316.10.3.st.md, ndvi052616.10.3.st.md, ndvi062316.10.3.st.md, ndvi062916.10.3.st.md,
                                ndvi072716.10.3.st.md, ndvi081716.10.3.st.md, ndvi082416.10.3.st.md))

ndvisd <- data.frame(StandardDeviation = c(ndvi050316.10.3.st.sd, ndvi052616.10.3.st.sd, ndvi062316.10.3.st.sd, ndvi062916.10.3.st.sd,
                                           ndvi072716.10.3.st.sd, ndvi081716.10.3.st.sd, ndvi082416.10.3.st.sd))

ndvimx <- data.frame(Maximum = c(ndvi050316.10.3.st.mx, ndvi052616.10.3.st.mx, ndvi062316.10.3.st.mx, ndvi062916.10.3.st.mx,
                                 ndvi072716.10.3.st.mx, ndvi081716.10.3.st.mx, ndvi082416.10.3.st.mx))

ndvimn <- data.frame(Minimum = c(ndvi050316.10.3.st.mn, ndvi052616.10.3.st.mn, ndvi062316.10.3.st.mn, ndvi062916.10.3.st.mn,
                                 ndvi072716.10.3.st.mn, ndvi081716.10.3.st.mn, ndvi082416.10.3.st.mn))


rrbldf <- cbind(dt, ndviav)
rrbldf <- cbind(rrbldf, ndvimd)
rrbldf <- cbind(rrbldf, ndvisd)
rrbldf <- cbind(rrbldf, ndvimx)
rrbldf <- cbind(rrbldf, ndvimn)
write.csv(rrbldf, "RushRanchBlk1_2016.4.10.csv")

options(device = "RStudioGD")
ndvi050316.10.3.us <- unstack(ndvi050316.10.3.df); colnames(ndvi050316.10.3.us) <- "NDVI"
ndvi052616.10.3.us <- unstack(ndvi052616.10.3.df); colnames(ndvi052616.10.3.us) <- "NDVI"
ndvi062316.10.3.us <- unstack(ndvi062316.10.3.df); colnames(ndvi062316.10.3.us) <- "NDVI"
ndvi062916.10.3.us <- unstack(ndvi062916.10.3.df); colnames(ndvi062916.10.3.us) <- "NDVI"
ndvi072716.10.3.us <- unstack(ndvi072716.10.3.df); colnames(ndvi072716.10.3.us) <- "NDVI"
ndvi081716.10.3.us <- unstack(ndvi081716.10.3.df); colnames(ndvi081716.10.3.us) <- "NDVI"
ndvi082416.10.3.us <- unstack(ndvi082416.10.3.df); colnames(ndvi082416.10.3.us) <- "NDVI"

ndvi050316.10.3.p <- ggplot(ndvi050316.10.3.us, aes(ndvi050316.10.3.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi050316.10.3.p <- ndvi050316.10.3.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi050316.10.3.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi050316.10.3.p <- ndvi050316.10.3.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi050316.10.3.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi050316.10.3.p <- ndvi050316.10.3.p + labs(title = "Rush Ranch Block 1, Section 3.10\nMay 3, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi050316.10.3.p
ggsave(file = "050316.4.10.png")

ndvi052616.10.3.p <- ggplot(ndvi052616.10.3.us, aes(ndvi052616.10.3.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi052616.10.3.p <- ndvi052616.10.3.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi052616.10.3.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi052616.10.3.p <- ndvi052616.10.3.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi052616.10.3.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi052616.10.3.p <- ndvi052616.10.3.p + labs(title = "Rush Ranch Block 1, Section 3.10\nMay 26, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi052616.10.3.p
ggsave(file = "052616.4.10.png")

ndvi062316.10.3.p <- ggplot(ndvi062316.10.3.us, aes(ndvi062316.10.3.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi062316.10.3.p <- ndvi062316.10.3.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi062316.10.3.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi062316.10.3.p <- ndvi062316.10.3.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi062316.10.3.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi062316.10.3.p <- ndvi062316.10.3.p + labs(title = "Rush Ranch Block 1, Section 3.10\nJune 23, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi062316.10.3.p
ggsave(file = "062316.4.10.png")

ndvi062916.10.3.p <- ggplot(ndvi062916.10.3.us, aes(ndvi062916.10.3.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi062916.10.3.p <- ndvi062916.10.3.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi062916.10.3.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi062916.10.3.p <- ndvi062916.10.3.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi062916.10.3.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi062916.10.3.p <- ndvi062916.10.3.p + labs(title = "Rush Ranch Block 1, Section 3.10\nJune 29, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi062916.10.3.p
ggsave(file = "062916.4.10.png")

ndvi072716.10.3.p <- ggplot(ndvi072716.10.3.us, aes(ndvi072716.10.3.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi072716.10.3.p <- ndvi072716.10.3.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi072716.10.3.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi072716.10.3.p <- ndvi072716.10.3.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi072716.10.3.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi072716.10.3.p <- ndvi072716.10.3.p + labs(title = "Rush Ranch Block 1, Section 3.10\nJuly 27, 2016 NDVI Values Histogram\n with mean &median", x = "")
ndvi072716.10.3.p
ggsave(file = "072716.4.10.png")

ndvi081716.10.3.p <- ggplot(ndvi081716.10.3.us, aes(ndvi081716.10.3.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi081716.10.3.p <- ndvi081716.10.3.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi081716.10.3.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi081716.10.3.p <- ndvi081716.10.3.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi081716.10.3.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi081716.10.3.p <- ndvi081716.10.3.p + labs(title = "Rush Ranch Block 1, Section 3.10\nAugust 17, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi081716.10.3.p
ggsave(file = "081716.4.10.png")

ndvi082416.10.3.p <- ggplot(ndvi082416.10.3.us, aes(ndvi082416.10.3.us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi082416.10.3.p <- ndvi082416.10.3.p + theme_bw() + geom_vline(aes(xintercept = median(ndvi082416.10.3.us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi082416.10.3.p <- ndvi082416.10.3.p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi082416.10.3.us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi082416.10.3.p <- ndvi082416.10.3.p + labs(title = "Rush Ranch Block 1, Section 3.10\nAugust 24, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi082416.10.3.p
ggsave(file = "082416.4.10.png")

set.seed(131)
ndvi050316.10.3.us <- na.omit(ndvi050316.10.3.us); ndvi050316.10.3.rs <- sample_n(ndvi050316.10.3.us, 9000); ndvi050316.10.3.rs$Date <- "a"
ndvi052616.10.3.us <- na.omit(ndvi052616.10.3.us); ndvi052616.10.3.rs <- sample_n(ndvi052616.10.3.us, 9000); ndvi052616.10.3.rs$Date <- "b"
ndvi062316.10.3.us <- na.omit(ndvi062316.10.3.us); ndvi062316.10.3.rs <- sample_n(ndvi062316.10.3.us, 9000); ndvi062316.10.3.rs$Date <- "c"
ndvi062916.10.3.us <- na.omit(ndvi062916.10.3.us); ndvi062916.10.3.rs <- sample_n(ndvi062916.10.3.us, 9000); ndvi062916.10.3.rs$Date <- "d"
ndvi072716.10.3.us <- na.omit(ndvi072716.10.3.us); ndvi072716.10.3.rs <- sample_n(ndvi072716.10.3.us, 9000); ndvi072716.10.3.rs$Date <- "e"
ndvi081716.10.3.us <- na.omit(ndvi081716.10.3.us); ndvi081716.10.3.rs <- sample_n(ndvi081716.10.3.us, 9000); ndvi081716.10.3.rs$Date <- "f"
ndvi082416.10.3.us <- na.omit(ndvi082416.10.3.us); ndvi082416.10.3.rs <- sample_n(ndvi082416.10.3.us, 9000); ndvi082416.10.3.rs$Date <- "g"

rrblrs <- rbind(ndvi082416.10.3.rs, ndvi081716.10.3.rs)
rrblrs <- rbind(rrblrs, ndvi072716.10.3.rs)
rrblrs <- rbind(rrblrs, ndvi062916.10.3.rs)
rrblrs <- rbind(rrblrs, ndvi062316.10.3.rs)
rrblrs <- rbind(rrblrs, ndvi052616.10.3.rs)
rrblrs <- rbind(rrblrs, ndvi050316.10.3.rs)




rrblrsp <- ggplot(rrblrs, aes(x = Date, y = NDVI)) + geom_violin(aes(fill = Date))
rrblrsp <- rrblrsp + scale_fill_brewer(palette="BrBG", labels = c("May 3", "May 26", "June 23", "June 26", "July 27", "Aug 17", "Aug 24"))
rrblrsp <- rrblrsp + xlab("") + theme_bw()+ theme(axis.text.x = element_blank()) + theme(plot.title = element_text(hjust = 0.5))
rrblrsp <- rrblrsp + stat_summary(fun.data=mean_sdl, mult=1, geom="pointrange", color="#bf812d")
rrblrsp <- rrblrsp + labs(title = "Rush Ranch Block 1, Section 3.10\n2016 NDVI Values")
rrblrsp
ggsave(file = "rrblrsp2016violin.4.10.png")

rrblrsp <- ggplot(rrblrs, aes(x = Date, y = NDVI)) + geom_boxplot(aes(fill = Date))
rrblrsp <- rrblrsp + scale_fill_brewer(palette="BrBG", labels = c("May 3", "May 26", "June 23", "June 26", "July 27", "Aug 17", "Aug 24"))
rrblrsp <- rrblrsp + xlab("") + theme_bw() + theme(axis.text.x = element_blank()) + theme(plot.title = element_text(hjust = 0.5))
rrblrsp <- rrblrsp + labs(title = "Rush Ranch Block 1, Section 3.10\n2016 NDVI Values")
rrblrsp
ggsave(file = "rrblrsp2016box.4.10.png")
