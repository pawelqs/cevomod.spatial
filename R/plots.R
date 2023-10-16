
plot_space <- function(cd, ...) {
  get_metadata(cd) |>
    ggplot(aes(column, row)) +
    geom_tile(...) +
    ggforce::facet_row(vars(patient_id), scales = "free", space = "free") +
    labs(
      x = "", y = ""
    )
}


plot_empty_space <- function(cd, ...) {
  plot_space(cd, fill = "gray90")
}
