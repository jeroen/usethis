#' Use Spell Check
#'
#' Adds a unit test which automatically runs a spell check on documentation and/or
#' vignettes using the [spelling][spelling::spell_check_package] package.
#'
#' @param vignettes also check all `rmd` and `rnw` files in the pkg vignettes folder
#' @param lang preferred spelling langage. Usually either `"en-US"` or `"en-GB"`
#' @param error should `CMD check` fail if spelling errors are found? Default only
#' prints results
#' @export
use_spell_check <- function(vignettes = TRUE, lang = "en-US", error = FALSE) {
  check_installed("spelling")
  use_dependency("spelling", "Suggests")
  use_description_field("Language", lang)
  spelling::spell_check_setup(vignettes = vignettes, lang = lang, error = error)
  todo("Run devtools::check() to test")
}
