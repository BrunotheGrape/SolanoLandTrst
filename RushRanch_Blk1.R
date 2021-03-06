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

ndvi050316st <- stack(ndvi050316)
ndvi052616st <- stack(ndvi052616)
ndvi062316st <- stack(ndvi062316)
ndvi062916st <- stack(ndvi062916)
ndvi072716st <- stack(ndvi072716)
ndvi081716st <- stack(ndvi081716)
ndvi082416st <- stack(ndvi082416)

ndvi050316df <- as.data.frame(ndvi050316st);colnames(ndvi050316df) <- "NDVI"; ndvi050316df$observation <- 1:nrow(ndvi050316df)

ndvi052616df <- as.data.frame(ndvi052616st);colnames(ndvi052616df) <- "NDVI"; ndvi052616df$observation <- 1:nrow(ndvi052616df)

ndvi062316df <- as.data.frame(ndvi062316st); colnames(ndvi062316df) <- "NDVI"; ndvi062316df$observation <- 1:nrow(ndvi062316df)

ndvi062916df <- as.data.frame(ndvi062916st); colnames(ndvi062916df) <- "NDVI"; ndvi062916df$observation <- 1:nrow(ndvi062916df)

ndvi072716df <- as.data.frame(ndvi072716st); colnames(ndvi072716df) <- "NDVI"; ndvi072716df$observation <- 1:nrow(ndvi072716df)

ndvi081716df <- as.data.frame(ndvi081716st); colnames(ndvi081716df) <- "NDVI"; ndvi081716df$observation <- 1:nrow(ndvi081716df)

ndvi082416df <- as.data.frame(ndvi082416st);colnames(ndvi082416df) <- "NDVI"; ndvi082416df$observation <- 1:nrow(ndvi082416df)


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
ndvi050316sd <- sd(ndvi050316df$NDVI, na.rm = TRUE)

ndvi052616av <- cellStats(ndvi052616, mean)
ndvi052616md <- cellStats(ndvi052616, median)
ndvi052616mx <- cellStats(ndvi052616, max)
ndvi052616mn <- cellStats(ndvi052616, min)
ndvi052616sd <- sd(ndvi052616df$NDVI, na.rm = TRUE)

ndvi062316av <- cellStats(ndvi062316, mean)
ndvi062316md <- cellStats(ndvi062316, median)
ndvi062316mx <- cellStats(ndvi062316, max)
ndvi062316mn <- cellStats(ndvi062316, min)
ndvi062316sd <- sd(ndvi062316df$NDVI, na.rm = TRUE)

ndvi062916av <- cellStats(ndvi062916, mean)
ndvi062916md <- cellStats(ndvi062916, median)
ndvi062916mx <- cellStats(ndvi062916, max)
ndvi062916mn <- cellStats(ndvi062916, min)
ndvi062916sd <- sd(ndvi062916df$NDVI, na.rm = TRUE)

ndvi072716av <- cellStats(ndvi072716, mean)
ndvi072716md <- cellStats(ndvi072716, median)
ndvi072716mx <- cellStats(ndvi072716, max)
ndvi072716mn <- cellStats(ndvi072716, min)
ndvi072716sd <- sd(ndvi072716df$NDVI, na.rm = TRUE)

ndvi081716av <- cellStats(ndvi081716, mean)
ndvi081716md <- cellStats(ndvi081716, median)
ndvi081716mx <- cellStats(ndvi081716, max)
ndvi081716mn <- cellStats(ndvi081716, min)
ndvi081716sd <- sd(ndvi081716df$NDVI, na.rm = TRUE)

ndvi082416av <- cellStats(ndvi082416, mean)
ndvi082416md <- cellStats(ndvi082416, median)
ndvi082416mx <- cellStats(ndvi082416, max)
ndvi082416mn <- cellStats(ndvi082416, min)
ndvi082416sd <- sd(ndvi082416df$NDVI, na.rm = TRUE)

ndviav <- data.frame(Average = c(ndvi050316av, ndvi052616av, ndvi062316av, ndvi062916av,
                                 ndvi072716av, ndvi081716av, ndvi082416av))

ndvimd <- data.frame(Median = c(ndvi050316md, ndvi052616md, ndvi062316md, ndvi062916md,
                                 ndvi072716md, ndvi081716md, ndvi082416md))

ndvisd <- data.frame(StandardDeviation = c(ndvi050316sd, ndvi052616sd, ndvi062316sd, ndvi062916sd,
                                ndvi072716sd, ndvi081716sd, ndvi082416sd))

