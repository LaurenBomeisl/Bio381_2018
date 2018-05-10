#################
# Create function to map to working directory for HW 7
# Create fake dataset of normal distribution arrays to be used for ANOVA comparison
# 15 April 2018
# LPB



  library(ggplot2)
  

  ProYield<-function(nMean=c(1.5,4.5,5.2,5.4),nSize=15,nSD=c(.01,0.3,0.2,0.2))
  {
  nName <- c("Control", "MinNMinP", "MinNOrgP","OrgNOrgP")
  nSize <- c(rep(nSize,length(nName)))
  TGroup <- rep(nName,nSize)
  
  ANOdata <- data.frame(Control=rnorm(n=nSize[1],mean=nMean[1],sd=nSD[1]),
                        MinNMinP=rnorm(n=nSize[1],mean=nMean[2],sd=nSD[2]),
                        MinNOrgP= rnorm(n=nSize[3],mean=nMean[3],sd=nSD[3]),
                        OrgNOrgP=rnorm(n=nSize[4],mean=nMean[4],sd=nSD[3]))
  ANOmodel <- aov(ProYield~TGroup,data=ANOdata)
  ANOplot <- ggplot(data=ANOdata,
                    aes(x=TGroup,y=ProYield,fill=TGroup)) +
    geom_boxplot()
  print(ANOplot)
  summary(ANOmodel)
  
}
  dataCreate()
