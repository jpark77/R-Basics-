
rm(list=ls())
# Exercise 1

president <- c("Obama:2009-2007","Bush:2001-2009", "Clinton:1993-2001", "Bush:1989-1993", "Reagan:1981-1989")

president_term <- strsplit(president, split = ":")
president_upper <- lapply(president_term, toupper)

select_first <- function(x) {
  x[1] 
}

select_first(president_term)

lapply(president_upper, FUN=select_first)

# Exercise 2

mtcars
n <- nrow(mtcars)

x <- mtcars$wt
y <- mtcars$mpg

reg <- lm(y~x)
reg$coefficients

# Jackknife SD

beta.omitting.one <- function(i, x, y) {
  beta <- lm(y[-i]~x[-i])
  return(beta$coefficients[2])
}

beta.jack <- sapply(1:n, FUN = beta.omitting.one, x=x, y=y)
SD.Jack <- sqrt((n-1)^2/n)*sd(beta.jack)
SD.Jack

# Conventional SD

reg.full <- lm(y~x)
summary(reg.full)

bhat <- reg.full$coefficients[2]
num <- sum(((x-mean(x))^2)*(reg.full$residuals^2))/(n-2)
den <- sum((x-mean(x))^2) / (n-1)
SE.conventional <- sqrt(num)/(den*sqrt(n))
SE.conventional  
  
# Bootstrap SD

B <- 999
b_star <- c()
  
for (b in 1:B) {
  index <- sample(1:n, size = n, replace = T)
  x_star <- mtcars$wt[index]
  y_star <- mtcars$mpg[index]
  reg_star <- lm(y_star~x_star)
  b_star[b] <- reg_star$coefficients[2]
}  

sd(b_star)
