rm(list=ls())

#Exercise 

# 1. Which league is the best in terms of wage (eur_wage) and overall? 
# 2. Based on "eur_value", which team has the most players in top 100?
#    hint: 1. Sort based on eur_value, 2. Make sure that team is a factor 
# 3. Present the distribution of average wage (eur_wage) based on age. 
#    hint: 1. Use aggregate() function to obtain average wages for each age, 2. Use plot() function 
# 4. Which team has the most players under 23? 
#    hint: Make sure that team is a factor

setwd("C:/Users/Jinsoon/Desktop/5495 R/Dataset/fifa-18-more-complete-player-dataset")
fifa18 <- read.csv("complete.csv")

#1
avg_wage <- aggregate(fifa18[, c("eur_wage")], list(fifa18$league), mean, na.rm=T)
avg_wage[which.max(avg_wage[,2]),]

avg_overall <- aggregate(fifa18[, c("overall")], list(fifa18$league), mean, na.rm=T)
avg_overall[which.max(avg_overall[,2]),]

#2

ordered_value <- order(fifa18$eur_value, decreasing = T )

value_100 <- fifa18[ordered_value[1:100], "club"]
# value_100
uniq <- unique(value_100)
value100_club <- uniq[which.max(tabulate(match(value_100,uniq)))] # count # of playas in the team as in "mode"
#value100_club  

#3

Wage_by_age <- aggregate(fifa18[, c("eur_wage")], list(fifa18$age), mean, na.rm=T)
plot(Wage_by_age)

#4

age_under_23 <- fifa18[fifa18$age <= 23, "club"]
# age_under_23

uniq1 <- unique(age_under_23)

which.max(tabulate(match(age_under_23,uniq1)))
ageu23 <- uniq1[which.max(tabulate(match(age_under_23,uniq1)))]
ageu23 # No club name! :  Majority of 23 year-olds do not belong to a certain team



