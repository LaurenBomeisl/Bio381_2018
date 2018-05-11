#################
# Create function to map to working directory for HW 7
# Create fake dataset of normal distribution arrays to be used for ANOVA comparison
# 15 April 2018
# LPB


#prelims
  library(ggplot2)
  

#global

nGroup<- 4
nSample<-15
nName <- c("Control", "MinNMinP", "MinNOrgP","OrgNOrgP")


  ProYield<-function( nMean=c(3.8,4.5,5.1,5.3),
                        nSD=c(.7,1.5,1.1,0.9) ){
    nSize<-rep(nSample,nGroup)
    TGroup<-rep(nName,nSize)
    ID <- 1:(sum(nSize))
    
    
  #define string of values to be inserted into dataframe
  ANOstring <- c(rnorm(n=nSize[1],mean=nMean[1],sd=nSD[1]),
                 rnorm(n=nSize[2],mean=nMean[2],sd=nSD[2]),
                 rnorm(n=nSize[3],mean=nMean[3],sd=nSD[3]),
                 rnorm(n=nSize[4],mean=nMean[4],sd=nSD[4]))

  #create data frame for anova test-- a column for row ID, x val, and y val
  ANOdata<-data.frame(ID,TGroup,ANOstring)
  
  #perform simple anova with numeric values defined with respect to groups
  ANOmodel <- aov(ANOstring~TGroup,data=ANOdata)
  
  #box plot results
  ANOplot <- ggplot(data=ANOdata,
                    aes(x=TGroup,y=ANOstring,fill=TGroup)) +
    geom_boxplot()
  print(ANOplot)
  
  
  #examine statistical summary
  summary(ANOmodel)
  
  }
  
  
  
  ProYield()

