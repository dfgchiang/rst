# stat128 homework 4
# 20190325 dchiang
# Promblem 1.
webpage <- 'https://archive.ics.uci.edu/ml/datasets/default+of+credit+card+clients#'
# 1.a Import data and convert to factors
datasource <- 'https://archive.ics.uci.edu/ml/machine-learning-databases/00350/default of credit card clients.xls'
library(readxl)
# ccc <- read_excel("~/Downloads/stat128/default of credit card clients.xls", 
#                   range = "a2:y30002")
ccc <- read_excel("~/Downloads/stat128/default of credit card clients.xls", 
                  skip = 1)
View(ccc)
names(ccc)
names(ccc)[25] <- 'Defaulted'
names(ccc)
complete.cases(ccc)
sum(complete.cases(ccc))
class(ccc)
dim(ccc)
str(ccc)
summary(ccc)
ccc.gender <- factor(ccc$SEX, exclude = NA, labels = c('male', 'female'))
ccc$SEX <- as.factor(ccc$SEX)#, exclude = NA, labels = c('male', 'female'))
# Education column includes values 1 to 6
ccc.education <- factor(ccc$EDUCATION, exclude = NA, labels = c('graduate school', 'university', 'high school', 'others', 'others', 'others'))
ccc$EDUCATION <- as.factor(ccc$EDUCATION)#, exclude = NA, labels = c('graduate school', 'university', 'high school', 'others', 'others', 'others'))
# Marriage column includes values 0 to 3
ccc.marriage <- factor(ccc$MARRIAGE, exclude = NA, labels = c('ohers', 'married', 'single', 'others'))
ccc$MARRIAGE <- as.factor(ccc$MARRIAGE)#, exclude = NA, labels = c('ohers', 'married', 'single', 'others'))
ccc$Defaulted <- as.factor(ccc$Defaulted)
str(ccc)

# 1.b set random seed
set.seed(100)
# 1.c
rand.num <- sample(1:30000) # creates a vector with the integers 1 to 30000 in a random order
ccctrain <- ccc[ rand.num<15001, ] # select ROWS where the random number is < 15001 for training dataset
ccctest <- ccc[rand.num>15000, ] # test data

# 1.d
library(tree)
ccctree <- tree(Defaulted~., data = ccctrain[,2:25])
cccpred <- predict(ccctree, ccctest, type = 'class')
# 1.d.i
plot(ccctree)
text(ccctree)
# 1.d.ii Overall misclassification rate
summary(ccctree)
# Misclassification error rate: 0.1817 = 2726 / 15000 
# 1.d.iv
# Number of terminal nodes:  4
# 1.d.iii Misclassification rate in groups of Defaulted
summary(cccpred)
# predicted Defaulted = {0: 13470, 1: 1530}
summary(ccctest)
# actually Defaulted = {0: 11696, 1: 3304}
misclass0 <- abs((13470-11696)/11969) #= 0.148
misclass1 <- abs((1530-3304)/3304) #= 0.536
table(cccpred, truth = ccctest$Defaulted)
ccc.misclas <- (2230+456)/15000 #= 0.179
# 1.e Cross validation
ccc.cv <- cv.tree(ccctree, FUN = prune.misclass)
ccc.cv
# Optimal number of terminal nodes = 2 which has same dev as 4
# 1.f
ccc.prune <- prune.misclass(ccctree, best = 2)
ccc.prune.pred <- predict(ccc.prune, newdata = ccctest, type = 'class')
table(ccc.prune.pred, truth = ccctest$Defaulted)
ccc.misclass.prune <- (2230+456)/15000 #= 0.179
# 1.g Random Forest
require(randomForest)
ccc.forest <- randomForest(Defaulted ~., data = ccc)
ccc.forest
# OOB estimate of  error rate: 18.13%
# about the same as the pruned tree prediction
# 1.h
ccc.forest.mtry4 <- randomForest(Defaulted~., data = ccc, mtry = 4)
ccc.forest.mtry4
# OOB estimate of  error rate: 18.06%
