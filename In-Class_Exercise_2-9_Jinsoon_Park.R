# Exercise 1

mtcars
nrow(mtcars)

a <- which(row.names(mtcars)=="Cadillac Fleetwood")
mtcars1 <- mtcars[1:a-1, ]
mtcars1
mtcars2 <- mtcars[a:nrow(mtcars),]
mtcars2

mtcars2[, c("vs", "am")] <- NULL
mtcars2[, c("vs", "am")] <- NA

mtcars_merged <- rbind(mtcars1, mtcars2)
mtcars_merged


# Exercise 2 

b <- which(names(mtcars)=="wt")
mtcars3 <- mtcars[,1:b-1]
mtcars4 <- mtcars[, b:ncol(mtcars)]
name <- row.names(mtcars)

mtcars3 <- cbind(name, mtcars3)
mtcars4 <- cbind(name, mtcars4)

row.names(mtcars3) <- NULL
row.names(mtcars4) <- NULL

mtcars3
mtcars4

a <- substr(row.names(mtcars), 1, 4)
mtcars4 <- mtcars4[!(a=="Merc"),]
mtcars4

mtcars_all <- merge(mtcars3, mtcars4, by = "name", all=T)
mtcars_all


# Exercise 3 

mov <- "The Shining"
act <- c("Jack Nicholson", "Shelley Duvall", "Danny Lloyd", "Scatman Crothers", "Barry Nelson")
scores <- c(4.5, 4.0, 5.0)
sources <- c("IMDb1", "IMDb2", "IMDb3")
comments <- c("Best Horror Film I have ever seen", "A truly brilliant and scary shit", "A masterpiece of horror")
rev <- data.frame(scores, sources, comments)

shine_list <- list(mov, act, rev)
shine_list

rm(mov, act, scores, comments, rev)


names(shine_list) <- c("moviename", "actors", "reviews")
shine_list

shine_list$actors
shine_list$actors[2]
shine_list$review$scores*5
shine_list$review$comments

year = c("1980")
shine_list$year_of_release <- year

shine_list_new <- shine_list
shine_list_new
