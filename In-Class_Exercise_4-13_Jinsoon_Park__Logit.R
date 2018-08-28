rm(list=ls())

setwd("C:/Users/Jinsoon/Desktop/5495 R/Dataset")


college <- read.csv("College.csv")
college.2 <- college[,c(-1,-7,-8,-9,-10,-11,-12,-14,-15)]
head(college.2)


college.2$dummy_pc <- as.numeric(college.2$perc.alumni > mean(college.2$perc.alumni))
table(college.2$dummy_pc)

head(college.2)


# Find the variables that provide good prediction for this dummy varaible.

par(mfrow=c(3,3), mar=c(4,4,2,0.5))

for (j in c(2:10)) {
  plot(college.2[,1],college.2[,j], xlab="dummy_pc",
       main=paste("Boxplot of", colnames(college.2)[j]),
       col="lightblue")
}

logistic <- glm( dummy_pc ~ ., data=college.2, family="binomial")
