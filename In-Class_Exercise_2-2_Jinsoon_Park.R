rm(list=ls())

# Exercise 1

a <- 1:9
matrix_a <- (matrix(a,3,3))^2
matrix_a

matrix_b <- (t(matrix(a,3,3)))^2
matrix_b              

# Exercise 2

Storrs <- c(365, 489)
Hartford <- c(426, 387)
Stamford <- c(571, 486)

HP_vector <- c(Storrs, Hartford, Stamford)
HP_vector

HP_matrix <- matrix(HP_vector, 3, byrow = T)
HP_matrix

Area <- c("Storrs", "Hartford", "Stamford")
Type <- c("House", "Condo")

rownames(HP_matrix) <- Area 
colnames(HP_matrix) <- Type
HP_matrix

CT_average <- apply(HP_matrix, 2, mean)
CT_average

HP_matrix.2 <- rbind(HP_matrix, CT_average)
HP_matrix.2

HP_matrix.f <- apply(HP_matrix.2, 1, mean)
HP_matrix.f

# Exercise 3

Income <- rchisq(100, 5)
yrsofedu <- sample(7:16, 100, replace = T)
CT <- cbind(Income, yrsofedu)
CT

gender <- sample(c("male", "female"), 100, replace = T)
b <- gender == "female"
CT1 <- CT[b,]
CT1
CT2 <- CT[yrsofedu > 12, ]
CT2

apply(CT1, 2, mean)
apply(CT2, 2, mean)
