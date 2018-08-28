rm(list=ls())

# 1. CSV data 
getwd()
setwd("C:/Users/Jinsoon/Desktop/5495 R/Dataset")
dir()
rev_exp0 <- read.csv("district_rev_exp.csv")
rev_exp <- read.csv(file.choose(), stringsAsFactors=F) #Either of them is fine

rev_exp$STATE <- as.factor(rev_exp$STATE)

class(rev_exp)
head(rev_exp)
tail(rev_exp)

str(rev_exp)
summary(rev_exp)

rev_exp$TOTALREV[rev_exp$TOTALREV == "-"] <- NA
rev_exp$TOTALREV <- as.numeric(rev_exp$TOTALREV)

colMeans(rev_exp[rev_exp$STATE == "California", c("ENROLL", "TOTALREV", "TOTALEXP")], na.rm=T)
colMeans(rev_exp[rev_exp$STATE == "Connecticut", c("ENROLL", "TOTALREV", "TOTALEXP")])

aggregate(rev_exp[ ,c("ENROLL", "TOTALREV", "TOTALEXP")], list(rev_exp$STATE), mean, na.rm=T)  # at once

#list() specifies the criterion to make groups
aggregate(rev_exp[ ,c("ENROLL", "TOTALREV", "TOTALEXP")], by=list(ST=rev_exp$STATE, EnR=rev_exp$ENROLL>1000), FUN=mean, na.rm=T)

a <- na.omit(rev_exp)
a

# 2. text file

rev_exp1 <- read.delim(file.choose(), stringsAsFactors = FALSE)
head(rev_exp1)
tail(rev_exp1)

# 3. read.table: read any tabular 

rev_exp2 <- read.table(file.choose(), sep="/", stringsAsFactors = F)
head(rev_exp2)
names(rev_exp2)
rev_exp2 <- read.table(file.choose(), sep="/", header=T, stringsAsFactors = F)
names(rev_exp2)
head(rev_exp2)
str(rev_exp2)

# read csv files and tab delimited txt files using read.table

rev_exp3 <- read.table(file.choose(), sep=",", header=T, stringsAsFactors = F) #.csv and can use sep = "\t"

# install the package "readx1

install.packages("readxl")
library(readxl)
excel_sheets(file.choose())
rev_exp4 <- read_excel(file.choose(), sheet = 1)



