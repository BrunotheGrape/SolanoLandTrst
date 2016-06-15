#NDVI Data Analysis

set.seed(1235)
NTS <- read.csv("NDVI_SITE_DATA.csv", header = TRUE)
NTS$Month <- factor(NTS$Month, levels = c("Jan", "Feb", "Mar", "Apr",
                                          "May", "Jun", "Jul", "Aug",
                                          "Sep", "Oct", "Nov", "Dec"))

library(caret); library(ggplot2); library(dplyr)

#plot of data
Nx <- ggplot(NTS, aes(Month, NDVI)) + geom_point(aes(color = Year))
Nx

#training sets
Y1 <- c("2011", "2012")
Y2 <- c("2012", "2013")
Y3 <- c("2011", "2013")
Trn1 <- filter(NTS, Year %in% Y1)
Trn2 <- filter(NTS, Year %in% Y2)
Trn3 <- filter(NTS, Year %in% Y3)
Tst1 <- filter(NTS, Year == "2013")
Tst2 <- filter(NTS, Year == "2011")
Tst3 <- filter(NTS, Year == "2012")

featurePlot(x=Trn1[,c("Month", "Avg.AUMs",
                 "Precipitation", "Avg..Temp..F.")],
            y = Trn1$NDVI,
            plot="pairs")





lmodFit1 <- lm(NDVI ~ Month + Avg.AUMs + 
                 Precipitation + Avg..Temp..F.,data=Trn1)
lmodFit2 <- lm(NDVI ~ Month + Avg.AUMs + 
                 Precipitation + Avg..Temp..F.,data=Trn2)
lmodFit3 <- lm(NDVI ~ Month + Avg.AUMs + 
                 Precipitation + Avg..Temp..F.,data=Trn3)



modFit1 <- train(NDVI ~ Month + Avg.AUMs + 
                   Precipitation + Avg..Temp..F.,data=Trn1, 
                 method = "glm")
modFit2 <- train(NDVI ~ Month + Avg.AUMs + 
                   Precipitation + Avg..Temp..F.,data=Trn2, 
                 method = "glm")
modFit3 <- train(NDVI ~ Month + Avg.AUMs + 
                   Precipitation + Avg..Temp..F.,data=Trn3, 
                 method = "glm")


prd1 <- predict(modFit1, Tst1)
prd2 <- predict(modFit2, Tst2)
prd3 <- predict(modFit3, Tst3)

lprd1 <- predict(lmodFit1, Tst1)
lprd2 <- predict(lmodFit2, Tst2)
lprd3 <- predict(lmodFit3, Tst3)




