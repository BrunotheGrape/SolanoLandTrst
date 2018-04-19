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


d <- read.csv("RushRanchBlk1_2016.1.5.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr2 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)


d <- read.csv("RushRanchBlk1_2016.1.6.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr3 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.1.6.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr4 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.1.7.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr5 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.1.8.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr6 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.1.9.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr7 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.1.10.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr8 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.2.1.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr9 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.2.2.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr10 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.2.3.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr11 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.2.4.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr12 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.2.5.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr13 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.2.6.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr14 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.2.7.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr15 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.2.8.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr16 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.2.9.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr17 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.2.10.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr18 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.3.1.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr19 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.3.2.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr20 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.3.3.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr21 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.3.4.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr22 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.3.5.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr23 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.3.6.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr24 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.3.7.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr25 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.3.8.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr26 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.3.9.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr27 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.3.10.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr28 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.4.1.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr29 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.4.2.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr30 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.4.3.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr31 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.4.4.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr32 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.4.5.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr33 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.4.6.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr34 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.4.7.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr35 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.4.8.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr36 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.4.9.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr37 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.4.10.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr38 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)




de <- rbind(de, dr2, dr3, dr4, dr5, dr6, dr7, dr8)



colnames(de) <- c("avg0503", "mdn0503", "sd0503", "max0503", "min0503", "avg0526", "mdn0526", "sd0526", "max0526", "min0526",
                  "avg0623", "mdn0623", "sd0623", "max0623", "min0623", "avg0629", "mdn0629", "sd0629", "max0629", "min0629",
                  "avg0727", "mdn0727", "sd0503", "max0727", "min0727", "avg0817", "mdn0817", "sd0817", "max0817", "min0817",
                  "avg0824", "mdn0824", "sd0824", "max0824", "min0824")