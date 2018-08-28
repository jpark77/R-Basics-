rm(list=ls())

# Data Visualization 3 (Contour) Exercise

#1.Draw contour lines of an upper half of a sphere with a radius of 5 and also make image

x <- matrix(rep(seq(-5, 5, length=50), 50), 50, 50)
y <- t(x)

z_sq <- (5^2 - x^2 - y^2)*(5^2 -x^2 - y^2 >0)
z <- sqrt(z_sq)
z[z==0] <- NA

f <- function(x,y) {r <- z}

persp(x[,1], y[1,], z, theta = -10, phi = 50, expand = 0.5, col = "lightblue", 
      xlim=c(-6,6), ylim=c(-6,6), xlab="x",
      ylab="y", zlab="z")
image(z, col=terrain.colors(10))
contour(z, col=1:10, add=T)



# Run the following regression model and draw a graph in 3-D.
x1 <- runif(100, min=-1, max=1)
y1 <- runif(100, min=-1, max=1)
z1 <- 1 + x1 + 2 * y1 + rnorm(100)
reg <- lm(z1~x1+y1)

x1m <- matrix(rep(seq(-1,1, length=10), 10), 10, 10)
y1m <- t(x1m)
zhat <- reg$coefficients[1] + reg$coefficients[2]*x1m + reg$coefficients[3]*y1m

surface <- persp(x1m[,1], y1m[1,], zhat, theta = 10, phi = 10, expand = 1, col = "lightgreen", 
                 xlim=c(-1.2,1.2), ylim=c(-1.2,1.2), xlab="x", ylab="y", zlab="z")
xy.list = trans3d(x1, y1, z1, surface)
points(xy.list, pch=20, col=heat.colors(10))
