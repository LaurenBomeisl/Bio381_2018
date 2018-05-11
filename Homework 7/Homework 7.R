  library(ggplot2)

  # data set up for analysis of variance -- meat and potatoes: specific to each project!
  nGroup <- 4 # number of treatment groups
  nName <- c("Control", "Mineral N and P", "Mineral N, Organic P", "Organic N, Organic P")
  nSamples<-15
  nSize <- rep(nSamples,nGroup)
  nMean <- c(3.8,4.5,5.1,5.3) # mean response in each group
  nSD <- c(.7,1.5,1.1,0.9) # standard deviation within group
  ID <- 1:(sum(nSize)) #unique ID each row is observation
## the minimal seperation for the greatest difference was 0.7,
  # any smaller the p value revealed insignificant findings

  
  ProYield <- c(rnorm(n=nSize[1],mean=nMean[1],sd=nSD[1]),
                rnorm(n=nSize[2],mean=nMean[2],sd=nSD[2]),
                rnorm(n=nSize[3],mean=nMean[3],sd=nSD[3]),
                rnorm(n=nSize[4],mean=nMean[4],sd=nSD[4]))
#response variable -- invoke random number generator,
# pulling down parameter values that have already been set up
# all response variables must be in one long data string --
# DO NOT CREATE A SEPERATE COLUMN FOR EACH TREATMENT GROUP 
# use long format, such that each row is a seperate dataset
 # ----------
#  dataCreate<-function(mean1=xx,mean2=yy,n1=x,n2=y,sd1=xy,sd2=yx) 
#    {mydf<- data.frame(control=rnorm(mean=mean1, n=n1, sd=sd1), 
#      test=rnorm(mean=mean2, n=n2, sd=sd2))
 #     return(mydf)
#  }
  
 # myDF<-dataCreate(mean1=10)
 # head(myDF)
#  -----------
  length(ProYield) # check and make sure this should be the same as taking the sum of nSize
  TGroup <- rep(nName,nSize)
  table(TGroup)
  print(TGroup)
  
  ANOdata <- data.frame(ID,TGroup,ProYield)
  
  str(ANOdata)
  head(ANOdata)
  
  #basic anova in r
  ANOmodel <- aov(ProYield~TGroup,data=ANOdata)
  print(ANOmodel)
  summary(ANOmodel)
  
  #basic ggplot of ANOVA data
  ANOplot <- ggplot(data=ANOdata,
                    aes(x=TGroup,y=ProYield,fill=TGroup)) +
    geom_boxplot()
  print(ANOplot)
  
  print(ANOmodel)
  summary(ANOmodel)
  ggsave(filename="myBoxPlot.pdf",plot=ANOplot
         ,device="pdf")
  
  print(ANOplot)