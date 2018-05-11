# randomization test for regression data
# 3 april 2018
# LPB


#preliminary call in
library(ggplot2)
library(TeachingDemos)
char2seed("P loss") #use random number seed for quality assurance
#this way the experiment can be recreated and consistent across different runs for a check

#############################################
# function: readData
# read in or generate data frame
# input: file name (or nothing for demo)
# output: 3-column data frame of observed data (ID, x, y)

#global
nVal<-20
applied<-runif(nVal,5,8)  # identify global variable for total p applied

readData <- function(z=NULL){
  if(is.null(z)) {
    xVar <- runif(nVal,2,5) #identify the x variable as P consumed
    yVar <- (applied-xVar)/applied #calculate p inefficiency
    
    dF <- data.frame(ID=seq_along
                     (xVar), xVar, yVar)} #close if statement
    
    return(dF)

  } #close compound statement
    readData()
    
    
##############################
    # function: getMetric
    # calculate metric for randomization test
    # input: 3-column data frame for regression
  
    getMetric <- function(z=NULL){
      if(is.null(z)) {
        xVar <- runif(nVal,2,5) #identify the x variable as P consumed
        yVar <- (applied-xVar)/applied #calculate p inefficiency
        
        z <- data.frame(ID=seq_along(xVar),
                         xVar, yVar)} #close if statement
        
      . <- lm(z[,3]~z[,2])
      . <- summary(.)
      . <- .$coefficients[2,1]
      slope <- .
      return(slope)
      
    }   #close compound statement
    getMetric()
        
  
    ################################################
    # function: shuffleData
    # randomize data for regression anlysis
    # input: 3 column data frame (id, x, y)
    # output: 3 column data frame (id, x, y)
    
    shuffleData <- function(z=NULL){
      if(is.null(z)) {
        xVar <- runif(nVal,2,5) #identify the x variable as P consumed
        yVar <- (applied-xVar)/applied #calculate p inefficiency
    
        z <- data.frame(ID=seq_along(xVar),
                        xVar, yVar)} #close if statement
      
      z[,3] <- sample(z[,3])
      return(z)
      
    }   #close compound statement
    shuffleData()
    
    
    #################################################
    # function: getPVAL
    # calculate p value for observed, simulated data
    # input: list of observed metric and vector of simulated metric
    # output: lower, upper tail probability vector
    # --------------------------------------------
    
    
    getPval <- function(z=NULL) {
            if(is.null(z)){
              z <- list(xObs=runif(1),xSim=runif(1000))}
      
      pLower <- mean(z[[2]] <=z[[1]])
      pUpper <- mean(z[[2]] >=z[[1]])
                     # double bracket operation identifies actual values, not rows or columns
                     
    return(c(pL=pLower,pU=pUpper))
      
    } 
    
    getPval()
    
    