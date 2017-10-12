RushRanchGeoSpatialAnalysis
========================================================
author: 
date: 
autosize: true

First Slide
========================================================

For more details on authoring R presentations please visit <https://support.rstudio.com/hc/en-us/articles/200486468>.

- Bullet 1
- Bullet 2
- Bullet 3

Read in NDVI file and get its extent (size)
========================================================


```r
library(tiff); library(raster); library(rgdal); library(sp) 
library(ggplot2); library(rasterVis); library(date)
library(caret); library(dplyr); library(vioplot); library(RColorBrewer)


dt <- as.Date(c("2016-05-03", "2016-05-26", "2016-06-23", "2016-06-29", "2016-07-27", "2016-08-17", "2016-08-24"))
dt <- data.frame(Date = dt)


#NDVI

imNDVI050316 <- raster('Rush-Ranch-Block-1_NDVI_05032016.tiff')

imNDVI050316 <- setMinMax(imNDVI050316)
imNDVI050316@extent
```

```
class       : Extent 
xmin        : -122.0404 
xmax        : -122.0355 
ymin        : 38.21149 
ymax        : 38.21344 
```

NDVI image
========================================================

![plot of chunk unnamed-chunk-2](RushRanchGeoSpatialAnalysis-figure/unnamed-chunk-2-1.png)

Metrics
=========================================================





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
```

