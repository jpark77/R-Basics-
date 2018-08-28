rm(list=ls())

#Exercise (2/12)

# 1. Which league is the best in terms of wage (eur_wage) and overall? 

setwd("C:/Users/Jinsoon/Desktop/5495 R/Dataset/fifa-18-more-complete-player-dataset")
fifa18 <- read.csv("complete.csv", stringsAsFactors = F, na.strings = "") # remove empty data
fifa18 <- fifa18[,c("name","club","age", "league", "eur_value", "eur_wage", "overall")]
head(fifa18)

str(fifa18)
summary(fifa18)

league_wage <- aggregate(fifa18[,"eur_wage"], by=list(fifa18$league), mean) # average individual playas' wage within the league
names(league_wage) <- c("league","avg_wage")
head(league_wage)
tail(league_wage)

# way to sort

rank_wage <- order(league_wage[,"avg_wage"], decreasing = T)  #output recorded as indices
league_wage <- league_wage[rank_wage,]

league_overall <- aggregate(fifa18[,"overall"], list(fifa18$league), mean)
names(league_overall) <- c("league","avg_overall")

rank_overall <- order(league_overall[,"avg_overall"], decreasing = T)
league_overall <- league_overall[rank_overall,]

cbind(league_wage, league_overall)

# 2. Based on "eur_value", which team has the most players in top 100?
#    hint: 1. Sort based on eur_value, 2. Make sure that team is a factor 

rank_value <- order(fifa18[,"eur_value"], decreasing = T)
league_value <- fifa18[rank_value,]
league_value100 <- league_value[1:100,]
league_value100$rank_value <- 1:100

league_value100
str(league_value100)

factor(league_value100$club)
team_stat <- summary(factor(league_value100$club))
team_stat
sort(team_stat, decreasing = T)

# 3. Present the distribution of average wage (eur_wage) based on age. 
#    hint: 1. Use aggregate() function to obtain average wages for each age, 2. Use plot() function 

age_wage <- aggregate(fifa18[,"eur_wage"], list(fifa18$age), mean)
names(age_wage) <- c("age","avg_wage")
age_wage

plot(age_wage$age, age_wage$avg_wage, xlab = "age", ylab="average wage")
boxplot(eur_wage~age, data=fifa18, xlab = "age", ylab="wage", range=0) 

# 4. Which team has the most players under 23? 
#    hint: Make sure that team is a factor

team23 <- factor(fifa18[fifa18$age<23, "club"])
team_age <- table(team23)
team_age_rank <- sort(team_age, decreasing = T)
team_age_rank[1:10]




