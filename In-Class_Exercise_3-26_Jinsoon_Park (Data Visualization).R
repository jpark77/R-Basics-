
rm(list=ls())

n=50
set.seed(0)
x = sort(runif(n, min=-2, max=2))
y = x^3 + rnorm(n)
plot(x, y, type="p")
plot(x, y, type="p", cex=0.5, main="Shrunk Points")
plot(x, y, type="p", cex=2, main="Expanded points")

plot(x, y, type="p", xlim=c(-1,0))
plot(x, y, type="p", xlim=c(-1,1), ylim=c(-5,5), xlab="Trimmed X", ylab="Trimmed Y")

x.trimmed <- x[-1<=x & x <=1]
y.trimmed <- x.trimmed^3 +rnorm(length(x.trimmed))

plot(x.trimmed, y.trimmed, type="p")

plot(x, y, pch=c(1,16))

x2 = sort(runif(n, min=-2, max=2))
y2 = x2^2 + rnorm(n)


plot(x, y, type ="p", xlab = "X", ylab = "Y") 
points(x2,y2, col="blue")

lines(x2, y2, type="l", col="red", lwd=2)

legend("bottomright", legend =c("Cubic", "Quadratic"), col=c("black", "blue"), pch=c(1, 16), text.col="brown")

a <- 1:10
b1 <- a^2
b2 <- 2*b1
plot(a, b1, type="b", pch=19, col="red", xlab="a", ylab="b")
lines(a, b2, pch=18, col="blue", type="b", lty=2)

legend(1, 95, legend=c("Line 1", "Line 2"), col=c("red", "blue"), lty=1:2, cex=0.8)
text(4, 50, labels="hello")
text(1, 5, labels="MSQE")
