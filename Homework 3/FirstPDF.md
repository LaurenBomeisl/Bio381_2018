---
title: "FirstHtml"
author: "LaurenBomeisl"
date: "1/25/2018"
output: 
  html_document: 
    highlight: zenburn
    keep_md: yes
    theme: cerulean
  pdf_document: 
    keep_tex: yes
---



## R Markdown

## More LaTex tricks

$$\sum_{i=1}^S{n_i}=N$$

### Sentence text

$$p(\mbox{Occurrence of species X})=0.67$$

###Escaping the backslash

$$\backslash a \le b \backslash$$

Rendering code of \LaTex


```r
library(ggplot2)
waterTemp <- runif(50)
planktonAbun <- runif(50)
qplot(x=waterTemp, y=planktonAbun)
```

![](FirstPDF_files/figure-html/unnamed-chunk-1-1.png)<!-- -->

```r
# print(waterTemp)
# head(waterTemp)
# tail(waterTemp)
```

Now we can add text here, say anything we wat, etc. because we are no longer in R but back in the world of 'markdown'. 



```r
qplot(x=waterTemp)
```

```
## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
```

![](FirstPDF_files/figure-html/unnamed-chunk-2-1.png)<!-- -->
