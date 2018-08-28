rm(list=ls())

# Exercise 1

mtcars

head(mtcars)
attach(mtcars)

tail(mtcars)


LM <- lm(mpg~cyl+hp)
summary(LM)
detach(mtcars)

# Exercise 2
name <- c("Apple","MS","Google","Honda","GM","Volks","Hyundai","Amazon")
type <- c("IT","IT","IT","Auto","Auto","Auto","Auto","IT")
stock <- c(165.5, 55.48, 1119.20, 36.16, 41, 172.06, 162.5, 1429.95)
US <- c(T,T,T,F,T,F,F,T)

portfolio <- data.frame(name, type, stock, US)
rm(name, type, stock, US)

str(portfolio)

portfolio$stock[portfolio$name %in% "Google"]
#attach(portfolio)
#portfolio[name=="Google", c("name", "stock")]

head(portfolio)
portfolio[3,]
head(portfolio[,3],5)
portfolio[portfolio$type == "IT",]

subset(portfolio, subset=stock<stock[name=="Apple"])

rank <- order(portfolio$stock, decreasing = T)
portfolio[rank,]
