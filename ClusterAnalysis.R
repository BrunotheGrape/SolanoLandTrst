library(caret); library(dplyr, ggplot2)

d <- read.csv("RushRanchBlk1_2016.1.4.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr1 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)


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

d <- read.csv("RushRanchBlk1_2016.1.7.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr4 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.1.8.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr5 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.1.9.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr6 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.1.10.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr7 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.2.3.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr8 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.2.4.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr9 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.2.5.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr10 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.2.6.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr11 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.2.7.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr12 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.2.8.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr13 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.2.9.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr14 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.2.10.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr15 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.3.1.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr16 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.3.2.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr17 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.3.3.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr18 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.3.4.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr19 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.3.5.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr20 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.3.6.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr21 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.3.7.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr22 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.3.8.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr23 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.3.9.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr24 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.3.10.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr25 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.4.1.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr26 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.4.2.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr27 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.4.3.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr28 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.4.4.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr29 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.4.5.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr30 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.4.6.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr31 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.4.7.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr32 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.4.8.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr33 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.4.9.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr34 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.4.10.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr35 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.5.1.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr36 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.5.2.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr37 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.5.3.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr38 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.5.4.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr39 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.5.5.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr40 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.5.6.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr41 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.5.7.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr42 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.5.8.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr43 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.5.9.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr44 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)


d <- read.csv("RushRanchBlk1_2016.6.1.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr45 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.6.2.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr46 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.6.3.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr47 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.6.4.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr48 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.6.5.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr49 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.6.6.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr50 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.6.7.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr51 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.6.8.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr52 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.6.9.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr53 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.7.1.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr54 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.7.2.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr55 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.7.3.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr56 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.7.4.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr57 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.7.5.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr58 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.7.6.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr59 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.7.7.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr60 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.7.8.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr61 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.7.9.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr62 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.8.1.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr63 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.8.2.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr64 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.8.3.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr65 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.8.4.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr66 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.8.5.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr67 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.8.6.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr68 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.8.7.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr69 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.8.8.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr70 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.8.9.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr71 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.9.1.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr72 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.9.2.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr73 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.9.3.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr74 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.9.4.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr75 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.9.5.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr76 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.9.6.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr77 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.9.7.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr78 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.9.8.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr79 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.9.9.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr80 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.10.1.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr81 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.10.2.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr82 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.10.3.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr83 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.10.4.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr84 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.10.5.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr85 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.10.6.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr86 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.10.7.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr87 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.10.8.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr88 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.10.9.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr89 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

d <- read.csv("RushRanchBlk1_2016.10.10.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr90 <- cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6)

i <- seq(1:98)
nm <- as.data.frame(paste("dr", i, sep = "", collapse = ", "))
write.csv(nm, "nm.csv")

de <- rbind(dr1, dr2, dr3, dr4, dr5, dr6, dr7, dr8, dr9, dr10, dr11, dr12,
            dr13, dr14, dr15, dr16, dr17, dr18, dr19, dr20, dr21, dr22, 
            dr23, dr24, dr25, dr26, dr27, dr28, dr29, dr30, dr31, dr32, 
            dr33, dr34, dr35, dr36, dr37, dr38, dr39, dr40, dr41, dr42,
            dr43, dr44, dr45, dr46, dr47, dr48, dr49, dr50, dr51, dr52,
            dr53, dr54, dr55, dr56, dr57, dr58, dr59, dr60, dr61, dr62,
            dr63, dr64, dr65, dr66, dr67, dr68, dr69, dr70, dr71, dr72,
            dr73, dr74, dr75, dr76, dr77, dr78, dr79, dr80, dr81, dr82,
            dr83, dr84, dr85, dr86, dr87, dr88, dr89, dr90)


colnames(de) <- c("avg0503", "mdn0503", "sd0503", "max0503", "min0503", "avg0526", "mdn0526", "sd0526", "max0526", "min0526",
                  "avg0623", "mdn0623", "sd0623", "max0623", "min0623", "avg0629", "mdn0629", "sd0629", "max0629", "min0629",
                  "avg0727", "mdn0727", "sd0503", "max0727", "min0727", "avg0817", "mdn0817", "sd0817", "max0817", "min0817",
                  "avg0824", "mdn0824", "sd0824", "max0824", "min0824")

write.csv(de, "de.csv")
