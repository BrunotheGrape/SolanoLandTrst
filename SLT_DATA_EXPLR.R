# SLT data exploration
# reading in RDM data sets
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


#reading Wilcox Data
library(ggplot2); library(dplyr)
WCX_1 <- read.csv("WILCOX-1_Barbour_VegData_2002_DA.csv", header = FALSE, stringsAsFactors = FALSE)


# transpose columns to rows
WCX_1 <- as.data.frame(t(WCX_1))
# remove empty column V47
WCX_1 <- select(WCX_1, -c(V47))
#rename column headers and eliminate unwanted rows and columns
write.table(WCX_1, file = "WCX_1.csv", sep = ",")
WCX_1DA <- read.csv("WCX_1.csv", header = TRUE, skip = 1)
WCX_1DA <- WCX_1DA[1:26,2:148]

#add variable for approximate pool volume
WCX_1DA <- mutate(WCX_1DA, Pool_Vmn = Pool_lengt * Pool_width * Max_depth)

#plot number of species against pool volume
pv <- ggplot(data = WCX_1DA, aes(Pool_Vmn, Number.of.species)) + geom_point()
pv <- pv + xlab("Pool Volume") +ylab("Number or Species") 
pv <- pv + geom_smooth(method = lm, formula = y ~ x)
pv

#plot number of species against elevation
pe <- ggplot(data = WCX_1DA, aes(Rela_elev, Number.of.species)) + geom_point()
pe <- pe + xlab("Relative Elevation") +ylab("Number or Species")
pe

# plot number of species against Cov_soil
ps <- ggplot(data = WCX_1DA, aes(Cov_soil, Number.of.species)) + geom_point()
ps <- ps + xlab("Soil") +ylab("Number or Species")
ps


# fit a linear model to Pool Volume and Number of Species
mod.fit <- lm(Number.of.species ~ Pool_Vmn, data = WCX_1DA)
summary(mod.fit)
#results are not significant


# read in SFBFMWQ and trim data
library(dplyr); library(ggplot2); library(caret); library(gridExtra); library(corrplot)
WQ.Data <- read.csv("SFBFMWQ.csv", header = TRUE, skip = 2)
WQ.Data <- WQ.Data[1:84101, ]

# predict disolved oxygen (DO_pct). Predictors are temperature, salinity, depth, ph, and turbidity (Temp, Sal, Depth, pH, Turb )

fit.DO <- lm(DO_pct ~ Temp +Sal + Depth + pH + Turb, data = WQ.Data)
summary(fit.DO)
confint(fit.DO)



#plot variables against Disolved Oxygen
pT <- ggplot(WQ.Data, aes(Temp, DO_pct)) 
pT <- pT + geom_point(colour = "dark blue", alpha = .3) 
pT <- pT + geom_point(colour = "red", alpha = .0098) 
pT <- pT + geom_point(colour = "white", alpha = .005) 
pT <- pT + geom_smooth(method = lm, formula = y ~ x)
pT <- pT + xlab("Temperature") + ylab("Disolved Oxygen pct")
ggsave(file = "Temp_DO.png")

pS <- ggplot(WQ.Data, aes(Sal, DO_pct))
pS <- pS + geom_point(colour = "dark blue", alpha = .3) 
pS <- pS + geom_point(colour = "red", alpha = .0098) 
pS <- pS + geom_point(colour = "white", alpha = .005) 
pS <- pS + geom_smooth(method = lm, formula = y ~ x)
pS <- pS + xlab("Salinity") + ylab("Disolved Oxygen pct")
ggsave(file = "Sal_DO.png")

pD <- ggplot(WQ.Data, aes(Depth, DO_pct))
pD <- pD + geom_point(colour = "dark blue", alpha = .3) 
pD <- pD + geom_point(colour = "red", alpha = .0098) 
pD <- pD + geom_point(colour = "white", alpha = .005) 
pD <- pD + geom_smooth(method = lm, formula = y ~ x)
pD <- pD + xlab("Depth") + ylab("Disolved Oxygen pct")
ggsave(file = "Depth_DO.png")

