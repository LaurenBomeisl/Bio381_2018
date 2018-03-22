# Basic R commands and usage
# 30 January 2018 
# LPB

  
# Using the assignment operator
  x <- 5 #preferred
  print(x)
  y=4 #LEGAL BUT NOT USED EXCEPT IN A FUNCTION
  y=y+1.1
  y<- y+1
  plantHeight <- 5.5
  #------------------------{end class 30 Jan}
  
  #the concatinate! function
  z <- c(3, 7, 7, 10) # simple atomic vector
  print(z)
  typeof(z) # get the variable type
  str(z) # get structure of the variable
  is.numeric(z) #logical test for variable type
  is.character(z)
  
  # c always "flattens to an atomic vector
  
  z <- c(c(3,4),c(5,6))
  print(z)
  
  # character strings with single or double quotes
  z <- c("perch", "bass", "trout", "red snapper")
  print(z)
  
  # use both quote types for an internal quote
  
  z <- c("This is only 'one' character strong", 'a second string')
  str(z)
  
  # logical TRUE FALSE 
  z<- c(TRUE, TRUE, FALSE)
  is.numeric(z)
  is.logical(z)
  
  
  # three properties of atomic vectors
  # Type of atomic vector
  z <- c(1.1, 2.2, 3.2)
  typeof(z)
  is.numeric(z)
  # length of vector
  length(z)
  # Name of vector elements (optional)
  z <- runif(5) #random uniform variable between [0,1]
  names(z) <- c("chow","pug","beagle","greyhound", "akita")
  print(z)
  
  #add names when variable is built
  z2 <- c(gold=3.3, silver=10, lead=2)
  print(z2)
  names(z2) <- NULL #reset the names
  print(z2)
  names(z2) <- c("copper","zinc")
  print(z2)
  #special data values
  
  
  
  #NA for missing values
  z <- c(3.2, 3.3, NA)
  length(z)
  typeof(z[3]) #examine the third element of the array
  # missing values can trip up basic functions
  mean(z) #outputs NA, does not work
  is.na(z) #check to see if there are NA values
  !is.na(z) # ! represents NOT
  mean(!is.na(z)) #WRONG
  mean(z[!is.na(z)])
  
  #---------------
  # NaN, Inf, -Inf
  #these are bad results from numeric calculations
  z<= 0/0
  print(z)
  z <- 1/0
  print(z)
  z <- 1/0
  print(z)
  z <- 0/1 #OK
  print(z)
  z <- 1/0 
  typeof(z)
  
  #---------------
  
  #null is an object that is nothing
  
  z <- NULL
  typeof(z)
  lengthof(z)
  is.null(z)
  # three properties of atomic vectors
  # coercion (elements have to have the same type of variables)
  
  a <- c(2.1, 2.2)
  typeof(a)
  b <- c("purple","green")
  typeof(b)
  d <- c(a,b) #combine two separate vectors into a single vector
  typeof(d)
  d 
  # hierarchy of conversion
  # logical -> integers -> double -> character
  
  a <- runif(10)
  print(a)
  a > 0.5 # logical operation
  temp <- a > 0.5 #hold these logical values (T,F = 1,0)
  sum(temp)  
  # what proportion of the values are > 0.5
  mean(a > 0.5)
  
  # qualifying exam question: aprproximately what proportion of observations from a normal (0,1) random variable are > 2.0
  
  mean(rnorm(1000)>2.0)   # of the 1000 values generated, what is the proportion of those that are greater than 2
  # these are basically the tails of the set of values, the larger the sample size or number of values generated,
  # variation there will be amongst different means for different data sets
  
  mean(rnorm(100000000)>2.0)
  #------------- vectorization
  
  z <- c(10,20,30)
  z + 1 
  y <- c(1,2,3)
  z+y  #element by element matching (vector addition)
  
  short  <- c(1,2)
  z + short # what happens?
  #shorter vector is recycled through to add whatever comes next in the loop to the longer vector
  
  z^2
  #creating vectors
  #create an empty vector
  z <- vector(mode="numeric",length=0)
  print(z)

  
  # add elements to empty vector
  z <- c(z,5) # don't do this in your code
  print(z)
  
  # instead, create a vector of pre0-defined length)
  z <- rep(0,100)
  #vector created with room for 100 elements but populated in first element
  #however, this could create problems down the road if using 0, best to use NA
  z <- rep(NA,100)
  z[1] <- 3.3
  
  head(z)
  typeof(z)
  #would be logical if I had not assigned the first element prior to printing the type
  
  z[c(1,2)] <- c("Washington",2.2)
  typeof(z)  
  head(z)  
  # fill in a range of slots
  z[c(1:20)] <- c("Washington",2.2)
  #should fill in these two elements repetetively until the 20th position is filled
  head(z)  
  
  #generate a long list of names
  myVector <- runif(100) # get 100 random uniform
  myNames <- paste("File",seq(1:length(myVector)),".txt", sep="")
  #the seperator is nothing, all elements will be fused together
  head(myNames)
  head(myVector)  

  #epeat
  rep("mystring",3)
  #repeat the characters 'mystring' three times in an array
  rep(x=0.5,times=6)
  #repeat x 6 times to create an array
  rep(times=6,x=0.5) 
  #times of repetition and element itself can be ordered any way
  myVec <- c(1,2,3)
  rep(myVec,times=2)
  rep(x=myVec,each=2)
  #each individual element will be repeated n # of times
  rep(x=myVec,times=myVec)
  #times can also be represented per element with an array
  rep(x=1:3,times=3:1)
  
  #sequence for creating sequences
  seq(from=2,to=4)
  seq(from=2,to=4,by=0.5)
  #by parameter intended to specify value to incrementally increase or decrease
  seq(from=2,to=4,length=7)
  #if the increment is unknown but the total number of partitions desired is known, use length
  x <- seq(from=1,to=4,length=7)
  1:x
  1:length(x)
  seq_along(x) #faster, better
  1:5
  seq(1,5)
  seq_len(10)
  x <- vector(mode="numeric",length=0)
  str(x)
  1:length(x)
  #goes from 1 to zero
  seq_along(x) #more accuracy, especially with empty vectors
  
  #using random numbers
  runif(1)
  #any random number can occur when the seed has not been determined
  set.seed(100) #this number could be anything
  #set the seed for random number calculation so that results can be recreated
  runif(1) #now everyone has the same random value output because we set the seedd
  runif(n=5,min=11,max=200)
  
  library(ggplot2) #graphics library #better to insert this at top of code
  z <- runif(n=1000, min=30,max=300)
  qplot(x=z)
  #random normal values
  z <- rnorm(1000)
  qplot(x=z)
  z <- rnorm(n=1000,mean=30,sd=20) #control the width by identifying standard deviation
  qplot(x=z)
  
  #use the sample function to draw form an existing vector
  longVec<- seq_len(10)
  longvec
  sample(x=longVec)
  sample(x=longVec,size=3) #sample without replacement
  sample(x=longVec,size=3,replace=TRUE)
  
  #sample randomly, with preference to certain elements using weights
  
  myWeights <- c(rep(20,5),rep(100,5))  #must have the same number of elements as the vector that the weights apply to, 
  #also, the weights must be positive nubmers
  myWeights
  #these will be used to identify relative probabilities of values to be drawn
  
  #now we will use myWeights to create the sample
  sample(x=longVec,replace=TRUE,prob=myWeights)
  
  sample(x=longVec,replace=FALSE,prob=myWeights)
  #because the replace is false, all of the values in this list must be represented
  
  
  #subsetting of atomic vectors
  z <- c(3.1,9.2,1.3,0.4,7.5)
  
  # we have four different ways in which we can subset this vector
  # first we can subset on postivie index values
  z(2)
  z[c(2,3)] #call out the indeces of specified elements
  
  #subset on negative index values
  z[-c(2,3)]
  
  #subset by creating a boolean vector to select elements that meet a condition
  
  z<3 #returns whether this statement is true or false for each element
  z[z<3] #extract only the values within the array 'z' which are <3
  which(z<3)  #outputs the indices with elements that satisfy the statement
  myCriteria <- z<3
  z[myCriteria] #does the same thing as z[z<3] but this is useful when working with empty elements (see zx example below)
  z[which(z<3)]  #or this, which is also the same thing
  
  zx <- c(NA,z) #concatinate a missing value in the first element followed by 'z' array
  zx[zx<3]  #missing values are retained
  zx[which(zx<3)] #this drops the missing elements, which can mess up a data frame dimension length
  
  #keep entire vector
  z[]  #empty brackets output full vector (elements are non-specified)
  z[-(length(z):(length(z)-2))] #output elements in index 5 to 3 if no negative sign
  #because of the negative sign, everything but 5-3 is outputted
  
  z
  names(z) <- letters [seq_along(z)] #letters in a built in vector in R
  z[c("b","d","e")]

  
  #arithmetic operators
  10 + 3
  10 - 3
  10 * 3
  10 / 3
  10^3
  log(10)  
  log10(10)  #base e
  
  #modules operator (remainder)
  10 %% 3
  #integer division -- what's the remainder from this operation?
  
  #generate the set of all numbers from 1 to 100 that are divisble by 9
  
  q <- seq_len(100)
  q[q%%9==0]  ##include a conditional to identify which values of the array are printed
  
  #Feb 8, 2018
  #relational operators
  # all return a boolean value
  3 < 4
  3 > 5:7
  3 >= 3
  3 <= 4
  3 == 4 # make sure to use the double equal sign when using boolean
  3 != 4
  
  
   #set operators
  #compare two atomic vectors and return one atomic vector
  # set operators always strip out duplicate elements before the comparison
  # you can also apply unique to just one vector to strip out duplicates
  i <- c(1,1:7)
  print(i)
  j <- 3:10
  print(j)
  
  union(i,j) # all elements
  intersect(i,j) # common elements
  setdiff(i,j) # unique elements of i not in j
  setdiff(j,i) #unique elements of j not in i
  
  #set operators that return a single boolean
  setequal(i,j)
  setequal(i,i) #are they identical or not?
  is.element(i,j) #compare elements of i and j to find if there are similarities
  is.element(j,i)
  i %in% j  #another way to do comparison
  
  #logical operators
  z <-10:20
  z <15
  z < 20 & z > 17 #and operator
  z < 20 | z > 17 #or operator
  
  #atomic vectors -- all elements are of the same type
  
  
  
  
  
  
  
  