
rm(list=ls())

# 1. Derivative of CDF, N(2, 2^2) at x=0

set.seed(2)
x = pnorm(p, 2, 2)
p = 1/2

f <- function(x) {
  f <- pnorm(p,2,2)
  return(f) 
} 

f_dev <- function(x, f){
  h <- 1e-8
  f_dev <- (f(x+h)-f(x))/h
  return(f_dev)
}

f_dev(x=0, f=f)

# 2. Volume of half-sphere, r=1


x2 <- c(0,n)
y2 <- c(0,n)
n <- 2
h <- 0.000001


g <- function(x2, y2){
  g <- x2^2 + y2^2
  return(g)
}

volume <- 0

g_int <- function(x2,y2,g){
  volume <- 0
  for (i in seq(from=x2[1], to=x2[2]-h, by=h)) {
    for (i in seq(from=y2[1], to=y2[2]-h, by=h)) 
      }{
      volume <- volume + h*g(i)
  }
  return(volume)
}

g_int(x2=x2, y2=y2, g=g)


#3. 