ppH <- ggplot(WQ.Data, aes(pH, DO_pct))
ppH <- ppH + geom_point(colour = "dark blue", alpha = .3) 
ppH <- ppH + geom_point(colour = "red", alpha = .0098) 
ppH <- ppH + geom_point(colour = "white", alpha = .005) 
ppH <- ppH + geom_smooth(method = lm, formula = y ~ x)
ppH <- ppH + xlab("pH") + ylab("Disolved Oxygen pct")
ggsave(file = "pH_DO.png")

pTrb <- ggplot(WQ.Data, aes(Turb, DO_pct))
pTrb <- pTrb + geom_point(colour = "dark blue", alpha = .3) 
pTrb <- pTrb + geom_point(colour = "red", alpha = .0098) 
pTrb <- pTrb + geom_point(colour = "white", alpha = .005) 
pTrb <- pTrb + geom_smooth(method = lm, formula = y ~ x)
pTrb <- pTrb + xlab("Turbidity") + ylab("Disolved Oxygen pct")
ggsave(file = "Turb_DO.png")

# modeling individual variables and ploting the residuals
fit.DOT <- lm(DO_pct ~ Temp, data = WQ.Data)
summary(fit.DOT)

fit.SAL<- lm(DO_pct ~ Sal, data = WQ.Data)
summary(fit.SAL)

fit.DPT<- lm(DO_pct ~ Depth, data = WQ.Data)
summary(fit.DPT)

fit.pH<- lm(DO_pct ~ pH, data = WQ.Data)
summary(fit.pH)

fit.TRB<- lm(DO_pct ~ Turb, data = WQ.Data)
summary(fit.TRB)

rDOT <- ggplot(fit.DOT, aes(.fitted, .resid))
rDOT <- rDOT + geom_point(colour = "forest green", alpha = .3)
rDOT <- rDOT + geom_point(colour = "dark blue", alpha = .0098)
rDOT <- rDOT + geom_point(colour = "blue", alpha = .0095) 
rDOT <- rDOT + geom_point(colour = "white", alpha = .005) 
rDOT <- rDOT + geom_hline(yintercept = 0, lwd = 1.5, colour = "slateblue") 
rDOT <- rDOT + xlab("Fitted Values") + ylab("Residuals") 
rDOT <- rDOT + ggtitle("Temperature")
ggsave(file = "Temp_DOr.png")
rDOT

rSAL <- ggplot(fit.SAL, aes(.fitted, .resid))
rSAL <- rSAL + geom_point(colour = "forest green", alpha = .3)
rSAL <- rSAL + geom_point(colour = "dark blue", alpha = .0098)
rSAL <- rSAL + geom_point(colour = "blue", alpha = .0095) 
rSAL <- rSAL + geom_point(colour = "white", alpha = .005) 
rSAL <- rSAL + geom_hline(yintercept = 0, lwd = 1.5, colour = "slateblue") 
rSAL <- rSAL + xlab("Fitted Values") + ylab("Residuals")
rSAL <- rSAL + ggtitle("Salinity")
ggsave("Sal_DOr.png")
rSAL

rDPT <- ggplot(fit.DPT, aes(.fitted, .resid))
rDPT <- rDPT + geom_point(colour = "forest green", alpha = .3)
rDPT <- rDPT + geom_point(colour = "dark blue", alpha = .0098)
rDPT <- rDPT + geom_point(colour = "blue", alpha = .0095) 
rDPT <- rDPT + geom_point(colour = "white", alpha = .005) 
rDPT <- rDPT + geom_hline(yintercept = 0, lwd = 1.5, colour = "slateblue") 
rDPT <- rDPT + xlab("Fitted Values") + ylab("Residuals")
rDPT <- rDPT + ggtitle("Depth")
ggsave("Depth_DOr.png")
rDPT

rpH <- ggplot(fit.pH, aes(.fitted, .resid))
rpH <- rpH + geom_point(colour = "forest green", alpha = .3)
rpH <- rpH + geom_point(colour = "dark blue", alpha = .0098)
rpH <- rpH + geom_point(colour = "blue", alpha = .0095) 
rpH <- rpH + geom_point(colour = "white", alpha = .005) 
rpH <- rpH + geom_hline(yintercept = 0, lwd = 1.5, colour = "slateblue") 
rpH <- rpH + xlab("Fitted Values") + ylab("Residuals")
rpH <- rpH + ggtitle("pH")
ggsave("pH_DOr.png")
rpH

