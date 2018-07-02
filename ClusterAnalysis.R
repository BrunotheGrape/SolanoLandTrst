library(caret); library(dplyr); library(ggplot2); library(rgl);
library(plotly); library(Cairo)

d <- read.csv("RushRanchBlk1_2016.1.4.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr1 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr1$Column <- 1
dr1$Row <- 4


d <- read.csv("RushRanchBlk1_2016.1.5.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr2 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr2$Column <- 1
dr2$Row <- 5



d <- read.csv("RushRanchBlk1_2016.1.6.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr3 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr3$Column <- 1
dr3$Row <- 6

d <- read.csv("RushRanchBlk1_2016.1.7.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr4 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr4$Column <- 1
dr4$Row <- 7

d <- read.csv("RushRanchBlk1_2016.1.8.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr5 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr5$Column <- 1
dr5$Row <- 8

d <- read.csv("RushRanchBlk1_2016.1.9.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr6 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr6$Column <- 1
dr6$Row <- 9

d <- read.csv("RushRanchBlk1_2016.1.10.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr7 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr7$Column <- 1
dr7$Row <- 10

d <- read.csv("RushRanchBlk1_2016.2.3.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr8 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr8$Column <- 2
dr8$Row <- 3

d <- read.csv("RushRanchBlk1_2016.2.4.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr9 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr9$Column <- 2
dr9$Row <- 4

d <- read.csv("RushRanchBlk1_2016.2.5.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr10 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr10$Column <- 2
dr10$Row <- 5

d <- read.csv("RushRanchBlk1_2016.2.6.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr11 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr11$Column <- 2
dr11$Row <- 6

d <- read.csv("RushRanchBlk1_2016.2.7.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr12 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr12$Column <- 2
dr12$Row <- 7

d <- read.csv("RushRanchBlk1_2016.2.8.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr13 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr13$Column <- 2
dr13$Row <- 8

d <- read.csv("RushRanchBlk1_2016.2.9.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr14 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr14$Column <- 2
dr14$Row <- 9

d <- read.csv("RushRanchBlk1_2016.2.10.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr15 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr15$Column <- 2
dr15$Row <- 10

d <- read.csv("RushRanchBlk1_2016.3.1.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr16 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr16$Column <- 3
dr16$Row <- 1

d <- read.csv("RushRanchBlk1_2016.3.2.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr17 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr17$Column <- 3
dr17$Row <- 2

d <- read.csv("RushRanchBlk1_2016.3.3.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr18 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr18$Column <- 3
dr18$Row <- 3

d <- read.csv("RushRanchBlk1_2016.3.4.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr19 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr19$Column <- 3
dr19$Row <- 4

d <- read.csv("RushRanchBlk1_2016.3.5.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr20 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr20$Column <- 3
dr20$Row <- 5

d <- read.csv("RushRanchBlk1_2016.3.6.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr21 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr21$Column <- 3
dr21$Row <- 6

d <- read.csv("RushRanchBlk1_2016.3.7.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr22 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr22$Column <- 3
dr22$Row <- 7

d <- read.csv("RushRanchBlk1_2016.3.8.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr23 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr23$Column <- 3
dr23$Row <- 8

d <- read.csv("RushRanchBlk1_2016.3.9.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr24 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr24$Column <- 3
dr24$Row <- 9

d <- read.csv("RushRanchBlk1_2016.3.10.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr25 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr25$Column <- 3
dr25$Row <- 10

d <- read.csv("RushRanchBlk1_2016.4.1.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr26 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr26$Column <- 4
dr26$Row <- 1

d <- read.csv("RushRanchBlk1_2016.4.2.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr27 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr27$Column <- 4
dr27$Row <- 2

d <- read.csv("RushRanchBlk1_2016.4.3.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr28 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr28$Column <- 4
dr28$Row <- 3

d <- read.csv("RushRanchBlk1_2016.4.4.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr29 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr29$Column <- 4
dr29$Row <- 4

d <- read.csv("RushRanchBlk1_2016.4.5.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr30 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr30$Column <- 4
dr30$Row <- 5

d <- read.csv("RushRanchBlk1_2016.4.6.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr31 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr31$Column <- 4
dr31$Row <- 6

d <- read.csv("RushRanchBlk1_2016.4.7.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr32 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr32$Column <- 4
dr32$Row <- 7

d <- read.csv("RushRanchBlk1_2016.4.8.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr33 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr33$Column <- 4
dr33$Row <- 8

d <- read.csv("RushRanchBlk1_2016.4.9.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr34 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr34$Column <- 4
dr34$Row <- 9

d <- read.csv("RushRanchBlk1_2016.4.10.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr35 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr35$Column <- 4
dr35$Row <- 10

d <- read.csv("RushRanchBlk1_2016.5.1.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr36 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr36$Column <- 5
dr36$Row <- 1

d <- read.csv("RushRanchBlk1_2016.5.2.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr37 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr37$Column <- 5
dr37$Row <- 2

d <- read.csv("RushRanchBlk1_2016.5.3.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr38 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr38$Column <- 5
dr38$Row <- 3

d <- read.csv("RushRanchBlk1_2016.5.4.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr39 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr39$Column <- 5
dr39$Row <- 4

d <- read.csv("RushRanchBlk1_2016.5.5.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr40 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr40$Column <- 5
dr40$Row <- 5

d <- read.csv("RushRanchBlk1_2016.5.6.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr41 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr41$Column <- 5
dr41$Row <- 6

d <- read.csv("RushRanchBlk1_2016.5.7.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr42 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr42$Column <- 5
dr42$Row <- 7

d <- read.csv("RushRanchBlk1_2016.5.8.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr43 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr43$Column <- 5
dr43$Row <- 8

d <- read.csv("RushRanchBlk1_2016.5.9.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr44 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr44$Column <- 5
dr44$Row <- 9


d <- read.csv("RushRanchBlk1_2016.6.1.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr45 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr45$Column <- 6
dr45$Row <- 1

d <- read.csv("RushRanchBlk1_2016.6.2.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr46 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr46$Column <- 6
dr46$Row <- 2

d <- read.csv("RushRanchBlk1_2016.6.3.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr47 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr47$Column <- 6
dr47$Row <- 3

d <- read.csv("RushRanchBlk1_2016.6.4.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr48 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr48$Column <- 6
dr48$Row <- 4

d <- read.csv("RushRanchBlk1_2016.6.5.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr49 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr49$Column <- 6
dr49$Row <- 5

d <- read.csv("RushRanchBlk1_2016.6.6.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr50 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr50$Column <- 6
dr50$Row <- 6

d <- read.csv("RushRanchBlk1_2016.6.7.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr51 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr51$Column <- 6
dr51$Row <- 7

d <- read.csv("RushRanchBlk1_2016.6.8.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr52 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr52$Column <- 6
dr52$Row <- 8

d <- read.csv("RushRanchBlk1_2016.6.9.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr53 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr53$Column <- 6
dr53$Row <- 9

d <- read.csv("RushRanchBlk1_2016.7.1.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr54 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr54$Column <- 7
dr54$Row <- 1

d <- read.csv("RushRanchBlk1_2016.7.2.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr55 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr55$Column <- 7
dr55$Row <- 2

d <- read.csv("RushRanchBlk1_2016.7.3.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr56 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr56$Column <- 7
dr56$Row <- 3

d <- read.csv("RushRanchBlk1_2016.7.4.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr57 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr57$Column <- 7
dr57$Row <- 4

d <- read.csv("RushRanchBlk1_2016.7.5.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr58 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr58$Column <- 7
dr58$Row <- 5

d <- read.csv("RushRanchBlk1_2016.7.6.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr59 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr59$Column <- 7
dr59$Row <- 6

d <- read.csv("RushRanchBlk1_2016.7.7.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr60 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr60$Column <- 7
dr60$Row <- 7

d <- read.csv("RushRanchBlk1_2016.7.8.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr61 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr61$Column <- 7
dr61$Row <- 8

d <- read.csv("RushRanchBlk1_2016.7.9.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr62 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr62$Column <- 7
dr62$Row <- 9

d <- read.csv("RushRanchBlk1_2016.8.1.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr63 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr63$Column <- 8
dr63$Row <- 1

d <- read.csv("RushRanchBlk1_2016.8.2.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr64 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr64$Column <- 8
dr64$Row <- 2

d <- read.csv("RushRanchBlk1_2016.8.3.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr65 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr65$Column <- 8
dr65$Row <- 3

d <- read.csv("RushRanchBlk1_2016.8.4.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr66 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr66$Column <- 8
dr66$Row <- 4

d <- read.csv("RushRanchBlk1_2016.8.5.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr67 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr67$Column <- 8
dr67$Row <- 5

d <- read.csv("RushRanchBlk1_2016.8.6.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr68 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr68$Column <- 8
dr68$Row <- 6

d <- read.csv("RushRanchBlk1_2016.8.7.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr69 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr69$Column <- 8
dr69$Row <- 7

d <- read.csv("RushRanchBlk1_2016.8.8.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr70 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr70$Column <- 8
dr70$Row <- 8

d <- read.csv("RushRanchBlk1_2016.8.9.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr71 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr71$Column <- 8
dr71$Row <- 9

d <- read.csv("RushRanchBlk1_2016.9.1.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr72 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr72$Column <- 9
dr72$Row <- 1

d <- read.csv("RushRanchBlk1_2016.9.2.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr73 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr73$Column <- 9
dr73$Row <- 2

d <- read.csv("RushRanchBlk1_2016.9.3.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr74 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr74$Column <- 9
dr74$Row <- 3

d <- read.csv("RushRanchBlk1_2016.9.4.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr75 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr75$Column <- 9
dr75$Row <- 4

d <- read.csv("RushRanchBlk1_2016.9.5.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr76 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr76$Column <- 9
dr76$Row <- 5

d <- read.csv("RushRanchBlk1_2016.9.6.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr77 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr77$Column <- 9
dr77$Row <- 6

d <- read.csv("RushRanchBlk1_2016.9.7.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr78 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr78$Column <- 9
dr78$Row <- 7

d <- read.csv("RushRanchBlk1_2016.9.8.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr79 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr79$Column <- 9
dr79$Row <- 8

d <- read.csv("RushRanchBlk1_2016.9.9.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr80 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr80$Column <- 9
dr80$Row <- 9

d <- read.csv("RushRanchBlk1_2016.10.1.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr81 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr81$Column <- 10
dr81$Row <- 1

d <- read.csv("RushRanchBlk1_2016.10.2.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr82 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr82$Column <- 10
dr82$Row <- 2

d <- read.csv("RushRanchBlk1_2016.10.3.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr83 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr83$Column <- 10
dr83$Row <- 3

d <- read.csv("RushRanchBlk1_2016.10.4.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr84 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr84$Column <- 10
dr84$Row <- 4

d <- read.csv("RushRanchBlk1_2016.10.5.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr85 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr85$Column <- 10
dr85$Row <- 5

d <- read.csv("RushRanchBlk1_2016.10.6.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr86 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr86$Column <- 10
dr86$Row <- 6

d <- read.csv("RushRanchBlk1_2016.10.7.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr87 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr87$Column <- 10
dr87$Row <- 7

d <- read.csv("RushRanchBlk1_2016.10.8.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr88 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr88$Column <- 10
dr88$Row <- 8

d <- read.csv("RushRanchBlk1_2016.10.9.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr89 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr89$Column <- 10
dr89$Row <- 9

d <- read.csv("RushRanchBlk1_2016.10.10.csv")
ds <- d[1, 3:7]
ds1 <- d[2, 3:7]
ds2 <- d[3, 3:7]
ds3 <- d[4, 3:7]
ds4 <- d[5, 3:7]
ds5 <- d[6, 3:7]
ds6 <- d[7, 3:7]
dr90 <- as.data.frame(cbind(ds, ds1, ds2, ds3, ds4, ds5, ds6))
dr90$Column <- 10
dr90$Row <- 10

#i <- seq(1:90)
#nm <- as.data.frame(paste("dr", i, sep = "", collapse = ", "))
#write.csv(nm, "nm.csv")

de <- as.data.frame(rbind(dr1, dr2, dr3, dr4, dr5, dr6, dr7, dr8, dr9, dr10, dr11, dr12,
            dr13, dr14, dr15, dr16, dr17, dr18, dr19, dr20, dr21, dr22, 
            dr23, dr24, dr25, dr26, dr27, dr28, dr29, dr30, dr31, dr32, 
            dr33, dr34, dr35, dr36, dr37, dr38, dr39, dr40, dr41, dr42,
            dr43, dr44, dr45, dr46, dr47, dr48, dr49, dr50, dr51, dr52,
            dr53, dr54, dr55, dr56, dr57, dr58, dr59, dr60, dr61, dr62,
            dr63, dr64, dr65, dr66, dr67, dr68, dr69, dr70, dr71, dr72,
            dr73, dr74, dr75, dr76, dr77, dr78, dr79, dr80, dr81, dr82,
            dr83, dr84, dr85, dr86, dr87, dr88, dr89, dr90))


colnames(de) <- c("avg0503", "mdn0503", "sd0503", "max0503", "min0503", "avg0526", "mdn0526", "sd0526", "max0526", "min0526",
                  "avg0623", "mdn0623", "sd0623", "max0623", "min0623", "avg0629", "mdn0629", "sd0629", "max0629", "min0629",
                  "avg0727", "mdn0727", "sd0503", "max0727", "min0727", "avg0817", "mdn0817", "sd0817", "max0817", "min0817",
                  "avg0824", "mdn0824", "sd0824", "max0824", "min0824", "Column", "Row")

write.csv(de, file = "de.csv")

# dedv <- as.data.frame(read.csv(file = "dedv.csv", header = T))
# dedv[] <- lapply(dedv, function(x) as.numeric(as.character(x)))
# x <- dedv$Row
# y <- dedv$Column
# z <- dedv$sd0503
# dedv[] <- lapply(dedv, function(x) as.numeric(as.character(x)))
# msd0503 <- as.matrix(select(dedv, Row, Column, sd0503))

#x <- msd0503$Row
#y <- msd0503$Column
#z <- msd0503$sd0503

            
#persp(x, y, z )

#df <- volcano
msd0503 <- as.matrix(read.csv(file = "dedvMtxsd0503.csv", header = FALSE))

#jpeg(filename = "~/Documents/Data_Science/SolanoLandTrst/msd0503.jpeg")
jpeg('msd0503.jpeg')
z <- 2 * msd0503
x <- 10 * (1:nrow(z))
y <- 10 * (1:ncol(z))
zlim <- range(z)
zlen <- zlim[2] - zlim[1] + 1
colorlut <- terrain.colors(zlen)
col <- colorlut[ z-zlim[1]+1 ]
rgl.open()
rgl.surface(x, y, z, color=col, back="lines")
#dev.copy(x11)
dev.off()
#savePlot("msd0503.png", type = c("png"), device = dev.cur())