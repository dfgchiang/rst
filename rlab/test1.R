# stat 128 practice exam 1
z<-c(10,8,25,NA,2,NA)
mean(z, na.rm =TRUE )
sd(z, na.rm = TRUE)
z.na <- z[which(is.na(z))]
length(z.na)
# repl 9
# 1d.
# c(z[1], z[length(z)])
z[c(1,length(z))]
# 1e.
z.sqrt <- sqrt(z[which(is.na(z)==FALSE)])
print(z.sqrt)
# 1f.
which(z%%2==0)
# 1g.
zee <- z[which(z%%2==0)]

# 5a.
f5a <-function(a,b,c){
  return(b^2 - 4*a*c)
}
# 5b.
f5b <- function(n){
  tot <- 0
  for (i in 1:n){
    tot <- tot + 0.5^i
  }
  return(tot)
}
f5b(3)

# 2.
w <- rbind(c(1,3),c(7,2))

# 2a.
mylist <- list(item1=w, item2=z)
# 2b.
mylist$item1
# 2c.
mylist$item2[2]
# 2d.
class(mylist[[1]])
class(mylist[1])

# 3.
View(ToothGrowth)
# 3a.
col3a <- ToothGrowth[,3]
col3b <- ToothGrowth$dose
# 3b.
tsub <- subset(ToothGrowth, ToothGrowth$supp=='OJ')
# 3c.
mean(tsub$len)

# 4a.
myvec <- c("cat","spider","dog","horse")