rTRB <- ggplot(fit.TRB, aes(.fitted, .resid))
rTRB <- rTRB + geom_point(colour = "forest green", alpha = .3)
rTRB <- rTRB + geom_point(colour = "dark blue", alpha = .0098)
rTRB <- rTRB + geom_point(colour = "blue", alpha = .0095) 
rTRB <- rTRB + geom_point(colour = "white", alpha = .005) 
rTRB <- rTRB + geom_hline(yintercept = 0, lwd = 1.5, colour = "slateblue") 
rTRB <- rTRB + xlab("Fitted Values") + ylab("Residuals")
rTRB <- rTRB + ggtitle("Turbidity")
ggsave("Turb_DOr.png")
rTRB

# checking the correlations between predictor variables 
cc <- WQ.Data[,c("Temp","Sal", "Depth", "pH", "Turb")]
cm <- cor(cc, use = "complete")
cm

# there is a moderately strong correlation between turbidity and salinity
# create interaction variable and compare correlations
WQ.Int <- mutate(WQ.Data, sltrb = Sal * Turb)
fit.sST <- lm(DO_pct ~ sltrb + Sal + Turb, data = WQ.Int)
summary(fit.sST)

fit.sT <- lm(DO_pct ~ sltrb, data = WQ.Int)
summary(fit.sT)

#plot of new salinity/turbidity variable as predictors of disolved oxygen
pSlt <- ggplot(WQ.Int, aes(sltrb, DO_pct))
pSlt <- pSlt + geom_point(colour = "dark blue", alpha = .3) 
pSlt <- pSlt + geom_point(colour = "red", alpha = .0098) 
pSlt <- pSlt + geom_point(colour = "white", alpha = .005) 
pSlt <- pSlt + geom_smooth(method = lm, formula = y ~ x)
pSlt <- pSlt + xlab("Salinity and Turbidity") + ylab("Disolved Oxygen pct")
ggsave(file = "psT_DO.png")
pSlt

# residual plot of new salinity/turbidity variable

rSlt <- ggplot(fit.sT, aes(.fitted, .resid))
rSlt <- rSlt + geom_point(colour = "forest green", alpha = .3)
rSlt <- rSlt + geom_point(colour = "dark blue", alpha = .0098)
rSlt <- rSlt + geom_point(colour = "blue", alpha = .0095) 
rSlt <- rSlt + geom_point(colour = "white", alpha = .005) 
rSlt <- rSlt + geom_hline(yintercept = 0, lwd = 1.5, colour = "slateblue") 
rSlt <- rSlt + xlab("Fitted Values") + ylab("Residuals")
rSlt <- rSlt + ggtitle("Salinity and Turbidity")
ggsave("psT_DOr.png")
rSlt


#data transformations
fit.DOpH2 <- lm(DO_pct ~ pH + I(pH^2), WQ.Data)
summary(fit.DOpH2)
par(mfrow = c(2, 2))
par(mar = rep(2, 4))
plot(fit.DOpH2)

rDOpH2 <- ggplot(fit.DOpH2, aes(.fitted, .resid))
rDOpH2 <- rDOpH2 + geom_point(colour = "forest green", alpha = .3)
rDOpH2 <- rDOpH2 + geom_point(colour = "dark blue", alpha = .0098)
rDOpH2 <- rDOpH2 + geom_point(colour = "blue", alpha = .0095) 
rDOpH2 <- rDOpH2 + geom_point(colour = "white", alpha = .005) 
rDOpH2 <- rDOpH2 + geom_hline(yintercept = 0, lwd = 1.5, colour = "slateblue") 
rDOpH2 <- rDOpH2 + xlab("Fitted Values") + ylab("Residuals")
rDOpH2 <- rDOpH2 + ggtitle("pH squared")
rDOpH2

fit.DOpH3 <- lm(DO_pct ~ poly(pH, 3), WQ.Data, use = "complete")
summary(fit.DOpH3)
par(mfrow = c(2, 2))
par(mar = rep(2, 4))
plot(fit.DOpH3)