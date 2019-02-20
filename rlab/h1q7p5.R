# Project Euler Problem 5
# 20190206 dchiang
# Pattern:
# 2520 = 5*7*8*9 = 2^3*3^2*5*7
# Guess the answer should be
g = 2^4*3^3*5*7*11*13*17*19
print(g) # = 698377680
# Start with product of prime numbers under 20 as initial input:
inp <- 5*7*11*13*17*19
p <- c(5,7,11,13,17,19)
m <- prod(p)
print(m)
test <- function(x) {
  for (k in 1:20){
    print(x/k)
  }
}
test(m)
# m not large enough still have to *(2^x*3^y)
# To find x and y, need to multiply initial product
# by 2 or 3 at a time, and perform the 1:20 division test 
# to see if the new number is just big enough.
n <- prod(p)
for (i in 1:10) {
  cat("Nx2 Loop-", i, "\r\n")
  r <- 0
  n <- n*2
  cat("n=", n, "\r\n")
  for (j in 1:20){
    # print(n/j)
    r <- r + n%%j
  }
  cat("r=", r, "\r\n")
  if (r == 0) {
    return(n)
  }
  cat("Nx3 Loop-", i, "\r\n")
  r <- 0
  n <- n*3
  cat("n=", n, "\r\n")
  for (k in 1:20){
    # print(n/k)
    r <- r + n%%k
  }
  cat("r=", r, "\r\n")
  if (r == 0) {
    return(n)
  }
  # cat(i, ":", n, " \r\n")
}
print(n)
# ANSWER to Project Euler Problem 5 = 698377680
# Confirms our guess.
# Can refactor code to one function inside a while loop
#eof
