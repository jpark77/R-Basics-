rm(list=ls())
#Function
# input -> ft -> return

sd(c(1,5,6,7))

value <- c(1,5,6,7)
sd(value)
my_sd <- sd(value)

?sd

# 
value <- c(1,5,6,7, NA)
sd(value)
sd(value, T)

sd(na.rm=T, x=value)

# Write a function

#Syntax 
# my_ftn <- function(arg1, agr2, ...){
# contents
# }

sq <- function(x) {
  square <- x^2
  return(square)
}

sq(3)
sq(c(3,4,5))
sq(rbind(c(1,2),c(3,4)))

treatment_effect <- function(tg,cg, trim=F){
  if (trim) {
    effect <- mean(tg, trim=0.2) - mean(cg, trim=0.2)
  } else {
    effect <- mean(tg) - mean(cg)
  }
  variance <- sd(tg)^2 + sd(cg)^2
  t.value <- effect/sqrt(variance)
  if (abs(t.value)>1.96) {
    print("The average treatment effect is significant")
  } else {
    print("The average treatment effect is not significant")
  }
  result <- list(average_effect=effect, t.value = t.value)
  return(result)
}

a <- rnorm(15,10,2)
b <- rnorm(15,0,2)
treatment_effect(a,b)

treatment_effect(tg=a, cg=b, trim=T)

# Triple

triple <- function(x){
  x <- 3*x
  x
}

x <- 4
triple(x)
x

# save a function as a different file and call it
source(file.choose())
test(2)


# Package

install.packages("ggplot2")
search()
library(ggplot2)
ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point() + geom_smooth()





