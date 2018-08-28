
x <- c(0,n)
n <- 5
h <- 0.000001


g <- function(x){
  g <- exp(x)
  return(g)
}

g_int <- function(x, g){
  area <- 0
  for (i in seq(from=x[1], to=x[2]-h, by=h)) {
  area <- area + h*g(i)  
  }
    return(area)
}

g_int(x=x, g=g)


exp(5)


