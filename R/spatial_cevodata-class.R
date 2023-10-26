
#' Spatial cevodata object
#' @param object cevodata object
#' @export
as_spatial_cevodata <- function(object, ...) {
  structure(object, class = c("spatial_cevodata", class(object)))
}


#' Validate spatial cevodata
#' @param object cevodata object
#' @export
validate_spatial_cevodata <- function(object) {
  meta <- object |>
    get_metadata() |>
    names()
  required_columns <- c("row", "column")
  all(required_columns %in% meta)
}
