
today <- Sys.Date()
today
class(today)

now <- date()
now
class(now)

a<-c("2007-06-22", "2004-02-13")
class(a)
mydates <- as.Date(a)
mydates

a1 <- c("01/11/2013", "Feb-03-2013", "12/11/2014")
as.Date(a1)
mydates1 <- as.Date(a1, format=c("%m/%d/%Y","%b-%d-%Y"))
mydates1

format(mydates1, format="%B %d %Y")
format(mydates1, format="%m-%d-%Y")
format(mydates1, format="%Y")

mydates[1] > mydates[2]
days <- mydates[1] - mydates[2]
days
class(days)

mydates[1] +1 


