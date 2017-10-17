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

#NDVI

imNDVI050316 <- raster('Rush-Ranch-Block-1_NDVI_05032016.tiff')

imNDVI050316 <- setMinMax(imNDVI050316)
```


File Structure
=====================================================

```r
imNDVI050316
```

```
class       : RasterLayer 
dimensions  : 798, 2016, 1608768  (nrow, ncol, ncell)
resolution  : 2.441039e-06, 2.441039e-06  (x, y)
extent      : -122.0404, -122.0355, 38.21149, 38.21344  (xmin, xmax, ymin, ymax)
coord. ref. : +proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0 
data source : /Users/boydingalls/Documents/Data_Science/SolanoLandTrst/Rush-Ranch-Block-1_NDVI_05032016.tiff 
names       : Rush.Ranch.Block.1_NDVI_05032016 
values      : 2, 147  (min, max)
```



NDVI image
========================================================

![plot of chunk unnamed-chunk-3](RushRanchGeoSpatialAnalysis-figure/unnamed-chunk-3-1.png)

Metrics
=========================================================


```
         Avg Median  Std Dev Max Min
[1,] 76.6016     77 18.39165 147   2
```


Histogram
==============================================================

The Code



The Result
============================================================
![plot of chunk unnamed-chunk-6](RushRanchGeoSpatialAnalysis-figure/unnamed-chunk-6-1.png)

Divide Image
=============================================================

