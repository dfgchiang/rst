# stat 128 week 9 classroom notes
# dchiang 20190325
mydata <- c(3,8,7,6,3,2,9,10)
?sample
set.seed(33)
bs1 <- sample(mydata, size=length(mydata), replace = TRUE)
bs1
bs2 <- sample(mydata, size=length(mydata), replace = TRUE)
bs2
"Bootstrap = construct some more data from what we have;
to simulate more sample from what we have;
to avoid overfitting if there is a weird observation"
"Random Forest = a forest of trees from random samples"
# install.package("randomForest", dependencies = TRUE)
library(randomForest)
?randomForest
library(MASS)
View(Pima.tr)
"When you draw a bootstrap sample about 1/3 is left out of sample;
so those become your test data.
Bag error is the error from running all the sample 
through the treesleft out"
set.seed(387)
pimaforest <- randomForest(type~., data = Pima.tr)
pimaforest
str(pimaforest)
head(pimaforest$err.rate[,1])
plot(pimaforest$err.rate[,1], type='l')
"mtry = tuning parameter; default is not always the best;
use loop to run different mtry values"
oob.error <- numeric(7)
for (i in 1:7){
  forest2 <- randomForest(type~., data = Pima.tr, mtry = i, ntree = 300)
  oob.error[i] <- forest2$err.rate[300,1]
  #test.set.error[i] <- sum(preds != Pima.te, )
}
oob.error
importance(pimaforest)
varImpPlot(pimaforest)


# ****************** PLOTTING ***********************
# plot line y = 025x -1
# from 0 to 2*pi
y <- function(x){}
xvals <- seq(from = 0, to = 2*pi, by = 0.1)
xvals
plot(x=xvals, y=0.25*xvals-1, type='l', ylim = c(-1.5,1.5))
points(x=xvals, y=sin(xvals), type='l', col='orangered', lwd=3)
points(x=xvals, y=cos(xvals), type='l', col='pink', lwd=3)
?ggplot2
install.packages('ggplot2', dependencies = TRUE)
"  There are binary versions available but the source versions are
  later:
           binary source needs_compilation
rstudioapi  0.9.0   0.10             FALSE
zoo         1.8-4  1.8-5              TRUE
git2r      0.25.1 0.25.2              TRUE
pkgbuild    1.0.2  1.0.3             FALSE
fs          1.2.6  1.2.7              TRUE
devtools   1.13.6  2.0.1             FALSE
gtable      0.2.0  0.3.0             FALSE

compile from source? Yes
took a long time
"
library(ggplot2)
class(mtcars)
p0 <- ggplot(data=mtcars, aes(x=mpg))
p0+geom_dotplot(color='red', fill='blue')+theme_classic()+ylab('proportion')
p0+geom_histogram(fill='yellow', color='red')+theme_minimal()
mtcars$cyl=factor(mtcars$cyl)
mtcars$am=factor(mtcars$am)
p1 <- ggplot(data=mtcars, aes(x=mpg, y=disp, color=cyl, shape=am))
p1+geom_point()
