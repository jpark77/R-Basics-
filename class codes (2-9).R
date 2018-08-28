# Data Structure 4

rm(list=ls())

name <- c("Tom", "James", "Mary", "Paker")
score <- c(9,7,6,10)
grade <- factor(c("A", "C", "D", "A"), ordered=T, levels=c("D","C","B","A"))
Econ_dep <- data.frame(name, score, grade)

name <- c("Tom", "James", "Mary")

attendance <- c("all", "some", "never")
attitude <- c("good","good","bad")
Econ_dep1 <- data.frame(name, attendance, attitude)

rm(name, score, grade)
rm(attendance, attitude)

Econ_dep_f <- merge(Econ_dep, Econ_dep1, by="name", all = T, sort =F)
Econ_dep_f
