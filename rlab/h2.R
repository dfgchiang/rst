# Stat 128 Homework 2
# 20190211 dchiang
pr <- function(s) {
  print(s)
}
### Q1.a
x <- c(-7,10,42,NA,7.6,100,NA,13)
### Q1.b
e1.lt.14 <- as.integer(x[which(x < 14)])
pr(e1.lt.14)
### Q1.c
ind.lt.14 <- which(x < 14)
pr(ind.lt.14)
## Q1.d
sd.x <- sd(x, na.rm = TRUE)
pr(sd.x)
# Q1.e
nona <- function(x){
  k <- 0
  for (i in 1:length(x)){
    j <- x[i]
    if (is.na(j)){
      k <- k + 1
    }
  }
  return(k)
}
nas <- x(which(is.na(x)))

