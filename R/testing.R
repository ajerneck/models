library(models)
data(mtcars)

fs <- named_list(list(
    mpg ~ cyl
    , mpg ~ cyl + disp
))

a <- lapply(fs, run.lm, data=mtcars)
b <- lapply(fs, run, func=lm, data=mtcars)

lapply(names(a), function(i) a[i] == b[i])
