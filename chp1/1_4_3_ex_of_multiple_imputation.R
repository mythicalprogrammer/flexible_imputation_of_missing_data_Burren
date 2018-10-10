# imputed version
imp <- mice(airquality, seed = 1, print = FALSE)
fit <- with(imp, lm(Ozone ~ Wind + Temp + Solar.R))
tab <- round(summary(pool(fit)), 3)
tab[, c(1:3, 5)]

# deleted missingness version
fit <- lm(Ozone ~ Wind + Temp + Solar.R, data = airquality, na.action = na.omit)
round(coef(summary(fit)), 3)
