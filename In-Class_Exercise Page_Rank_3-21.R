rm(list=ls())

#Exercise (3/21) Page Rank

#1 

#(a) while

m1 <- c(0, 1/3, 1/3, 1/3)
m2 <- c(0, 0, 1/2, 1/2)
m3 <- c(1, 0, 0, 0)
m4 <- c(1/2, 0, 1/2, 0)

M <- cbind(m1, m2, m3, m4)

P1 <- c(0,0,0,0)
P2 <- c(0,1,0,0)
P <- cbind(P1, P2)

t=2 

while (sum(abs(P[,t]-P[,t-1]))>0.001){
  P<-cbind(P, rep(0,4))
  P[,t+1] <- M%*%P[,t]
  t <- t+1
}

P[,t]

cat("Your final page rank is", t,".")

#(b) eigenvalue

eigen(M)

lambda1 <- (round(diag(eigen(M)$values)))^t
Q1 <- eigen(M)$vectors
Q1
Q1inv <- solve(Q1)

MP1 <- Q1%*%lambda1%*%Q1inv%*%P2
MP1

#2 

ind <- 1:1000
M2 <- matrix(rep(0, 1000^2), nrow=1000, ncol=1000)
for (i in 1:1000) {
  a <- sample(x=1:10, size=1)
  b <- sample(x=1:1000, size=a)
  M2[b,i] = 1/a
}

#(a) while

j <- 2
Q <- c(1,rep(0,999))
Q <- cbind(rep(0,1000),Q)


while(sum(abs(Q[,j]-Q[,j-1])) > 0.001){
  Q <- cbind(Q,rep(0,1000))
  Q[,j+1] <- M2%*%Q[,j]
  j <- j+1
}

cat("Your page rank is:",j)

#(b) Eigenvalue Method
lambda2 <- round(diag(eigen(M2)$values))
Y <- eigen(M2)$vectors
Y <- matrix(Y,ncol=1000)

Yinv <- solve(Y)

P0 <- c(1,rep(0,999))

MP2 <- Y%*%lambda2%*%Yinv%*%P0

# Something has done wrong... 
# The below have the identical value. 
MP2[1,1]
Q[1,j]

# Eigenvalue method needs more computing power with data with bigger dimensions
# Finding the inverse of such matrix takes more time than the while loop method. 


