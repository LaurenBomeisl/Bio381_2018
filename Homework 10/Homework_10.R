# basic code for batch processing
# 27 March 2018
# LPB

##################################
# Function: FileBuilder
# create a set of random files for regression
# input: fileN=number of files to create
# -----: fileFolder=name of folder for random files
# -----: fileSize=c(min,max) number of rows in file
# -----: fileNA=number on average of NA per column
# output: set of random files
#---------------------------------

library(TeachingDemos)
char2seed("Freezing March")
#--------------------------
#Global variables
fileFolder<-"RandomFiles/"
nFiles<-100
fileOut<-"StatsSummary.csv"
#--------------------------


#
FileBuilder <- function(fileN=10,
                        fileFolder="RandomFiles/", #/ at the end is necessary
                        fileSize=c(15,100),
                        fileNA=3)  #define inputs outside of the for loop
  {
  for (i in seq_len(fileN)) {
    fileLength <- sample(fileSize[1]:fileSize[2],size=1)
    varX <- runif(fileLength)  #random x values
    varY <- runif(fileLength) #random y values
    dF<- data.frame(varX,varY) #bind variales to data frame
    badVals <- rpois(n=1,lambda=fileNA)   #using poisson to specify a frame
    dF[sample(nrow(dF),size=badVals),1] <- NA
    dF[sample(nrow(dF),size=badVals),2] <- NA
    
    # create a consecutive label system for file name with padded zeros (i.e. width=3)
    fileLabel <- paste(fileFolder,
                       "ranFile",
                       formatC(i,
                               width=3,
                               format="d",
                               flag="0"),
                       ".csv",sep="")
    
    # set up data file and incorporate time stamp and minimal metadata
    write.table(cat("# simulated random data file for batch processing",
                    "\n",
                    "# timestamp: ", as.character(Sys.time()),"\n",
                    "# LPB","\n",
                    "# --------------","\n",
                    "\n",
                    file=fileLabel,
                    row.names="",
                    col.names="",
                    sep=""))
    #representattive of exactly what time and date the infromation is collected
    write.table(x=dF,
                file=fileLabel,
                sep=",",
                row.names=FALSE,  #if not set to false, 
                #r will add a column of consecutive numbers, which we did manually
                append=TRUE)
  }  # close the for loop
}  # close the function 
FileBuilder()


##################################
# lfunction: regStats
# fits linear model, extracts statistics
# input: 2-column data frame (x and y)
# output: slope, p-value, and r2
# ---------------------------------

regStats<- function(d=NULL) {
  if(is.null(d)) {
    xVar<-runif(10)
    yVar<-runif(10)
    d<-data.frame(xVar,yVar)
  }
  #the intermediate dot    
  .<-lm(data=d,d[,2]~d[,1])
  .<-summary(.)
  #keeping a place variable, and then daisy chaining that information
  statsList<-list(Slope=.$coefficients[2,1],
                  pVal=.$coefficients[2,4],
                  r2=.$r.squared)
  return(statsList)
  

}  #close regStats
regStats()

#create 100 random data sets
FileBuilder(fileN=nFiles)


#--------------------------
#--------------------------
fileNames <- list.files(path=fileFolder)

#create data frame to hold file summary 
ID <- seq_along(fileNames)
fileName <- fileNames
slope <- rep(NA,nFiles)
pval <- rep(NA,nFiles)
r2 <- rep(NA,nFiles)

statsOut <- data.frame(ID,fileName,slope,pval,r2)

#batch process by looping through individual files
for (i in seq_along(fileNames))  {
  data <- read.table(file=paste(fileFolder,fileNames[i],sep=""),
                                sep=",",
                                header=T)  # read in next data file 
  
  
  
  dClean <- data[complete.cases(data),]  #get clean cases
  
  .<- regStats(dClean)  # pull regression stats from clean file
  statsOut[i,3:5] <- unlist(.)  #unlist, copy into last 3 columns
  
  }

#set up output file and incorporate time stamp and minimal metadata

    write.table(cat("# Summary stats for ",
                    "batch processing of regression models","\n",
                    "# timestamp: ",as.character(Sys.time()),"\n",
                    "# LPB","\n",
                    "# -------------------------", "\n",
                    "\n",
                    file=fileOut,
                    row.names="",
                    col.names="",
                    sep=""))
    
    #and finally, the data frame
    write.table(x=statsOut,
                file=fileOut,
                row.names=FALSE,
                col.names=TRUE,
                sep=",",
                append=T)


#Break the program
    FileBuilder(fileNA = 25)
                  

