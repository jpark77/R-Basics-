rm(list=ls())

#Exercise 1
my_apples <-5
my_apples

B <- rchisq(1,5)
my_oranges <- round(my_apples*B) 

Comp <- (my_apples > my_oranges)
Comp

my_fruit <- my_apples + my_oranges
my_fruit

#Exercise 2
my_character <- "Father"
my_character2 <- "Mother"

my_character2 > my_character  #Lexicographic 

char.logi <- if(is.character(my_character) | is.logical(my_character)) 1  else  -1     
char.logi2 <- {(is.character(my_character) + is.logical(my_character)) - 0.5}*2
char.logi
char.logi2

#Exercise 3

reject <- 0 

for (i in 1 :1000) {
  x<-rbinom(100, 1, 0.5)
  x_bar <- mean(x)
  se_x <- sd(x)
  
  t_x <- (x_bar -0.5)/(se_x/sqrt(100))
  reject <- reject + 1*(abs(t_x)>1.96) }   #keep updating and store it at reject 

print(reject/1000)

# Exercise 4 

First.name <- "Jay"
Last.name <- "Park"
My.name <- paste(First.name, Last.name)
My.name

#Exercise 5
"Conecticut" %in% state.name

