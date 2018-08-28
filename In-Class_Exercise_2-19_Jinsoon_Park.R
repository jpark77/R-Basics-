rm(list=ls())
#Exercise 

y <- 6
j <- 6
m <- 8

loss_count_y <- 0
loss_count_j <- 0
loss_count_m <- 0

for (i in 1:2000) {
  while (y>0 & j>0 & m>0) {
    a <- sample(1:6, 1)
    if (a==1) {
      y <- y + 1 
      m <- m - 1
    } else if (a==2) {
      y <- y + 1
      j <- j - 1
    } else if (a==3) {
      j <- j + 1
      m <- m - 1 
    } else if (a==4) {
      j <- j - 1
      m <- m + 1
    } else if (a==5) {
      j <- j + 1
      y <- y - 1
    } else if (a==6) {
      m <- m + 1
      y <- y - 1
    }
  } 
  if (y==0) {
    loss_count_y <- loss_count_y + 1 
  } 
  else if (j==0) {
    loss_count_j <- loss_count_j + 1 
  } 
  else if (m==0) {
    loss_count_m <- loss_count_m + 1
  } 
  y <- 6
  j <- 6
  m <- 8
  
}

print(loss_count_y)
print(loss_count_j)
print(loss_count_m)

loss_count_y / 2000

