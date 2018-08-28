rm(list=ls())

## Exercise 1 

setwd("C:/Users/Jinsoon/Desktop/5495 R/Dataset")
rev_exp0 <- read.csv("district_rev_exp.csv", na.strings = "-")
head(rev_exp0)

mean(rev_exp0$TOTALREV, trim=0.2, na.rm=T)

## Exercise 2 
 
diff_function <- function (x, y) {
  a <- (x+y) - 1/(x+y)
  if ( x+y == 0 )  {
    return(0)
  } else {
    return(a)}
    
}

diff_function(0,0)
diff_function(-2,2)
diff_function(3,5)

# Exercise 3

fun <- function(x){
  y <- x^3 +2*x + 5
}

fun_der <- function(x) {
  yder <- 3*x^2 +2
}

curve(fun, xlim=c(-2,2), col='blue', lwd=2, lty=2, ylab='f(x)')

abline(h=0)
abline(v=0)

nr <- function (fun, fun_der, int) {
  x <- c(int-5, int)
  i <- 2
  while (abs(x[i]-x[i-1])>0.0001){
    x[i+1] <-  x[i] - fun(x[i])/fun_der(x[i])
    i <- i + 1  
  }
  x[i]
}

nr(fun, fun_der, int=10)



