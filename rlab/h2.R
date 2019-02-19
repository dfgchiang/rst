# Stat 128 Homework 2
# 20190211 dchiang

## Helper fxns
pr <- function(s) {
  print(s)
}

## Q1.a
x <- c(-7,10,42,NA,7.6,100,NA,13)
pr(x)
### Q1.b --Elements lt 14
e1.lt.14 <- as.integer(x[which(x < 14)])
pr(e1.lt.14)
### Q1.c
ind.lt.14 <- which(x < 14)
pr(ind.lt.14)
### Q1.d
sd.x <- sd(x, na.rm = TRUE)
pr(sd.x)
### Q1.e Sum the number of missing values in x
x.na.num <- sum(as.integer(is.na(x)))
pr(x.na.num)
### Q1.f Index of missing values in x
x.not.na <- x[which(!is.na(x))]
pr(x.not.na)

## Q2
x <- c(1)
pr(x)
x[2] <- (x[1]^2 + 4)/(2*x[1])
pr(x)
### Q2.a
x[3] <- (x[2]^2 + 4)/(x[2]*2)
pr(x)
x.3 = x[3]
xnext <- function(i) {
  return((x[i]^2 + 4)/(x[i]*2))
}
x[4] <- xnext(3)
pr(x)
### Q2.b first 500 terms of seq
x.top <- c(1)
xtop <- function(v, n) {
  for (i in 2:n){
    v <- c(v, v[i-1]^2 + 4)
  }
  return(v)
}
x.top <- xtop(x.top, 10)
pr(x.top)
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

## Q3. 
?mtcars
View(mtcars)
### Q3.a
dim(mtcars)
#--- dimension of mtcars is 32x11
### Q3.b
class(mtcars) #="data.frame"

# row.8.cl <- which(mtcars, '')


## Q7.
library(rvest)
mypage <- read_html('https://en.wikipedia.org/wiki/World_record_progression_100_metres_freestyle')
mynodes <- html_nodes(mypage, 'td:nth-child(2)')
wrtimes <- html_text(mynodes, trim = TRUE)

## Q6. Welcome to Fibs
f <- c(0, 1)
f[3] <- f[2] + f[1]
pr(f[3])
fibs <- function(f, n, p){
  for (i in 3:n){
    f <- c(f, (f[i-1]+f[i-2]))
    if (p == TRUE){
      print(f[i])
    }
  }
  return(f)
}
# f <- fibs(f, 10)
# reset
f <- c(0,1)
n <- 50
fibs.vec <- fibs(f, n, FALSE)
print(fibs.vec)
### Q6.b Sum all odds in first 50 fibs
fibsumodds <- function(f){
  tot <- 0
  for (i in 1:length(f)){
    if (f[i]%%2 == 1){
      tot <- tot + f[i]
      cat(f[i], ':', tot, '\r\n')
    }
  }
  return(tot)
}
sum.odd.fibs <- fibsumodds(fibs.vec)
print(sum.odd.fibs)
