rm(list=ls())

setwd("C:/Users/Jinsoon/Desktop/5495 R/Dataset")

data.set <- read.csv("histogram.csv", stringsAsFactors = F)
data.set <- data.set[data.set$YRDATA==2013,]
ct.data <- data.set[data.set$STATE=="Connecticut",]

ct.data$ENROLL[ct.data$ENROLL== 0] <- NA # remove data with 0 enrollment
index1 <- which(ct.data$TOTALEXP/ct.data$ENROLL >30) 

ct.data$Proportion <- ct.data$TOTALEXP/ct.data$ENROLL

plot(ct.data$Proportion, main="Per Student Expenditure by School")

points(index1, ct.data$Proportion[index1], pch=16, col="red")

text(index1, ct.data$Proportion[index1], labels=ct.data$NAME[index1], cex=0.5)

al.data <- data.set[data.set$STATE=="Alabama",]
al.data$Proportion <- al.data$TOTALEXP/al.data$ENROLL

hist(ct.data$Proportion, col=rgb(0.5,0.8,0.5,0.2), freq=T,
     breaks=seq(0,50, by=2), ylim=c(0,100), xlab="Per Student Expenditure",
     main="Per Student Expenditure of CT and AL Schools")

hist(al.data$Proportion, col=rgb(0.9,0.1,0.1,0.3), freq=T,
     breaks=seq(0,50, by=2), ylim=c(0,100), add=T)

legend("right", legend=c("CT", "AL"), text.col=c("darkseagreen3", "darksalmon"), 
       pch=c(7,7), col=c("darkseagreen3", "darksalmon"))


