# Stat 128 Class Week 6 dchiang 20190304
# === MACHINE LEARNING ===
# Supervised vs Unsupervised Training
# y <-f(x)
# y: Categorical: decision tree, find clusters
# y: Numerical: regression

# === Example Student Homework related to final score
hw <- c(90,35, 100, 77, 80)
final <- c(86,27,91,65,81)
plot(hw, final)
mymodel <- lm(final~hw)
summary(mymodel)
abline(mymodel)
# --- Model ---------------------
# final = 1.025*how+8.832
# -------------------------

# mydata[order(mydata$speed)] # order column

# Decision = Binary split
# Deviance = how messed up your data is 
# c(0,1) does not give good prediction
# Make 2 nodes each node homogeneous among 1 variable
# for K classes (categories) possible,
# each node or leaf splits into 2 groups with lowest possible deviance.
# 1. Split car.color
speed <- 42.5
group1 <- c('B', 'B', 'R')
group2 <- c('B', 'R', 'R', 'R', 'R')
# D1 = deviance in group1
# D2 = deviance in group2
# The closer you get to 1 or 0 the better your algorithm is.

# Graph of deviance without N
fxn1 <- function(p){-2*(p*log(p)+(1-p)*log(1-p))}
curve(fxn1(x), from=0.001, to=0.999)

# === ISLR ===
library(ISLR)
View(Hitters)
# page 304 of book

# BINARY PARTITIONS

# === HANDOUT ===
# Training set = data used to build the predictive model
# Test dataset = used to access the performance of your model
library(MASS)
?Pima.tr
dim(Pima.tr)
head(Pima.tr)
summary(Pima.tr)
dim(Pima.te)
library(tree)
pimatree <- tree(type~., data = Pima.tr) # type is already a factor
plot(pimatree)
text(pimatree)
summary(pimatree)
Pima.te[1,]
pimatree
# Must start at the top and most important split
head(Pima.te)
tail(Pima.te)
set.seed(223)
pima.pred <- predict(pimatree, newdata = Pima.te, type = 'class')
pima.pred
cbind(Pima.te, pima.pred) # Compare actual type to prediction
rbind(pima.pred, Pima.te$type)
table(pima.pred, Pima.te$type) # Confusion table
(44+50)/nrow(Pima.te) # Error rate
# rseed <- set.seed(223) == NULL
# OVERFITTING = 
# PRUNING = Trimmng variables
?prune.misclass
# Tuning set =
set.seed(561)
pima.cv <- cv.tree(pimatree, ,  FUN=prune.misclass,K=10)
# CROSS VALIDATION = holding part of data out as test set
# and use other subsets as training sets = bootstrapping
pima.cv
plot(pima.cv)

pima.prune <- prune.misclass(pimatree,best = 5)
pima.prune
plot(pima.prune)
text(pima.prune)
summary(pima.prune)
pima.prune.pred <- predict(pima.prune, newdata = Pima.te, type = 'class')
table(pima.prune.pred, truth = Pima.te$type)
pima.err2 <- (30+51)/nrow(Pima.te)
