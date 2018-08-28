rm(list=ls())

# Data Structure 

gender <- c("Male", "Female", "Female", "Male", "Male")
is.vector(gender) 
class(gender)

factor_gender <- factor(gender)
factor_gender

a <- c(0,0,1,0,1,1,1,1,0,1,0)
factor_a <- factor(a)

#No ordering
pet <- c("Cat", "Dog", "Turtle", "Dog", "Cat", "Cat")
factor_pet <- factor(pet)
factor_pet
class(factor_pet)

#NAtural ordering
income <- c("High", "High", "Low", "Medium", "Low")
factor_income <- factor(income, ordered=T, levels <- c("Low", "Medium", "High"))
factor_income
class(factor_income)

#recovering 
edu <- c("E","E","H","M","H","C")

factor_edu <- factor(edu, ordered = T, levels <- c("E", "M", "H", "C"))
levels(factor_edu) <- c("Elemetary", "Middle", "High", "College")
factor_edu
as.numeric(factor_edu)


summary(factor_edu)
summary(edu)

a <- factor_edu[3]
a
b <- factor_edu[6]
b

a>b
