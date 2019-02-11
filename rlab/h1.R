# Stat 128 Homework 1
# 20190130 Dean Chiang

# Q1.a
w <- c(45,77,5,8,110)
print(w)
# Q1.b
x <- mean(w)
print(x) # 49
y <- var(w)
print(y) # 2034.5
z <- sd(w)
print(z) # 45.10543
# Q1.c
w.sq <- w^2
print(w.sq) # (2025,  5929,    25,    64, 12100)
# Q1.d
sum.w.sq <- sum(w.sq)
print(sum.w.sq) # 20143
# Q1.e
n <- 5
w.var.comp <- (sum.w.sq - n*(x^2))/(n -1)
print(w.var.comp) # 2034.5
# Q1.f
mean.multiply.data <- mean(w*5)
print(mean.multiply.data) # 245
sd.multiply.data <- sd(w*5)
print(sd.multiply.data) # 225.5272
# Affect of mean(w*5) = mean(w)*5
# Q1.g
mean.add.5 <- mean(w+5) 
print(mean.add.5) # 54 = x + 5
sd.add.5 <- sd(w+5)
print(sd.add.5) # 45.105432 =?

# Q2.--------------
row1 <- c(1,8,3)
row2 <- c(4,7,9)
row3 <- c(3,2,9)
matrix1 <- rbind(row1, row2, row3)
print(matrix1)
# Q2.a
colm3 <- c(matrix1[1,1], matrix1[2,1], matrix1[3,1])
colm3 <- c(matrix1[,3])
print(colm3) # 3 9 9
# Q2.b
myelt <- c(matrix1[3,], matrix1[,2])
myelt <- sum(matrix1[3,] + matrix1[,2])
print(myelt) #  3    2    9    8    7    2
# 11 9 11
# Q2.c
2:5 # 2 3 4 5
matrix2 <- matrix(2:5, nrow=2, ncol=2)
# Q2.d
t(matrix2)
# = Matrix Transpose 
det(matrix2) # -2
# = Calculate the Determinant of a Matrix

# Q3.----------------------------
mymatrix <- matrix(1:4, nrow=2, ncol=2)
mynames = c("Ruby", "Miguel", "Tiffany", "Tyler")
mylist = list(mymatrix, mynames)
print(mylist)
# Q3.a
mydet <- det(mylist[[1]])
print(mydet) # -2
# Q3.b
favname <- mylist[[2]][3]
print(favname) # "Tiffany"

# Q4.--------------------
?swiss
# Q4.a
ag.col <- swiss[,2] # "Agriculture"]
print(ag.col)
# Q4.b
mean.perc.male.ag <- mean(ag.col)
print(mean.perc.male.ag) # 50.65957
# Q4.c
row40 <- swiss[40,]
print(row40)
# Q4.d
summary(swiss)

# Q5.-----------------
sumssq <- function(x) {
  return(x + sqrt(x))
}
function1output <- sumssq(14)
print(function1output) # 17.74166

# Q6.------------------
ta <- function(b, h) {
  return(b * h * 2)
}
function2output <- ta(3.9, 4.6)
print(function2output) # 35.88

# Q7.---------------------------
# Q7.p1 (https://projecteuler.net/problem=1)
n <- 999 # max int less lt 1000
v3 <- c(1:333)*3
print(v3)
v3f <- v3s%%5
print(v3f)
v3r <- replace(v3f, v3f > 0, 1)
print(v3r)
v3s <- v3 * v3r
print(v3s)
sum3s <- sum(v3s)
print(sum3s) # 133668
sum3and5s <- sum(c(1:199)*5) + sum(v3s)
print(sum3and5s) # 233168 = ANSWER to Euler problem 1


# Q7.p6 (https://projecteuler.net/problem=6)
q7p6answer <- sum(c(1:100))^2 - sum(c(1:100)^2)
# 25164150 =ANSWER to Euler problem 6


# Q7.p5 (https://projecteuler.net/problem=5)
# 2520 = 5*7*8*9
# since other numbers 1,2,3,4,6,10 can all be divided into those
# In the next sequence 11:20 we need try to multiply
# at least 11,13,17,19 to get a possible number
# and then divide by all numbers to test if valid.
n <- 2520*11*13*17*19
print(n) # 116396280 seems too high
add1 <- function(x) {
  return(x + 1)
}
# TEST FXNAL LOOP
incr <- function(i, n) {
  i <- i + 1 # add1(i)
  if (i < n) {
    incr(i, n)
  } else {
    return(i)
  }
}
m <- incr(1, 20)
print(m)
# Smallest Multiple formula
# Once we have a product, need to be divided by all the 
# numbers in the sequence, and skip/remove the numbers that
# can divide into existing product
smul <- function(i,n,x){
  # solve for x
  if (i < n) {
    if (x/(i+1) < 0 | x%%(i+1) != 0){
      x <- x*(i+1)
      smul((i+1), n, x)
    } else {
      smul((i+1), n, x)
    }
  } else {
    return(x)
  }
}
m <- smul(1,10,1) # 7560 too large
v5 <- c(1:10)
v5d <- 2520/v5
print(v5d)
