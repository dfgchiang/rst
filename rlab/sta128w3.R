# Stat 128 week 3 classroom
pr <- function(s){
  print(s)
}
x <- NULL
x[1] <- 1
x[2] <- sqrt(2+x[1])
pr(x[2])
for(i in 2:100){
  x[i] <- sqrt(2+x[i-1])
  pr(x[i])
}

# Fibonacci
fib <- NULL
fib[1] <- 1
fib[2] <- 1
fibs <- function(x, n){
  for (i in 3:n){
    x[i] <- x[i-1]+x[i-2]
    pr(x[i])
  }
  return(x)
}
fib <- fibs(fib, 20)
pr(fib)
### NOTE: Without fxn return it cannot change original fib

## Web Scraping
library(rvest)
mypage <- read_html("https://www.imdb.com/list/ls031250287/")
ranknodes <- html_nodes(mypage, css='.text-primary')
rankings <- html_text(ranknodes)
rankins <- as.numeric(rankings)
pr(rankins)
titlenodes <- html_nodes(mypage, css='.lister-item-header a')
pr(titlenodes)
titletext <- html_text(titlenodes)
runtime.nodes <- html_nodes(mypage, '.text-muted .runtime')
runtime.text <- html_text(runtime.nodes)
pr(runtime.text)
runtime.matrix <- matrix(unlist(strsplit(runtime.text, " ")), ncol = 2, byrow = 1)
pr(runtime.matrix)
runtime.vec <- as.numeric(runtime.matrix[,1])
pr(runtime.vec)
length(rankings)
length(titletext)
length(runtime.vec)
moviedata <- data.frame(rank = rankings,
                        title = titletext,
                        runtimes = runtime.vec)
pr(moviedata)
head(moviedata)
hist(moviedata$runtimes)

## If-Then-Else Loops and Plotting

y<- 5
bignum <- NULL
if (y > 2) {bignum <- "yes"} else {bignum <- "no"}

v2 <- c(6,3,4,10)
for (i in 1:4){
  if (v2[i] > 5){
    print(v2[i])
  } else {
    print('Not lt 5')
  }
}
### NOTE Logical test can only evaluate a scalar not vector
v3 <- c(6,3,4,10,2,555)
v4 <- NULL
for (k in v3) {if(k > 5){v4 <- c(v4,k)}}
pr(v4)

## Counters
v5 <- c(10,3,4,6,8)
cnt <- 0
for (i in 1:length(v5)){
  if (v5[i]>5){cnt <- cnt + 1}
  print(cnt)
}

## Exercises
# 1.
x <- c(8,1,22,3,7)
# 1.a
if (x[3]<10){print('yes')}else{print('no')}
# 1.b
for(i in 1:length(x)){
  if (x[i] < 10){
    print(paste(x[i], 'lt 10'))
  } else {
    print(paste(x[i], 'not lt 10'))
  }
}
# 1.c
smnos <- NULL
for(i in 1:length(x)){
  if (x[i] < 10){
    smnos <- c(smnos, x[i])
  } else {
    print(paste(x[i], 'not lt 10'))
  }
}
print(smnos)
# 2. Random numbers
x <- runif(200)
print(x)
cnt <- 0
for (i in 1:length(x)){
  if (x[i] < 0.7){
    cnt <- cnt + 1
  }
}
print(cnt)
