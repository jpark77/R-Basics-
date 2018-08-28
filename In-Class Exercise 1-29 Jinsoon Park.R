rm(list=ls())

# Exer 1

set.seed(pi)
nor <- rnorm(200,6,9)

nor_mid <- nor[4<nor & nor<7]
which( nor %in% nor_mid )

nor_end <- nor[nor>9 | nor<3]

# Exer 2

set.seed(1)

income <- rchisq(1000, 8)
mid_income <- income[income > quantile(income, .4) & income < quantile(income, .6)]

hist(mid_income)

# Exer 3

linkedin <- c(16,9,13,5,2,17,14)
facebook <- c(17,7,5,16,8,13,14)
week <- c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun")
names(linkedin) <- week
names(facebook) <- week

week[linkedin > 15]
week[linkedin <= 5]
week[linkedin > facebook]


#Exer 4 

set.seed(1)
n<-1000
vec <-rnorm(n,0,1)
extreme <- as.logical( abs(vec) > 1.96 )
sum(extreme == 1)/n

#Exer 5 
set.seed(pi) 
numbers <- sample(1:1000, 1000, replace = T)
is.even <- numbers[numbers%%2 == 0]
length(is.even)


#Exer 6

salary <- c(54, 35, 65, 34, 67, 76, 100, 3, 154, 44, 37, 98, 254)
name <- c("Tom", "Annie", "John", "Park", "Kim", "Bob", "Julia", "Ben", "Steven", "Nick", "Lee", "Don")

names(salary) <- name

between <- salary[name > "A" & name < "K" ]
between



