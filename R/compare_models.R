##' Compares two lists of models by iterating over the lists,
##' applying the function f to each pair, and then returning those
##' rows where the the new value is lower than the original
##' specification.
##'
##'
##' @title compare_models_with
##' @param l1 first list of models (called orig)
##' @param l2 second list of models (called new)
##' @param f a function that returns a value on which the two should
##' be compared.
##' @return the pairs for which the return value f is lower for the
##' new than the orig.
##' @author Alexander Jerneck
##' @export
compare_models_with <- function(l1, l2, onFunc) {
    x <- ldply(1:length(l1), function(i) {
        d <- data.frame(orig=onFunc(l1[[i]]), new=onFunc(l2[[i]]))
        d$model <- i
        d
    })
    x[x$new < x$orig,]
}
