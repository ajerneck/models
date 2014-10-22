## ##' Run a generalized linear model on the formula.
## ##'
## ##' This wrapper function is required to get correct model objects
## ##' when using lapply.
## ##' @export
## ##' @param formula a formula object specifying the model.
## ##' @param ... additional arguments passed on to glm.
## run.glm <- function(formula, ...) {
##     z <- formula
##     eval(substitute(glm(formula=z, ...)))
## }
## ##' Run a linear model on the formula.
## ##'
## ##' This wrapper function is required to get correct model objects
## ##' when using lapply.
## ##' @title run.lm
## ##' @param formula a formula object specifying the model.
## ##' @param ... additional arguments passed on to the lm.
## ##' @return a model object
## ##' @author Alexander Jerneck
## ##' @export
## run.lm <- function(formula, ...) {
##     z <- formula
##     eval(substitute(lm(formula=z, ...)))
## }
## ##' Run a negative binomial model on the formula.
## ##'
## ##' This wrapper function is required to get correct model objects
## ##' when using lapply.
## ##' @title run.nb
## ##' @param formula a formula object specifying the model.
## ##' @param ... additional arguments passed on to the nb.
## ##' @return a model object
## ##' @author Alexander Jerneck
## ##' @export
## run.nb <- function(formula, ...) {
##     z <- formula
##     eval(substitute(glm.nb(formula=z, ...)))
## }

##' Run models while preserving proper model objects.
##'
##' Runs the model using func on the specification in formula. Returns
##' a model object that should be exactly like as if it was run in the
##' top environment.
##' @title
##' @param formula a formula object.
##' @param func a function that takes a formula object.
##' @param ...
##' @return the results of running func on formula.
##' @author Alexader Jerneck
run <- function(formula, func, ...) {
    z <- formula
    eval(substitute(func(formula=z, ...)))
}


##' Return a list with list indices as names.
##'
##' Useful for creating lists that are inputs to l_ply family of
##' functions, because they save the names in the .id column.
##' @title named_list
##' @param l a list.
##' @return a list, with indices as names.
##' @author Alexander Jerneck
##' @export
named_list <- function(l) {
    names(l) <- 1:length(l)
    l
}
