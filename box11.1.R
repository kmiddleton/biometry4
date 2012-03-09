## box11.1
## Data from Powick (1925)

options(contrasts = c("contr.helmert", "contr.poly"))

Lard <- read.csv("box11.1.csv")
str(Lard)

## Summarize
library(plyr)
ddply(Lard, .(Sex, Lard), 
      function(x) c(mean = round(mean(x$Consumption), 2),
                    sd = round(sd(x$Consumption), 2),
                    n = length(x$Consumption)))

fm <- lm(Consumption ~ Sex * Lard, data = Lard)
anova(fm)
