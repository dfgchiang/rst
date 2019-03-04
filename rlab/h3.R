# Stat 128 Homework 3
# dchiang 20190222

# 1(a)
pcpath <- "C:/Users/dchiang/Downloads/stat128/deptOfEducationFundingbyState.xlsx"
filepath <- '/Users/dean/Downloads/stat128/deptOfEducationFundingbyState.xlsx'
library(readxl)
doefund <- read_excel(filepath, 
                      range = "a7:f66")
View(doefund)
# 4thcol=amtchanged; 4thcol=pctchanged
# 1(b)
?state.x77
View(state.x77)
rownames(state.x77)
row.names(state.x77)
#?tapply
rm(stx77edu)
# stx77edu <- merge(doefund, state.x77, by = c('State or Other Area', rownames(state.x77)), all = FALSE)
stx77edu <- merge(doefund, state.x77, by.x = 'State or Other Area', by.y = 'row.names', all.y = TRUE) # by.y = 'column 0', 
View(stx77edu)

# 1(c)
cormat <- cor(stx77edu[-1])
# Population has the highest positive correlation to 2016 Actual 
# Frost has the second highest correlation (negative)

# 1(d)
# install.packages('corrplot', dependencies = TRUE)
# /var/folders/zw/4l5c8wxn6m7_331_d_prmb340000gn/T//RtmpvTbXKl/downloaded_packages
??corrplot
library(corrplot)
corrplot(cormat, method = 'circle')

# 2(a)
library(rvest)
htmldat <- read_html('https://www.kaggle.com/uciml/pima-indians-diabetes-database')
library(readr)
diabetes <- read_csv("diabetes.csv")
View(diabetes)

# 2(b)
summary(diabetes)
# Remove nonsense value rows in column 2
diabetes1 <- diabetes[c(which(diabetes[,2] > 0)),]
View(diabetes1)
# Replace nonsense values in column 6 by NA
diabetes1[c(which(diabetes1$BMI == 0)),]
diabetes1$BMI <- replace(diabetes1$BMI, which(diabetes1$BMI == 0), NA)

# 2(c)
lm.bmit <- lm(diabetes1$BMI ~ diabetes1$SkinThickness)
plot(diabetes1$BMI, diabetes1$SkinThickness)
abline(lm.bmit)

# 2(d)
library(lattice)
splom(diabetes1[c(1,2,3,4,5)])

# 2(e) Add column of age in days (what about Leap years?)
diab2 <- cbind(diabetes1, AgeDays=diabetes1$Age*365)
View(diab2)

# 3(a)
?ChickWeight
require(graphics)
# coplot(weight - Time | Chick, data = ChickWeight,
#        type = 'b', show.given = FALSE)
View(ChickWeight)
summary(ChickWeight)
# Diet is a factor levels = c(1,2,3,4), labels = c('A','B','C','D')
# Chick is a factor 

# 3(b)
# rows where chicks at 21 days
cw21 <- ChickWeight[which(ChickWeight$Time == 21),]
cw21meanwt <- tapply(cw21$weight, cw21$Diet, function(x){mean(x)})

# 3(c)
cwdf <- split(ChickWeight, ChickWeight$Diet)

# 4.
gender <- c('F','F','M','F','M','M','M','M','F','M')
oncampus <- c(1,1,0,0,1,0,1,0,0,0)
tbl <- table(gender, oncampus)
