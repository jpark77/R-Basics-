rm(list=ls())

setwd("C:/Users/Jinsoon/Desktop/5495 R/Dataset/")
college <- read.csv("College.csv")

#1 

boxplot(college$Personal~college$Private)

college_public <- college[college$Private=="No",]
college_private <-  college[college$Private=="Yes",]

t.test(college$Personal[college$Private=="Yes"],
       college$Personal[college$Private=="No"], var.equal = T)

t.test(college$Personal[college$Private=="Yes"],
       college$Personal[college$Private=="No"], var.equal = F)

#2. 
Index <- order(college$Top10perc, decreasing = F)

length(Index)/3

bot <- Index[1:259]
mid <- Index[260:(2*259)]
top <- Index[(2*259 +1):length(Index)]

group.college <- rep("Bottom", 777)
group.college[mid] <- "Middle"
group.college[top] <- "Top"

group.college.factor <- factor(group.college, levels=c("Top","Middle","Bottom"))                      

college <- cbind(college, group.college.factor)

pairwise.t.test(college$Grad.Rate, college$group.college.factor, p.adj="bonferroni")

# Top, Middle, Bottom groups of the colleges have all different means


