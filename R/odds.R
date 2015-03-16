## Calculating the odds ratios
## using:
## http://www.ats.ucla.edu/stat/mult_pkg/faq/general/odds_ratio.htm

## just exponentiate the coefficients,
## multiply by 100 and subtract 100 to get the percentage change in
## odds for a one unit increase in that variable holding the others at
## a constant value.

orr <- function(x, predictor) {
    round(exp(x) * 100 - 100)[predictor]
}
odds_ratio <- function(model, predictor) {
    orr(coef(model), predictor)
}
odds_ratio_sd <- function(model, predictor, x) {
    orr(coef(model) * sd(x, na.rm=TRUE), predictor)
}


##' Calculate and show odds ratios.
##'
##' Takes a list of lists, where each inner item should indicate a
##' model and a predictor. Returns a dataframe with the predictor
##' name, coefficient, and odds ratios for a one unit and standard
##' deviation increase.
##' @title show_odds
##' @param variables a list of lists, with models and predictor names.
##' @param model.list a list of models from which the coefficients
##' should be taken.
##' @param dataset a dataset from which the standard deviation of the
##' predictor will be calculated.
##' @return a dataframe.
##' @author Alexander Jerneck
##' @export
##' @examples
##' vm <- list(
##'    list(model=10, predictor='share.business.nalocf')
##'   , list(model=11, predictor='share.business.nalocf')
##' )
##
show_odds <- function(variables, model.list, dataset) {
    ldply(variables, function(x) {
    data.frame(
          variable = x$predictor
        , coefficient = coef(model.list[[x$model]])[x$predictor]
        , odds.ratio = odds_ratio(model.list[[x$model]], x$predictor)
        , odds.ratio.std = odds_ratio_sd(model.list[[x$model]], x$predictor, dataset[[x$predictor]])
        )
})
}
