# R Commands, Functions, and Recipes
# 20190212 dchiang

## Vector and initializing variables ##
x <- c(1,2,3,4,5,5,6,7,8,9)
y <- NULL
## Get even numbers ##
for (i in 1:length(x)) {
  if (x[i]%%/2 == 0) {
    y <- c(y, x[i])
  }
}

