My Test Presentation
========================================================
author: S. Pribis
date: December 2014

First Slide
========================================================

For more details on authoring R presentations click the
**Help** button on the toolbar.

- Bullet 1
- Bullet 2
- Bullet 3

Slide With Code
========================================================


```r
titanic3 <- read.csv("titanic3.csv")
titanic3 <- titanic3[-1310,]
titanic3$ticket <- as.character(titanic3$ticket)
titanic3$tick <- paste0(titanic3$ticket, "Unique")
for (i in 1:length(titanic3$tick)) {
        titanic3$num[i] <- length(grep(titanic3$tick[i], titanic3$tick))
}
titanic3$fareper <- titanic3$fare/titanic3$num
titanic3 <- titanic3[is.na(titanic3$age)==F,]
titanic3 <- titanic3[is.na(titanic3$fare)==F,]
titanic3 <- titanic3[is.na(titanic3$fare)==0,]
library(caret)
library(randomForest)
titanic3$surv <- as.factor(titanic3$survived)
set.seed(17)
modFit2 <- train(surv ~ sex + age + fareper, method = "rf", data = titanic3)
save(modFit2, file="modFit2.rf")
```

Slide With Plot
========================================================

![plot of chunk unnamed-chunk-2](presentation-figure/unnamed-chunk-2-1.png) 
