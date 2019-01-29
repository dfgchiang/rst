# stat128wk1ex1.R 20190128 dchiang
# c(7,10,16,20) -> z
c(2,1,3) -> y
z <- c(7,10,16,20)
q2mean <- mean(z)
q2sd <- sd(z)
q3sum <- sum(z)
q4 <- sum(z^2)
q5 <- sum(z - mean(z))
q6 <- sum(z[3],z[4])
q7 <- c(z, z, 5)
# Sample Variance
sampvar = sqrt(sum(z - sd(z))^2/length(z)-1)
# Histogram parameters
mybreaks = seq(from=400, to=1400, by=10)
# hist(Nile, mybreaks, col="red")
b <- c(TRUE, FALSE, TRUE, FALSE)
sum(b) # 2 = 1 + 0 + 1 + 0
# Functions 
in2cm <- function(x)
{
  return(x*2.54);
}
acir <- function(r) {
  return(pi*r^2);
}
ar5 <- acir(5)
hyp <- function(x, y){
  return(sqrt(x^2 + y^2));
}
h <- hyp(6,9)
x <- c(4,5,6)
w <- c(3,5,8)
m <- rbind(x,w)
mylist <- list(cat='max', v1=z)
ar2 <- cbind(w,x)
