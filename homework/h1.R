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

# Q2.a
row1 <- c(1,8,3)
row2 <- c(4,7,9)
row3 <- c(3,2,9)
matrix1 <- rbind(row1, row2, row3)
print(matrix1)
colm3 <- c(matrix1[1,1], matrix1[2,1], matrix1[3,1])
print(colm3) # 