ndvimx <- data.frame(Maximum = c(ndvi050316mx, ndvi052616mx, ndvi062316mx, ndvi062916mx,
                                 ndvi072716mx, ndvi081716mx, ndvi082416mx))

ndvimn <- data.frame(Minimum = c(ndvi050316mn, ndvi052616mn, ndvi062316mn, ndvi062916mn,
                                 ndvi072716mn, ndvi081716mn, ndvi082416mn))


rrbldf <- cbind(dt, ndviav)
rrbldf <- cbind(rrbldf, ndvimd)
rrbldf <- cbind(rrbldf, ndvisd)
rrbldf <- cbind(rrbldf, ndvimx)
rrbldf <- cbind(rrbldf, ndvimn)

write.csv(rrbldf, "RushRanchBlk1_2016.csv")

options(device = "RStudioGD")
ndvi050316us <- unstack(ndvi050316df); colnames(ndvi050316us) <- "NDVI"
ndvi052616us <- unstack(ndvi052616df); colnames(ndvi052616us) <- "NDVI"
ndvi062316us <- unstack(ndvi062316df); colnames(ndvi062316us) <- "NDVI"
ndvi062916us <- unstack(ndvi062916df); colnames(ndvi062916us) <- "NDVI"
ndvi072716us <- unstack(ndvi072716df); colnames(ndvi072716us) <- "NDVI"
ndvi081716us <- unstack(ndvi081716df); colnames(ndvi081716us) <- "NDVI"
ndvi082416us <- unstack(ndvi082416df); colnames(ndvi082416us) <- "NDVI"


