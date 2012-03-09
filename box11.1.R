## box11.1
## Data from Powick (1925)
library(car)

Lard <- read.csv("box11.1.csv")
str(Lard)

fm <- lm(Consumption ~ Sex * Lard, data = Lard)
anova(fm)
Anova(fm, type = "III")
