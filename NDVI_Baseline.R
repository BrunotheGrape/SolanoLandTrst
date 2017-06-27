library(tiff); library(raster); library(rgdal); library(sp) 
library(ggplot2); library(rasterVis)

imgr <- raster("https://s3.amazonaws.com/share-terravion-com/solanolandtrust/2016-02-25_2310-34_7c98a49f-e6f0-499c-8016-afdac6c58641_Solano-Rush-Ranch-_TIRS_T_4326.tiff")

wlc1 <- raster("https://s3.amazonaws.com/share-terravion-com/solanolandtrust/2016-07-05_1746-30_a651f248-3fdc-4c24-9f53-ef3323596250_Wallace_Brazelton-0121150110_NDVI_N-R3_4326.tiff")
wlc2 <- raster("https://s3.amazonaws.com/share-terravion-com/solanolandtrust/2016-07-05_1750-55_d7b6d3ce-8136-4d4a-a2f2-743f3dc719ad_Wallace_Brazelton-0121150130_NDVI_N-R3_4326.tiff")
