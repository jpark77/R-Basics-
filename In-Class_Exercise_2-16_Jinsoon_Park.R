rm(list=ls())

# Exercise 1
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17,7,5,16,8,13,14)
week <- c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun")
names(linkedin) <- week
names(facebook) <- week

if (mean(linkedin) > mean(facebook)) {
  cat("You are popular in likedin than in facebook")
} else {
  cat("You are popular in facebook than in likedin")
}

#Exercise 2
li <- 15
fb <- 9

if (li >= 15 & fb >= 15) {
  sns <- 2*(li+fb)
} else if (li <10 & fb <10) {
  sns <- 0.5*(li + fb)
} else {
  sns <- li+fb
}

cat("SNS"=sns)

#Exercise 3

x <- seq(-3,3, by=0.01)
y <- (x-1)^3 + 0.5*x^2 - x -2 
plot(x, y, type="l")

x <- c(-2, 10)
i <- 2

while (abs(x[i]- x[i-1])> 0.000001) {
  x[i+1] <- x[i] - ((x[i]-1)^3 + 0.5*x[i]^2 - x[i] - 2)/(3*(x[i]-1)^2 +x[i] -1)
  i <- i + 1
}
cat("The solution to the equation  (x-1)^3 + 0.5*x^2 - x -2 = 0 is x=", x[i])




