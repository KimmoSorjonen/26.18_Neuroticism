
############################# BIENVENUE #############################

############# I SOLEMNLY SWEAR THAT I AM UP TO NO GOOD ##############

#################################
## Loading packages

library(lavaan)

#################################

n <- 236 ## sample size

rm <- matrix(c( ## correlations reported by Liu & Wu (2026)
  
  1.000, 0.339, 0.552, 0.585,
  0.339, 1.000, 0.320, 0.397,
  0.552, 0.320, 1.000, 0.721,
  0.585, 0.397, 0.721, 1.000), nrow=4)

colnames(rm) <- rownames(rm) <- c("NEU","SVO","DEP","ANX") ## names of variables

#################################
## Alternative model

altmod <- "

## Loadings

CSE =~ -1*NEU+start(-0.5)*DEP+start(-0.5)*ANX+start(-0.5)*SVO

## (Error) variances

NEU ~~ NEU
DEP ~~ DEP
ANX ~~ ANX
SVO ~~ SVO

CSE ~~ CSE

"

fit.alt <- lavaan(altmod, sample.cov=rm, ## fitting model to data 
            sample.nobs=n, meanstructure=F)

summary(fit.alt, fit.measures=T, ci=T, standardized=T, rsq=T) ## the results


########################## MISCHIEF MANAGED #########################

############################# AU REVOIR #############################

