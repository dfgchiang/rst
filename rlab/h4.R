# stat128 homework 4
# 20190325 dchiang
# P1.
url <- 'https://archive.ics.uci.edu/ml/machine-learning-databases/00350/default of credit card clients.xls'
library(readxl)
ccc <- read_excel("~/Downloads/stat128/default of credit card clients.xls", 
                  range = "a2:y3002")
View(ccc)
names(ccc)
names(ccc)[25] <- 'Defaulted'
complete.cases(ccc)
sum(complete.cases(ccc))
