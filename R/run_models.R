##' Run models while preserving proper model objects.
##'
##' Runs the model using func on the specification in formula. Returns
##' a model object that should be exactly like as if it was run in the
##' top environment.
##' @title run
##' @param formula a formula object.
##' @param func a function that takes a formula object.
##' @param ... the result of applying func to formula.
##' @return the results of running func on formula.
##' @author Alexader Jerneck
##' @export
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
