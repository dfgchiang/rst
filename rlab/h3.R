# Stat 128 Homework 3
# dchiang 20190222

# 1(a)
library(readxl)
doefund <- read_excel("C:/Users/dchiang/Downloads/stat128/deptOfEducationFundingbyState.xlsx", 
                      range = "a7:f66")
View(doefund)
# 4thcol=amtchanged; 4thcol=pctchanged
# 1(b)
?state.x77
View(state.x77)
?merge
#?tapply
