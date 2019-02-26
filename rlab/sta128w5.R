# Stat 128 Class Week 5 dchiang 20190225
summary(mtcars)
mtcars$am <- factor(mtcars$am, levels = c(0,1), labels = c("automatic", "manual"))
str(mtcars)
table(mtcars$am)
summary(mtcars$am)
mtcars$vs <- factor(mtcars$vs, levels = c(0,1), labels = 
                      c("v-shape", "straight"))
summary(mtcars$vs)
table(mtcars$vs)
table(mtcars$am, mtcars$vs)

geardata <- split(mtcars, mtcars$gear) # chunk
geardata[[1]]

plot(mtcars$disp, mtcars$mpg)
mymodel <- lm(mpg ~ disp, data = mtcars)
abline(mymodel)
# same as abline(a = 29.59, b = -0.041)
str(mymodel)
by(mtcars, mtcars$gear, summary)
by(mtcars, mtcars$vs, function(m) lm(m[,1]~m[,4]))
by(mtcars, mtcars$vs, function(x) lm(mpg~disp, data=x))
# byfun <- function(x, y, z) lm(x~y, data=x)
# by(mtcars, mtcars$vs, byfun(x, mpg, disp)) #FAIL
