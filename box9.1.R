## box9.1
## Data from P. A. Thomas (unpublished)

Ticks <- read.csv("box9.1.csv")
Ticks$Host <- factor(Ticks$Host)

## Summarize
library(plyr)
ddply(Ticks, .(Host), 
      function(x) c(mean = round(mean(x$Width), 2),
                    sd = round(sd(x$Width), 2),
                    n = length(x$Width)))

## With Error()
fm1 <- aov(Width ~ Error(Host), data = Ticks)
summary(fm1)

## Contrast with no repeated measures (random effect)
fm2 <- lm(Width ~ Host, data = Ticks)
anova(fm2)

## With lme4
library(lme4)
library(languageR)
fm3 <- lmer(Width ~ (1 | Host), data = Ticks)
summary(fm3)
mcmc <- pvals.fnc(fm3, nsim = 10000, withMCMC = TRUE)
mcmc$fixed
