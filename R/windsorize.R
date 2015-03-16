##' Windsorize a variable.
##'
##' Sets all values above high and below low to high and low, respectively.
##' @title Windsorize a variable.
##' @param x 
##' @param low 
##' @param high
##' @export
##' @return a vector.
##' @author Alexander Jerneck
windsorize <- function(x, low, high) {
    x[x < low] <- low
    x[x > high] <- high
    x
}
