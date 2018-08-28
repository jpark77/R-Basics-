rm(list=ls())

# Exercise 1

set.seed(pi)
r <- rnorm(2754, 0, 1)
income <- exp(r)

quant <- quantile(income, c(0.10, 0.35, 0.75, 0.98))

income.level <- rep(NA, 2754)

income.level[income <= quant[1]] <- "VL"
income.level[income > quant[1] & income <=  quant[2]] <- "L"
income.level[income > quant[2] & income <=  quant[3]] <- "M"
income.level[income > quant[3] & income <=  quant[4]] <- "H"
income.level[income > quant[4]] <- "VH"

factor_income.level <- factor(income.level, ordered=T, levels <- c("VL", "L", "M", "H", "VH"))
factor_income.level

levels(factor_income.level) <- c("Very Low", "Low", "Middle", "High", "Very High")
as.numeric(factor_income.level)

summary(factor_income.level)

income.high <- income[income > quant[3]]
income.high

hist(income.high, breaks = 20)

average_high <- mean(income.high)
average_high

income.veryhigh <- income[income > quant[4]]
average_veryhigh <- mean(income.veryhigh)
average_veryhigh

gap_highandveryhigh <- average_veryhigh - average_high
gap_highandveryhigh

# Exercise 2 

set.seed(pi)
industry <- sample(c("Manufacture", "Service", "IT"), 100, replace=T, prob=c(0.3, 0.5, 0.2))
stock <- rep(NA, 100)
stock[industry == "Manufacture"] <- rnorm(sum(industry=="Manufacture"), 3, 2)
stock[industry == "Service"] <- rnorm(sum(industry=="Service"), 2, 4)
stock[industry == "IT"] <- rnorm(sum(industry=="IT"), 8, 8)

factor.industry <- factor(industry)
factor.industry

summary(factor.industry)

average_Manufacture <- mean(stock[industry=="Manufacture"])
average_Service <- mean(stock[industry=="Service"])
average_IT <- mean(stock[industry=="IT"])

sd_Manufacture <- sd(stock[industry=="Manufacture"])
sd_Service <- sd(stock[industry=="Service"])
sd_IT <- sd(stock[industry=="IT"])

Stock_Avg <- matrix(c(average_Manufacture, average_Service, average_IT), ncol=1, byrow=TRUE)
colnames(Stock_Avg) <- c("Average")
rownames(Stock_Avg) <- c("Manufacture", "Service", "IT")
Stock_Avg <-as.table(Stock_Avg)
Stock_Avg

Stock_sd <- matrix(c(sd_Manufacture, sd_Service, sd_IT), ncol=1, byrow=TRUE)
colnames(Stock_sd) <- c("SD")
rownames(Stock_sd) <- c("Manufacture", "Service", "IT")
Stock_sd <-as.table(Stock_sd)
Stock_sd

