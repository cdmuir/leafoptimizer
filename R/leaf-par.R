#' S3 class leaf_par
#' @exportClass leaf_par
#

#' @param .x A list to be constructed into \strong{leaf_par}.
#' 
#' @description 
#' 
#' Constructor function for leaf_par class. This function ensures that leaf parameter inputs are properly formatted.
#' 
#' @export

leaf_par <- function(.x) {
  
  checkmate::assert_list(.x)
  
  which <- "leaf"
  nms <- parameter_names(which)
  
  if (!all(nms %in% names(.x))) {
    nms[!(nms %in% names(.x))] %>%
      stringr::str_c(collapse = ", ") %>%
      glue::glue("{x} not in parameter names required for {which}_par",
                 x = ., which = which) %>%
      stop()
  }
  
  repeated_tab <- plyr::count(names(.x)) %>%
    dplyr::filter(.data$freq > 1)
  if (nrow(repeated_tab) > 0) {
    repeated_tab$x %>%
      as.character() %>%
      stringr::str_c(collapse = ", ") %>%
      glue::glue("{x} ha{suffix} more than one entry. Only one named entry is allowed per parameter.", x = ., suffix = dplyr::if_else(stringr::str_detect(., ", "), "ve", "s")) %>%
      stop()
  }
  
  .x %<>% magrittr::extract(nms)
  
  structure(.x, class = c(stringr::str_c(which, "_par"), "list"))
  
}

