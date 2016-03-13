# SLT data exploration
# reading in data sets
library(xlsx); library(dplyr); library(ggplot2); library(xtable)

#SFB <- read.csv("SFBFMWQ.csv", header = TRUE)
#RDM2009 <- read.xlsx2("2009_RDM.xls", 1)
RDM09 <- read.csv("2009_RDMDA.csv", header = TRUE, stringsAsFactors = FALSE)
RDM10 <- read.csv("2010_RDMDA.csv", header = TRUE, stringsAsFactors = FALSE)
RDM11 <- read.csv("2011_RDMDA.csv", header = TRUE, stringsAsFactors = FALSE)
#BotB02 <- read.csv("BotanyBlitz_Wilcox_2002_da.csv", header = FALSE)

# combining RDM data sets for analysis
# remove comments field and gratuitus columns added by excel. Add column for factor variable indicating the year.
RDMLGTD <- select(RDM11, -c(Comments))
RDMLGTD$YR <- "X11"
RDMLG09 <- select(RDM09, -c(Comments, X, X.1, X.2) )
RDMLG09$YR <- "X09"
RDMLG09 <- RDMLG09[1:37,]
RDMLG10 <- select(RDM10, c(Plot.., Grass.Ht., Green.Foliage, Litter, Bare.Soil, Pasture.RDM.Avg, Dry.Wt.......7.gr. ))


RDMLG10$X.1 <- "NA"; RDMLG10$X.2 <- "NA"; RDMLG10$X.3 <- "NA"
RDMLG10$YR <- "X10"

# making the column names consistent
ch <- names(RDMLGTD)
colnames(RDMLG09) <- ch; colnames(RDMLG10) <- ch


#combining data sets

RDMLGTD <- rbind(RDMLGTD, RDMLG10); RDMLGTD <- rbind(RDMLGTD, RDMLG09)
# classify columns
RDMLGTD$YR <- as.factor(RDMLGTD$YR)
RDMLGTD$wt.minus.bag <- as.numeric(RDMLGTD$wt.minus.bag)
RDMLGTD$X.lab..Phytomass.pounds.ac..gx96. <- as.numeric(RDMLGTD$X.lab..Phytomass.pounds.ac..gx96.)
RDMLGTD$X7..month.for.one.mo. <- as.numeric(RDMLGTD$X7..month.for.one.mo.)

nn <- c("Waypoint", "Height in Inches", "Green Foliage", "Litter", "Bare Soil, Gravel and Rocks", "rDM Condition", "Bag Weight, Oven Dry", "Weigh Minus Bag", "X Lab Phytomass: Lbs", "7% per Month", "YR")
colnames(RDMLGTD) <- nn
#first level summary metrics

# column sums
SumYR09 <- subset(RDMLGTD, YR == "X09")
SumYR09 <- colSums(SumYR09[, 2:10], na.rm = TRUE)
SumYR10 <- subset(RDMLGTD, YR == "X10")
SumYR10 <- colSums(SumYR10[, 2:10], na.rm = TRUE)
SumYR11 <- subset(RDMLGTD, YR == "X11")
SumYR11 <- colSums(SumYR11[, 2:10], na.rm = TRUE)

cS <- rbind(SumYR11, SumYR10)
cS <- rbind(cS, SumYR09)
cS 

#column means
MeanYR09 <- subset(RDMLGTD, YR == "X09")
MeanYR09 <- colMeans(MeanYR09[, 2:10], na.rm = TRUE)
MeanYR10 <- subset(RDMLGTD, YR == "X10")
MeanYR10 <- colMeans(MeanYR10[, 2:10], na.rm = TRUE)
MeanYR11 <- subset(RDMLGTD, YR == "X11")
MeanYR11 <- colMeans(MeanYR11[, 2:10], na.rm = TRUE)

cM <- rbind(MeanYR11, MeanYR10)
cM <- rbind(cM, MeanYR09)
cM
