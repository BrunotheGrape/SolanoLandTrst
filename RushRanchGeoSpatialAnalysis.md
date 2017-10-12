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






```
Error in image(ndvi082416) : object 'ndvi082416' not found
```