ndvi050316p <- ggplot(ndvi050316us, aes(ndvi050316us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi050316p <- ndvi050316p + theme_bw() + geom_vline(aes(xintercept = median(ndvi050316us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi050316p <- ndvi050316p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi082416us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi050316p <- ndvi050316p + labs(title = "Rush Ranch Block 1\nMay 3, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi050316p
ggsave(file = "050316.png")

ndvi052616p <- ggplot(ndvi052616us, aes(ndvi052616us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi052616p <- ndvi052616p + theme_bw() + geom_vline(aes(xintercept = median(ndvi052616us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi052616p <- ndvi052616p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi082416us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi052616p <- ndvi052616p + labs(title = "Rush Ranch Block 1\nMay 26, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi052616p
ggsave(file = "052616.png")

ndvi062316p <- ggplot(ndvi062316us, aes(ndvi062316us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi062316p <- ndvi062316p + theme_bw() + geom_vline(aes(xintercept = median(ndvi062316us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi062316p <- ndvi062316p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi082416us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi062316p <- ndvi062316p + labs(title = "Rush Ranch Block 1\nJune 23, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi062316p
ggsave(file = "062316.png")

ndvi062916p <- ggplot(ndvi062916us, aes(ndvi062916us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi062916p <- ndvi062916p + theme_bw() + geom_vline(aes(xintercept = median(ndvi062916us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi062916p <- ndvi062916p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi082416us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi062916p <- ndvi062916p + labs(title = "Rush Ranch Block 1\nJune 29, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi062916p
ggsave(file = "062916.png")

ndvi072716p <- ggplot(ndvi072716us, aes(ndvi072716us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi072716p <- ndvi072716p + theme_bw() + geom_vline(aes(xintercept = median(ndvi072716us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi072716p <- ndvi072716p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi082416us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi072716p <- ndvi072716p + labs(title = "Rush Ranch Block 1\nJuly 27, 2016 NDVI Values Histogram\n with mean &median", x = "")
ndvi072716p
ggsave(file = "072716.png")

ndvi081716p <- ggplot(ndvi081716us, aes(ndvi081716us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi081716p <- ndvi081716p + theme_bw() + geom_vline(aes(xintercept = median(ndvi081716us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi081716p <- ndvi081716p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi082416us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi081716p <- ndvi081716p + labs(title = "Rush Ranch Block 1\nAugust 17, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi081716p
ggsave(file = "081716.png")

ndvi082416p <- ggplot(ndvi082416us, aes(ndvi082416us$NDVI)) + geom_histogram(binwidth = 2, color = "white", fill = "darkblue")
ndvi082416p <- ndvi082416p + theme_bw() + geom_vline(aes(xintercept = median(ndvi082416us$NDVI, na.rm = T)), color = "#b2df8a")
ndvi082416p <- ndvi082416p + theme(plot.title = element_text(hjust = 0.5)) + geom_vline(aes(xintercept = mean(ndvi082416us$NDVI, na.rm = T)), color = "#fc8d62")
ndvi082416p <- ndvi082416p + labs(title = "Rush Ranch Block 1\nAugust 24, 2016 NDVI Values Histogram\n with mean & median", x = "")
ndvi082416p
ggsave(file = "082416.png")



set.seed(131)
ndvi050316us <- na.omit(ndvi050316us); ndvi050316rs <- sample_n(ndvi050316us, 1000000); ndvi050316rs$Date <- "a"
ndvi052616us <- na.omit(ndvi052616us); ndvi052616rs <- sample_n(ndvi052616us, 1000000); ndvi052616rs$Date <- "b"
ndvi062316us <- na.omit(ndvi062316us); ndvi062316rs <- sample_n(ndvi062316us, 1000000); ndvi062316rs$Date <- "c"
ndvi062916us <- na.omit(ndvi062916us); ndvi062916rs <- sample_n(ndvi062916us, 1000000); ndvi062916rs$Date <- "d"
ndvi072716us <- na.omit(ndvi072716us); ndvi072716rs <- sample_n(ndvi072716us, 1000000); ndvi072716rs$Date <- "e"
ndvi081716us <- na.omit(ndvi081716us); ndvi081716rs <- sample_n(ndvi081716us, 1000000); ndvi081716rs$Date <- "f"
ndvi082416us <- na.omit(ndvi082416us); ndvi082416rs <- sample_n(ndvi082416us, 1000000); ndvi082416rs$Date <- "g"

rrblrs <- rbind(ndvi082416rs, ndvi081716rs)
rrblrs <- rbind(rrblrs, ndvi072716rs)
rrblrs <- rbind(rrblrs, ndvi062916rs)
rrblrs <- rbind(rrblrs, ndvi062316rs)
rrblrs <- rbind(rrblrs, ndvi052616rs)
rrblrs <- rbind(rrblrs, ndvi050316rs)




rrblrsp <- ggplot(rrblrs, aes(x = Date, y = NDVI)) + geom_violin(aes(fill = Date))
rrblrsp <- rrblrsp + scale_fill_brewer(palette="BrBG", labels = c("May 3", "May 26", "June 23", "June 26", "July 27", "Aug 17", "Aug 24"))
rrblrsp <- rrblrsp + xlab("") + theme_bw()+ theme(axis.text.x = element_blank()) + theme(plot.title = element_text(hjust = 0.5))
rrblrsp <- rrblrsp + stat_summary(fun.data=mean_sdl, mult=1, geom="pointrange", color="#bf812d")
rrblrsp <- rrblrsp + labs(title = "Rush Ranch Block 1\n2016 NDVI Values")
rrblrsp
ggsave(file = "rrblrsp2016violin.png")

rrblrsp <- ggplot(rrblrs, aes(x = Date, y = NDVI)) + geom_boxplot(aes(fill = Date))
rrblrsp <- rrblrsp + scale_fill_brewer(palette="BrBG", labels = c("May 3", "May 26", "June 23", "June 26", "July 27", "Aug 17", "Aug 24"))
rrblrsp <- rrblrsp + xlab("") + theme_bw() + theme(axis.text.x = element_blank()) + theme(plot.title = element_text(hjust = 0.5))
rrblrsp <- rrblrsp + labs(title = "Rush Ranch Block 1\n2016 NDVI Values")
rrblrsp
ggsave(file = "rrblrsp2016box.png")


# vioplot(rrblrs$MAY0316, rrblrs$MAY2616, rrblrs$JUN2316, rrblrs$JUN2916, 
#         rrblrs$JUL2716, rrblrs$AUG1716, rrblrs$AUG2416, col = brewer.pal(7,"BrBG") )
# 
# plot(1,1,xlim=c(0,120),ylim=range(c(a,b)),type="n",
#      xlab="",ylab="",axes=FALSE)
# vioplot(rrblrs$MAY0316, at=1, col = "gold", add = TRUE)
# vioplot(rrblrs$MAY2616, at=2, col = "red", add = TRUE)
# 
# axis(side=1,at=1:3,labels=c("first","second","third"))
# axis(side=2)
# vioplot(a,at=1,col="blue",add=TRUE)
# vioplot(b,at=2,col="red",add=TRUE)
# vioplot(c,at=3,col="magenta",add=TRUE)
# 
# 

ggplot(ndvi052616rs$MAY2616,aes()) + geom_violin() 
      


ggplot(vegLengths, aes(length, fill = veg)) + geom_density(alpha = 0.2)




ndvip050316 <- ndvi050316/1000
plot(ndvip050316)

