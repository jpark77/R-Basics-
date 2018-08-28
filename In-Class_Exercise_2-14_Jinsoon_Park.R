rm(list=ls())

# Exercise (2-14)

# 1

a <- c("1903-01-13", "2018-02-14")
mydates <- as.Date(a)
days <- mydates[2] - mydates[1]
days

today <- Sys.Date()
origin_date <- as.Date("2018-01-01")

Seq_dates <- seq.Date(origin_date,today,1)
Seq_dates

#2 

setwd("C:/Users/Jinsoon/Desktop/5495 R/Dataset/Int Foot Results")
sc.game <- read.csv("results.csv", stringsAsFactors = F, na.strings = "")
head(sc.game)
str(sc.game)

sc.game$date <- as.Date(sc.game$date)
str(sc.game)

goals1 <- sc.game$home_score[(sc.game$date >= "1930-01-01" & sc.game$date <= "1939-12-31")] + sc.game$away_score[(sc.game$date >= "1930-01-01" & sc.game$date <= "1939-12-31")]
goals2 <- sc.game$home_score[(sc.game$date >= "2005-01-01" & sc.game$date <= "2014-12-31")] + sc.game$away_score[(sc.game$date >= "2005-01-01" & sc.game$date <= "2014-12-31")]

sum1 <- sum(goals1)
sum1
sum2 <- sum(goals2)
sum2

length(goals1)
ave.goal.1930s <- sum1/length(goals1)
ave.goal.1930s
ave.goal.2005_2014 <- sum2/length(goals2)
ave.goal.2005_2014

games.1950s <- sc.game[which(sc.game$date >= "1950-01-01" & sc.game$date <= "1959-12-31"),]
home_win <- games.1950s[which((games.1950s$home_score > games.1950s$away_score) == T),]
nrow(home_win)/nrow(games.1950s)
 
sum_home_win <- dim(home_win)[c(1)]
sum_home_win

sc.game$year <- substr(sc.game$date,1,4)
plot(factor(sc.game$year))




sc.game$year <- format(sc.game$data, format = "%Y")
plot(factor(sc.game$year), xlab="year", ylab="number of games")

