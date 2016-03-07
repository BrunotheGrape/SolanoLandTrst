# SLT data exploration
# reading in data sets
library(xlsx); library(dplyr); library(ggplot2)
#RDM2011 <- read.csv("2011_RDM.csv", header = TRUE)
#SFB <- read.csv("SFBFMWQ.csv", header = TRUE)
#RDM2009 <- read.xlsx2("2009_RDM.xls", 1)
RDM09 <- read.csv("2009_RDMDA.csv", header = TRUE)
RDM10 <- read.csv("2010_RDMDA.csv", header = TRUE)
RDM11 <- read.csv("2011_RDMDA.csv", header = TRUE)
#BotB02 <- read.csv("BotanyBlitz_Wilcox_2002_da.csv", header = FALSE)

# combining RDM data sets for analysis
# remove comments field and gratuitus columns added by excel. Add column for factor variable indicating the year.
RDMLGTD <- select(RDM11, -c(Comments))
RDMLGTD$YR <- "X11"
RDMLG09 <- select(RDM09, -c(Comments, X, X.1, X.2) )
RDMLG09$YR <- "X09"
RDMLG09 <- RDMLG09[1:37,]
RDMLG10 <- select(RDM10, c(Plot.., Grass.Ht., Green.Foliage, Litter, Bare.Soil, Pasture.RDM.Avg, Dry.Wt.......7.gr. ))
# convert factor and character variables to numeric for RDMLG10
RDMLG10$rDM.Cond..Number..1.5. <- as.numeric(RDMLG10$rDM.Cond..Number..1.5.)
RDMLG10$wt.minus.bag <- as.numeric(RDMLG10$wt.minus.bag)
RDMLG10$X.lab..Phytomass.pounds.ac..gx96. <- as.numeric(RDMLG10$X.lab..Phytomass.pounds.ac..gx96.)
RDMLG10$X7..month.for.one.mo. <- as.numeric(RDMLG10$X7..month.for.one.mo.)

RDMLG10$X.1 <- "NA"; RDMLG10$X.2 <- "NA"; RDMLG10$X.3 <- "NA"
RDMLG10$YR <- "X10"

# making the column names consistent
ch <- names(RDMLGTD)
colnames(RDMLG09) <- ch; colnames(RDMLG10) <- ch


#combining data sets

RDMLGTD <- rbind(RDMLGTD, RDMLG10); RDMLGTD <- rbind(RDMLGTD, RDMLG09)

#first level summary metrics

c09 <- colSums(filter(RDMLGTD[,2:10], "YR" == "X09"), na.rm = TRUE)
c10 <- colSums(filter(RDMLGTD[,2:10], "YR" == "X10"), na.rm = TRUE)
c11 <- colSums(filter(RDMLGTD[,2:10], "YR" == "X11"), na.rm = TRUE)

cS <- rbind(c11, c10)
cS <- rbind(cS, c09)
cS
