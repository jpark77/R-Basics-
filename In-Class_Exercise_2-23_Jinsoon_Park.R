rm(list=ls())

# Residual bootstrap


plot(mtcars$wt, mtcars$mpg)
x <- mtcars$wt
y <- mtcars$mpg

reg <- lm(y~x)
abline(reg)

bhat <- reg$coefficients[2]
n <- nrow(mtcars)
num <- sum(((x-mean(x))^2)*(reg$residuals^2))/(n-2)
den <- sum((x-mean(x))^2) / (n-1)
se <- sqrt(num)/den

t <- sqrt(n)*bhat / se

B <- 999
b_star <- rep(NA, B)
t_star <- rep(NA, B)


for (b in 1:B) {
  index <- sample(1:n, n, replace = T)
  
  x_star <- x
  u_star <- reg$residuals[index]
  alpha <- reg$coefficients[1]
  y_star <- alpha + bhat*x_star + u_star
  
  reg_resid <- lm(y_star~x_star)
  
  b_star[b] <- reg_resid$coefficient[2]
  
  num_b <- sum(((x_star - mean(x_star))^2)*(u_star^2))/(n-2)
  den_b <- sum((x_star - mean(x_star))^2) / (n-1)
  se_b <- sqrt(num_b)/den_b
  
  
  t_star[b] <- sqrt(n)*(b_star[b] - bhat) / se_b
}


t_star <- sort(t_star)
hist(t_star, breaks=30, probability = T, col = "grey", main="Distribution of t_resid", xlim = c(-9,9))
lines(density(t_star), col="red")

cv <- c(t_star[25], t_star[975])
abline(v=c(cv, t), col=c("blue"), lty=c(2,2,1), lwd=3)



# Wild Bootstrap

W <- 999
t_wild <- rep(NA, W)
b_wild <- rep(NA, W)

for (w in 1:W) {
  wild <- sample(c(-1,1), n, replace = T)
  x_wild <- x
  u_wild <- reg$residuals*wild
  y_wild <- reg$coefficients[1] + bhat*x_wild + u_wild
  
  reg_wild <- lm(y_wild~x_wild)
  b_wild[w] <-reg_wild$coefficients[2]
  
  num_wild <- sum(((x_wild - mean(x_wild))^2)*(u_wild^2))/(n-2)
  den_wild <- sum((x_wild - mean(x_wild))^2) / (n-1)
  se_wild <- sqrt(num_wild)/den_wild
  
  t_wild[w] <- sqrt(n)*(b_wild[w] - bhat) / se_wild
  
}

t_wild <- sort(t_wild, F)
hist(t_wild, breaks=30, probability = T, col = "grey", main="Distribution of t_wild", xlim = c(-9,9))
lines(density(t_wild), col="red")

t_wild[25]
t_wild[975]
cv1 <- c(t_wild[25], t_wild[975])
abline(v=c(cv1, t), col=c("green"), lty=c(2,2,1), lwd=3)

