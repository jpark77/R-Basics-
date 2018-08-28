
rm(list=ls())
name <- c("Tom", "James", "Mary", "Parker")
score <- c(9, 7, 6, 10)
grade <- factor(c("A", "C","D", "A"), order=T, levels=c("D","C","B","A"))
Econ_dep <- data.frame(name, score, grade)
Econ_dep

str(Econ_dep)

Econ_dep1 <- data.frame(name, score, grade, stringsAsFactors = F)
str(Econ_dep1)
Econ_dep2 <- data.frame(I(name), score, grade)
Econ_dep2

Econ_dep$name
name

rm(name, score, grade)

Econ_dep[c(3,1),]
Econ_dep



Econ_dep$grade <- NULL
Econ_dep


attendance <- c("all", "some", "never", "all")
Econ_dep <- cbind(Econ_dep, attendance)
Econ_dep
str(Econ_dep)

Econ_dep$gender <- c("Male", "Male", "Female", "Male")
str(Econ_dep)


