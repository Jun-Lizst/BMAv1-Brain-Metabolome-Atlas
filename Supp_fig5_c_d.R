#############################supplementary fig.5 c and d.
{setwd("./figures/supplementary_slice_tube_region_average_analysis/")
  # Import data
  library(dplyr)
  library(readxl)
  meta_aver <- read_excel("./big_brain_region_data/20190725_2nd_6_brain_region_average_data.xlsx")
  meta_count <- data.frame(t(meta_aver), stringsAsFactors = F) 
  colnames(meta_count) = meta_count[1,]                         ###########add colname;
  meta_count1 = as.data.frame(meta_count[-1,])      
  rownames(meta_count1) = wq                 ###########change to formated names;
}

##########################
require(ggpubr)
require(tidyverse)
require(Hmisc)
require(corrplot)
##cor_1 <- round(cor(as.numeric(meta_count1)), 2)
##cor_1
###P value matrix
library("Hmisc")
cor_2 <- rcorr(as.matrix(meta_count1), type="pearson")
cor_2
str(cor_2)
# As you can see "cor_2" is a list so extracting these values is quite simple...

library(PerformanceAnalytics)#load package
#############
meta_count2 <- as.data.frame(lapply(meta_count1,as.numeric))

chart.Correlation(meta_count2, histogram=TRUE, pch=19, method = "pearson")  
###, pch=19   ##############here meta_count1 should be nemeric matrix
#############################error
##############Error in pairs.default(x, gap = 0, lower.panel = panel.smooth, upper.panel = panel.cor,  : 
#############non-numeric argument to 'pairs'
#############> meta_count1[1,1]
##############[1] "0.0081908590000000000"
# p-values
cor_2_P <- cor_2$P
cor_2_r <- cor_2$r
head(round(cor_2_r,2))
# method = "circle"
#corrplot(cor_2_r, method = "circle", rect.col = "black", type = "upper")
# method = "ellipse"
#corrplot(cor_2_r, method = "ellipse", type = "upper")
# method = "pie"
corrplot(cor_2_r, method = "pie", type = "upper")
# method = "color"
#corrplot(cor_2_r, method = "color", type = "upper")

