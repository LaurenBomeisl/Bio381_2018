# Create fake data set
# 15 April 2018
# LPB

library(MASS)
z <- rnorm(n=3000,mean=0.2)
z <- data.frame(1:3000,z)

