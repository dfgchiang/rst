# Stat 128 Class Week 7 dchiang 20190311
# --- Cross Validation (CV) ---
# Tuning Parameters, Variable Selection
# 2 methods for selecting the best predictive model and its tuning parameters
# (options for a particular model)
# 1). Training dataset (=Training set) - build or construct the tree, modeling
# Test dataset (Validation set) to test the tree
# and calculate a misclass rate; 
# but if dataset is small you lose too much data.
# 2). Class Validation (CV)
# Tri-Fold: Randomly split data into 3 subsets.
# Use fold 2 and 3 to build the tree (model) and use the model 
# to predict on the Holdout fold (fold 1).
# Default is 10-fold xval
msg <- "line 2 
line 3"
library(MASS)
head(fgl)
n <- nrow(fgl)
cvgroup <- c(rep(1, 71), rep(2, 71), rep(3, 72))
cvgroup
?sample
sample(1:10, size=5)
set.seed(366)
cvrandom <- sample(cvgroup, size = n)
tail(cvrandom)
table(cvrandom)
fgl$cvgroup <- cvrandom
View(fgl)
# Hold out group 1
fgl.grp2n3 <- subset(fgl, fgl$cvgroup != 1)
fgl.grp2n3
# Create the predictive model
library(tree)
tree.grp2n3 <- tree(type ~.-cvgroup,data = fgl.grp2n3)
summary(tree.grp2n3)
plot(tree.grp2n3)
text(tree.grp2n3)
tree.grp2n3

# Predict on group 1
fgl.grp1 <- subset(fgl, fgl$cvgroup==1)
fgl.grp1
pred1 <- predict(tree.grp2n3, newdata = fgl.grp1, type="class")
pred1

# Hold out group 2
fgl.grp1n3 <- subset(fgl, fgl$cvgroup != 2)
tree.grp1n3 <- tree(type~.-cvgroup, data = fgl.grp1n3)
summary(tree.grp1n3)
plot(tree.grp1n3)
text(tree.grp1n3)
fgl.grp2 <- subset(fgl, fgl$cvgroup == 2)
pred2 <- predict(tree.grp1n3, newdata = fgl.grp2, type = "class")
pred2
table(pred = pred2, truth = fgl.grp2$type)
sum(pred2 != fgl.grp2$type)

msg<-"Add up all the groups misclassification 
36+26+24=86/214"

#