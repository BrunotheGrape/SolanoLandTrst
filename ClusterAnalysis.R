library(caret); library(dplyr, ggplot2)


d <- read.csv("RushRanchBlk1_2016.1.4.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
de <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)
colnames(de) <- c("avg0503", "mdn0503", "sd0503", "max0503", "min0503", "avg0526", "mdn0526", "sd0526", "max0526", "min0526",
                  "avg0623", "mdn0623", "sd0623", "max0623", "min0623", "avg0629", "mdn0629", "sd0629", "max0629", "min0629",
                  "avg0727", "mdn0727", "sd0503", "max0727", "min0727", "avg0817", "mdn0817", "sd0817", "max0817", "min0817",
                  "avg0824", "mdn0824", "sd0824", "max0824", "min0824")
