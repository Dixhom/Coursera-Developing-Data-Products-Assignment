---
title       : Survival rate in Titanic
subtitle    : Coursera "Developing Data Product" Assignment
author      : Sho Kubori
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Introduction

![height](./assets/img/titanic.jpg)

- Titanic is perhaps the most famous ship in the world for its tragic accident. 
- One can easily imagene the priority of saving lives of children and women was higher than that of adults and men. But is that really true?
- To verify that, survival rate of each group was visualized to check the effect of parameters such as their gender, the class of their rooms and age.

---

## How the app looks

![height](./assets/img/app.png)

- Side panel
 + Brief documentation
 + Choose variables for x and y axis here.
- Main panel
 + Visualized survival rate (or number of survivers or casualties) is shown here.

--- .class #id 

## Titanic raw data


```r
str(Titanic)
```

```
##  table [1:4, 1:2, 1:2, 1:2] 0 0 35 0 0 0 17 0 118 154 ...
##  - attr(*, "dimnames")=List of 4
##   ..$ Class   : chr [1:4] "1st" "2nd" "3rd" "Crew"
##   ..$ Sex     : chr [1:2] "Male" "Female"
##   ..$ Age     : chr [1:2] "Child" "Adult"
##   ..$ Survived: chr [1:2] "No" "Yes"
```

--- .class #id 

## Pre-processing data

Data (4-dimensional array) was "molten" for creating graph.


```r
library(reshape2)
t <- melt(Titanic)
t <- dcast(t, Class + Sex + Age ~ Survived)
t <- transform(t, total = No + Yes) 
t <- transform(t, rate = Yes / total)
head(t)
```

```
##   Class    Sex   Age  No Yes total       rate
## 1   1st   Male Child   0   5     5 1.00000000
## 2   1st   Male Adult 118  57   175 0.32571429
## 3   1st Female Child   0   1     1 1.00000000
## 4   1st Female Adult   4 140   144 0.97222222
## 5   2nd   Male Child   0  11    11 1.00000000
## 6   2nd   Male Adult 154  14   168 0.08333333
```




