#' Services for MOSAIC Calculus book
#' 


#' Provides links to MOSAIC Calculus links
#' @param chap Chapter number
#' @param label (optional) name of a section or other cross-reference
#' @export
mosaic_calc_link <- function(chap, label) {
  if (missing(chap)) stop("Must provide the chapter number as an argument")
  if (chap <= 0 || chap > nrow(.mosaic_calc_chapters_))
    stop(glue::glue("<chap> must be between 1 and {nrow(.mosaic_calc_chapters_}. See file <cross_references.R> in the UATX.notes.package package."))
  baselink <- paste0(.mosaic_calc_site_, .mosaic_calc_chapters_[chap, "link"])
  
  if (missing(label)) return(baselink)
  
  middle <- if (grepl("^#", label)) "" else "#"
  
  paste0(baselink, middle, label)
}

.mosaic_calc_site_ <- "https://www.mosaic-web.org/MOSAIC-Calculus/"

.mosaic_calc_chapters_ <- tibble::tribble(
~ id, ~ link,
1,  "Preliminaries/01-quant-fun-space.html",
2,  "Preliminaries/02-notation.html", 
3,  "Preliminaries/03-computing.html",
4,  "Preliminaries/04-graphs-and-graphics.html",
5,  "Preliminaries/05-pattern-book-functions.html",
6,  "Preliminaries/06-describing-functions.html",
7,  "Preliminaries/07-data-and-data-graphics.html",
8,  "Modeling/01-parameters.html",
9,  "Modeling/02-assembling-functions.html",
10, "Modeling/03-functions_with_multiple_inputs.html",
11, "Modeling/04-fitting-by-eye.html",
12, "Modeling/05-low-order-polynomials.html",
13, "Modeling/06-operations.html",
14, "Modeling/08-dimensions.html",
15, "Modeling/09-modeling-cycle.html",
16, "Differentiation/16-continuous-change.html", 
17, "Differentiation/17-rate-of-change.html", 
18, "Differentiation/18-evanescent-h.html", 
19, "Differentiation/19-computing.html", 
20, "Differentiation/20-concavity.html", 
21, "Differentiation/21-cont-and-smooth.html", 
22, "Differentiation/22-rules.html", 
23, "Differentiation/23-optim.html", 
24, "Differentiation/24-partial.html", 
25, "Differentiation/25-approximation.html", 
26, "Differentiation/26-taylor.html", 
)
