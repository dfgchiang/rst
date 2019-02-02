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

# Q2.
row1 <- c(1,8,3)
row2 <- c(4,7,9)
row3 <- c(3,2,9)
matrix1 <- rbind(row1, row2, row3)
print(matrix1)
# Q2.a
colm3 <- c(matrix1[1,1], matrix1[2,1], matrix1[3,1])
colm3 <- c(matrix1[,1])
print(colm3) # 1,4,3
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

# Q3.
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
#