#apply function

# 1. apply()
x <- matrix(rnorm(9), 3,3)
x

apply(x, MARGIN = 1, FUN=min)

# For loop equivalent

for (i in 1:nrow(x)) {
  print(min(x[i,]))
}

apply(x, MARGIN = 2, FUN=sum)
colSums(x)  # equivalent

# applying a ftn that takes extra arguments

setwd("C:/Users/Jinsoon/Desktop/5495 R/dataset")
rev_exp0 <- read.csv("district_rev_exp.csv", na.strings = "-")

maximum <- apply(rev_exp0[,-c(1,3)], MARGIN = 2, FUN=max, na.rm=T)  

first <- apply(rev_exp0[,-c(1,3)], MARGIN = 2, FUN=which.max)
rev_exp0[first[1],]

second <- apply(rev_exp0[-first[1],-c(1,3)], MARGIN = 2, FUN=which.max)
rev_exp0[second[1],]

# Use apply() to our own ftn

my.fun <- function(x) {
  m1 <- median(x, na.rm = T)
  m2 <- mean(x, na.rm = T)
  return(c(m1,m2))
}

apply(rev_exp0[,-c(1,3)], MARGIN = 2, FUN=my.fun)


# apply() to a list

my.list = list(nums=seq(0.1, 0.6, by =0.1), chars=letters[1:12], TF=sample(c(T,F)), 6, replace=T)
my.list

lapply(my.list, FUN=mean)


# lapply with extra arguments

mean.omtting.one = function(i, vec) {
  return(mean(vec[-i]))
}  # Jackknife method

my.vec = rev_exp0[,"TOTALEXP"]
n = length(my.vec)
my.vec.jack <- lapply(1:n, FUN = mean.omtting.one, vec=my.vec)

head(my.vec.jack)

# sapply -> outcome is numbers

my.vec.jack1 <- sapply(1:n, FUN = mean.omtting.one, vec=my.vec)
head(my.vec.jack1)

sqrt((n-1)^2/n)*sd(my.vec.jack1)  # Jackknife SD

sd(my.vec)/sqrt(n)                # Conventional SD


#tapply -> levels of a factor vector

str(rev_exp0)

tapply(rev_exp0[,"TOTALREV"], INDEX = rev_exp0$STATE, FUN=mean, rm.na=T)
aggregate(rev_exp0[,c("ENROLL", "TOTALREV", "TOTALEXP")], by=list(ST=rev_exp0))




