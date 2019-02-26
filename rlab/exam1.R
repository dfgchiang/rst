# Stat 128 Exam 1 
## 20190225 Dean Chiang

# 1a.
f1a < - function(f){
  c <- (f-32)*(5/9)
  return(c)
}
# 1b.
f1b <- function(x){
  tot <- 0
  for (i in 1:length(x)){
    if (x[i]%%3==0){
      tot <- tot + x[i]
    }
  }
}
# 1c.
x <- c(5)
f1c <- function(n){
  x <- c(5)
  for (i in 2:10){
    x[i] <- 4*x[i-1] -3
    x <- c(x, x[i])
  }
}

# 2.a.
View(mtcars)
class(mtcars)
# 2b.
str(mtcars)
# - 32 rows by 11 columns
# 2c. Cars with automatic transmission where am is 0
autom <- subset(mtcars, mtcars$am==0)
#print(autom)
# 2d.
mean(autom$mpg)
# 2e.
hist(mtcars$hp)
# 2f.
mean(mtcars$hp)
sd(mtcars$hp)
# 2g. Normal distrib
hp.norm <- rnorm(n = 32, mean = mean(mtcars$hp) , sd = sd(mtcars$hp))
curve(dnorm(x, mean = mean(mtcars$hp), sd=sd(mtcars$hp)), add = TRUE)
