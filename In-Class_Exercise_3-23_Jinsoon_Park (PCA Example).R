# PCA Examples

rm(list=ls())

library(datasets)
data(USArrests)
pairs(USArrests, panel=panel.smooth, main="USArrests data")

US.prin <- princomp(USArrests, cor=TRUE)
summary(US.prin)

screeplot(US.prin, npcs=4, type="lines")

loadings(US.prin)

US.prin$scores

biplot(US.prin)
