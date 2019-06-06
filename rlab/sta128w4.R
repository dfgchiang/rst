# Stat 128 Week 4 Classroom Lecture
# 20190218 dchiang
pr <- function(s){
  print(s)
}

## RUNNING SUMS
x <- c(10,3,4,6,8)
xover5sum <- sum(x[which(x>5)])
xgt5sum <- 0
dosum <- function(x){
  for (i in 1:length(x)){
    if (x[i] > 5){
      xgt5sum <- xgt5sum + x[i]
      cat('xgt5sum=', xgt5sum)
      readline(prompt='Next?')
    }
  }
  if (xgt5sum == xover5sum){
    print('xgt5sum eq xover5sum')
  }
}
dosum(x)

## PLOTTING
x.coord <- c(0,1,5)
y.coord <- c(-3,2,7)
plot(x.coord,y.coord, type = 'b', ylab = 'Years on earth',
     xlab = 'Height of aliens', main = 'My Graph',
     ylim = c(0,10))

## CURVES
myfun <- function(x){
  x^3 - x*3
}
curve(myfun, from = -4, to= 4)
# Add to existing curve
curve(2^x*5, from = 1, to = 5, add= TRUE)
points(1,7)
points(1,1) # , 'hello'


## IMPORT DATA using readr
library(readr)
classBeverage <- read_csv("https://www.csus.edu/indiv/n/norrisa/statcomp/classBeverage.csv")
View(classBeverage)

ClassfavoriteNumData <- read_csv("https://www.csus.edu/indiv/n/norrisa/statcomp/ClassfavoriteNumData.csv")
View(ClassfavoriteNumData)

## Import Exdel by readxl
library(readxl)
url <- "https://www.csus.edu/indiv/n/norrisa/statcomp/ClassBeverage.xlsx"
destfile <- "ClassBeverage.xlsx"
curl::curl_download(url, destfile)
ClassBeverage <- read_excel(destfile)
View(ClassBeverage)

## Messy data
library(readr)
ClassfavoriteNumDataMessy2 <- read_csv("https://www.csus.edu/indiv/n/norrisa/statcomp/ClassfavoriteNumDataMessy2.csv")
View(ClassfavoriteNumDataMessy2)

## MERGE ##
alldata <- merge(classBeverage, ClassfavoriteNumData)
alldata$xformNumPets <- sqrt(alldata$NumPets)
alldata$PetIndicator <- ifelse(alldata$NumPets>0, "Y", "N")
alldata
alldata$CoffeeorTea[1] <- NA
complete.cases(alldata)
alldata[complete.cases(alldata),]
alldata

## IFELSE TEST ##
ifelse(c(1,2,3,5,7) > 5, "yes", "no")

## SCATTER PLOT MATRIX ##
library(MASS)
?Pima.tr
library(lattice)
splom(Pima.tr[,1:7])

## FACTORS: CATEGORICAL TYPES OF DATA ##
party <- c('r', 'd','d', 'r', 'd','oth','d', 'r', 'r')
class(party)
?factor
party <- factor(party) #, levels=c('d','r','oth')
class(party)
str(party)

gender <- c(1,1,2,2,1,2,1,1,1)
class(gender)
gender.factor <- factor(gender, levels=c(1,2), labels = c('male','female'))
summary(gender.factor)
