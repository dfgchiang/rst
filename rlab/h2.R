# Stat 128 Homework 2
# 20190211 dchiang 20190219
# ----------------------------
## Q1.a
x <- c(-7,10,42,NA,7.6,100,NA,13)
print(x)
### Q1.b --Elements lt 14
e1.lt.14 <- as.integer(x[which(x < 14)])
print(e1.lt.14)
### Q1.c
ind.lt.14 <- which(x < 14)
print(ind.lt.14)
### Q1.d
sd.x <- sd(x, na.rm = TRUE)
print(sd.x)
### Q1.e Sum the number of missing values in x
x.na.num <- sum(as.integer(is.na(x)))
print(x.na.num)
### Q1.f Index of missing values in x
x.not.na <- x[which(!is.na(x))]
print(x.not.na)

# ---------------------------
## Q2
x <- c(1)
print(x)
x[2] <- (x[1]^2 + 4)/(2*x[1])
print(x)
### Q2.a
x[3] <- (x[2]^2 + 4)/(x[2]*2)
print(x)
x.3 = x[3]
xnext <- function(i) {
  return((x[i]^2 + 4)/(x[i]*2))
}
x[4] <- xnext(3)
print(x)
### Q2.b first 500 terms of seq
x.top <- c(1)
xtop <- function(v, n) {
  for (i in 2:n){
    v <- c(v, v[i-1]^2 + 4)
  }
  return(v)
}
x.top <- xtop(x.top, 10)
print(x.top)
x.bot <- c(1)
xbot <- function(v, n){
  for (i in 2:n){
    v <- c(v, v[i-1]*2)
  }
  return(v)
}
x.bot <- xbot(x.bot, 10)
### Define x-sequence fxn
found2 <-  FALSE
xseq <- function(v, n){
  for (i in 2:n) {
    v <- c(v, (v[i-1]^2 + 4)/(v[i-1]*2))
    if (found2 == FALSE && v[i] == 2){
      cat(i, ':', v[i], '\r\n')
      found2 <- TRUE
    }
  }
  return(v)
}
#### Reset initial variables
x <- c(1)
n <- 500
found2 <-  FALSE
seq.1 <- xseq(x, n)
length(seq.1)
head(seq.1)
### ANSWER: Sequence appears to converge to 2 after 5 iterations

### Q2.c Start sequence at x.1=300
x <- c(300)
found2 <-  FALSE
seq.2 <- xseq(x, 600)
length(seq.2)
head(seq.2)
### ANSWER: Sequence also appears to converge toward 2,
### but needed 13 iterations

### Q2.d Try a few diff init number
x <- c(10)
found2 <-  FALSE
seq.10 <- xseq(x, 100)
#--- Converged to 2 at 8th element
x <- c(100)
found2 <-  FALSE
x.100 <- xseq(x, 200)
## Converged to 2 at 11th element

### Q2.e Plot seq.2 against iterators i
plot(c(1:600), seq.2)

# ---------------------------
## Q3. 
?mtcars
View(mtcars)
### Q3.a
dim(mtcars)
#--- dimension of mtcars is 32x11
### Q3.b
class(mtcars) #="data.frame"
### Q3.c
row.8.cl <- which(mtcars$cyl == 8)
### Q3.d. A new matrix of rows of eight cylinder only
eightcylinder <- mtcars[row.8.cl,]
print(eightcylinder)
### Q3.e. Mean MPG of 8-cyl automatics
mean.manual.mpg <- mean(which(eightcylinder$am == 1))

# ---------------------------
## Q5. 
x <- c(4,18,72,27,43,65)
### Q5.a.
xcubed <- function(x) {
  w <- NULL
  for (i in 1:length(x)){
    w <- c(w, x[i]^3)
  }
  return(w)
}
w <- xcubed(x)
### Q5.b. 
w.vectorized <- x^3
### Q5.c. Find the product of each element with the element before it
xprod <- function(x){
  prod <- c(x[1])
  for (i in 2:length(x)){
    prod <- c(prod, (x[i]*x[i-1]))
    cat(x[i], '*', x[i-1], '=', prod[i], '\r\n')
  }
  return(prod)
}
myproduct <- xprod(x)


# ---------------------------
## Q6. Welcome to Fibs
# Omit f.0 = 0 according to https://en.wikipedia.org/wiki/Fibonacci_number
f <- c(1,1)
fibna <- function(f, n, verbose){
  for (i in 3:n){
    p <- (f[i-1]+f[i-2])
    f <- c(f, p)
    if (verbose == TRUE){
      cat(i, '/', f[i-1], '+', f[i-2], '=', f[i], '\r\n')
    }
  }
  return(f)
}
ftest <- fibna(f, 12, TRUE)
print(ftest)
# reset
f <- c(1,1)
n <- 50
fibs.vec <- fibna(f, n, FALSE)
print(fibs.vec)
### Q6.b. Sum all odds in first 50 fibs with loop
fiboddsum <- function(f){
  tot <- 0
  for (i in 1:length(f)){
    if (f[i]%%2 == 1){
      tot <- tot + f[i]
      # cat(f[i], ':', tot, '\r\n')
    }
  }
  return(tot)
}
sum.odd.fibs <- fiboddsum(fibs.vec)
print(sum.odd.fibs) # = 26658145586
### Q6.b. Summ odds in fibs without loop
sum.odd.fibs.2 <- sum(fibs.vec[which(fibs.vec%%2 == 1)])
print(sum.odd.fibs.2)
# = 26658145586
sum.odd.fibs.3 <- sum((fibs.vec%%2)*fibs.vec)

# ---------------------------
## Q7. time and date for 100 meter freestyle world records for men
library(rvest)
myurl <- 'https://en.wikipedia.org/wiki/World_record_progression_100_metres_freestyle'
mypage <- read_html(myurl)
mynodes <- html_nodes(mypage, 'td:nth-child(2)')
wrtimes <- html_text(mynodes, trim = TRUE)
print(wrtimes)
wrltimes <- wrtimes[1:50]
head(wrltimes)
tail(wrltimes)
length(wrltimes)
getsecs <- function(x){
  tt <- NULL
  for (i in 1:length(x)){
    if (regexpr(':', x[i]) > 0){
      # mm <- as.numeric(unlist(strsplit(x[i], ':', fixed = TRUE))[1])
      ssms <- as.numeric(unlist(strsplit(x[i], ':', fixed = TRUE))[2])
      tt <- c(tt, (ssms + 60.0))
      print(ssms + 60)
    } else {
      ssms <- as.numeric(x[i])
      tt <- c(tt, ssms)
      print(ssms)
    }
  }
  return(tt)
}
times.vec <- getsecs(wrltimes)
dnodes <- html_nodes(mypage, 'td:nth-child(6)')
wrdates <- html_text(dnodes, trim = TRUE)
print(wrdates)
wrldates <- wrdates[1:50]
getyears <- function(x){
  yrs <- NULL
  for (i in 1:length(x)){
    yst <- unlist(strsplit(x[i], ' ', fixed = TRUE))[3]
    year <- as.integer(yst)
    cat(yst, '->', year)
    yrs <- c(yrs, year)
  }
  return(yrs)
}
wrlyears <- getyears(wrldates)
plot(wrlyears, times.vec)
#eof
