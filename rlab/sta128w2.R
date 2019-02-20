# Stat 128 Week 2

# > installed rvest package
# install.package('rvest', dependencies = TRUE)

# > require(rvest)
# Loading required package: rvest
# Loading required package: xml2

# extract = subsetting

# Matrices
m1 = matrix(c(1:5), ncol = 5, nrow = 5)
print(m1)
mdet = det(m1)
print(mdet)
# Lists
mylist = list(x = "cat", y = c(3,1,4,2))
print(mylist)
print(mylist$x)
print(mylist$y)
print(mylist[2]) # outputs a list
print(mylist[[1]]) # outputs a scalar
print(mylist$y[3])
print(mylist[[2]][3]) # same
class(mylist)
class(mylist$x)
class(mylist$y[3])

myhist = hist(Nile)
myhist
mycounts <- myhist$counts
str(myhist)t

# Dataframes: a list where each component equal to 
# columns of a dataset or table
mydata <- data.frame(name=c("Nick", "Chris"), 
                     major=c("CS", "Physics"),
                     npets=c(3, 0))
# Cannot turn this dataframe into a matrix and keep the numbers

# View(mydata) # to see in pretty table
vmajor <- mydata$major
sumpets <- sum(mydata$npets)

# LESSON 2 -----------------
View(ChickWeight)
# find the mean wt
mean(ChickWeight$weight)
# = 121.818
table(ChickWeight$Diet)
# distinct diet
ChickWeight[1:12,]
# = first 12 rows
mysubset <- subset(ChickWeight, Diet==2)
print(mysubset)

x <- c(5,6,8,20)
print(x==6)
print(x>10)
print(x%%2)
subx <- x[c(T,F,F,T)] # get a subset
print(subx)
x[x>7]
which(x>7)
x(which(x>7))
# is same as x[x>7]
x[x<=8]
# SUBSETTING
subset(ChickWeight, weight>70 & weight <= 100)
View(chickwts)
subset(chickwts, feed == 'linseed')

x <- x[-c(3)]
x <- c(1:10)
y <- x[-which(x%%2==0)]
print(y)

# SEQUENCES
myseq <- seq(from=0, to=10, by=0.5)
myseq2 <- seq(from=1, to=10, length.out = 20)
rep(1:5, times=10)
rep(1:5, each=5)
getwd()
write.csv(myseq, 'Documents/myseq.csv')
# NA AND NULLS
y <- c(5,6,7,NA,9)
mean(y)
mean(y, na.rm=TRUE)
is.na(y)
y[which(na==TRUE)]
# Error in which(na == TRUE) : object 'na' not found
which(is.na(y))
?complete.cases

# FOR LOOPS
# store into empty vector
mynums <- NULL
mynos <- NULL
j = 1
for (i in c(1:3)) {
  j <- i^2
  print(i+j)
  mynums <-c(mynums, (i+j))
  mynos[i] <- j
}
print(mynums)
nchar('12345mywords')
nchar(123)

rtot <- NULL
mymat <- matrix(1:6, nrow = 3, ncol = 2)
print(mymat)
for (i in 1:3){
  print(sum(mymat[i,]))
  rtot[i] <- sum(mymat[i,])
}
print(rtot)

# EXERCISES
# 1.
x <- c(7,25,30,9)
sqr.x <- NULL # 2.
for (i in 1:length(x)){
  print(i^2)
  sqr.x[i] <- i^2
}
print(sqr.x)
# 3.
for (i in 1:length(mymat[1,])){
  print(mean(mymat[,i]))
}
