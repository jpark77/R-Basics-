rm(list=ls())

# Pairwise bootstrap


plot(mtcars$wt, mtcars$mpg)
x <- mtcars$wt
y <- mtcars$mpg

reg <- lm(y~x)
abline(reg)

bhat <- reg$coefficients[2]
n <- nrow(mtcars)
num <- sum(((x-mean(x))^2)*(reg$residuals^2))/n
den <- sum((x-mean(x))^2) / n
se <- sqrt(num)/den

t <- sqrt(n)*bhat / se

B <- 999
bstar <- rep(NA, B)
tstar <- rep(NA, B)



for (b in 1:B) {
  index <- sample(1:32, size = 32, replace = T)
  
  x_b <- x[index]
  y_b <- y[index]
  
  reg_b <- lm(y_b~x_b)
  abline(reg_b)
  
  bstar[b] <- reg_b$coefficients[2]
  n <- nrow(mtcars)
  num_b <- sum(((x_b - mean(x_b))^2)*(reg_b$residuals^2))/n
  den_b <- sum((x_b - mean(x_b))^2) /n
  se_b <- sqrt(num_b)/den_b
  
  tstar[b] <- sqrt(n)*(bstar[b] - bhat) / se_b
}

summary(tstar)
summary(bstar)



