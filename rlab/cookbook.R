# R Commands, Functions, and Recipes
# 20190212 dchiang

# CONCAT VECTORS
x <- c(1,2,3,4,5,5,6,7,8,9) 

# INITIALZE VARIABLES
y <- NULL

# GET EVEN NUMBERS
for (i in 1:length(x)) {
  y <- NULL
  if (x[i]%%2 == 0) {
    y <- c(y, x[i])
  }
  return(y)
}
# SUBSETTING
y <- x[which(x%%2==0)]


# RECURSIVE LOOP
## x[i] <- fx(x[i-1])

## Create Fibonacci Sequence
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

### SUM UP ODD NUMBERS IN VECTOR WITH LOOPING
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

### SUM UP ODDS IN VECTOR WITHOUT LOOPING
sum.odd.fibs.2 <- sum(fibs.vec[which(fibs.vec%%2 == 1)])
print(sum.odd.fibs.2)
# = 26658145586


### USER INPUT PROMPT
readline(prompt="Enter skip 1: " )

