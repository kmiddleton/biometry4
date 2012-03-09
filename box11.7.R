## box11.7
## Data from Wurhman and Woker (1953)

Minnow <- read.csv("box11.7.csv")
Minnow$CN <- factor(Minnow$CN)
Minnow$Temp <- factor(Minnow$Temp)
Minnow$O2 <- factor(Minnow$O2)

fm1 <- lm(Time ~ Temp * CN * O2, data = Minnow)
anova(fm1)

## Not sure why you would make O2 random
library(nlme)
fm2 <- lme(Time ~ Temp * CN, random = ~ 1 | O2, data = Minnow)
anova(fm2)
detach(package:nlme)

## With lme4 and pvals.fnc() 
library(lme4)
library(languageR)
fm3 <- lmer(Time ~ Temp * CN + (1 | O2), data = Minnow)
summary(fm3)
mcmc <- pvals.fnc(fm3, nsim = 10000, withMCMC = TRUE)
mcmc$fixed
mcmc$random