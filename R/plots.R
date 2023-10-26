
#' Space plots
#' @param object cevodata object
#' @param fill fill
#' @param ... other parameters passed to geom_tile()
#' @name plot_space


#' @rdname plot_space
#' @export
plot_space <- function(object, mapping = aes(), ...) {
  get_metadata(object) |>
    filter(!is.na(.data$column), !is.na(.data$row)) |>
    ggplot(aes(.data$column, .data$row)) +
    geom_tile(mapping, ...) +
    ggforce::facet_row(vars(.data$patient_id), scales = "free", space = "free") +
    labs(
      x = "", y = ""
    )
}


#' @rdname plot_space
#' @export
plot_empty_space <- function(object, fill = "gray90", ...) {
  plot_space(object, fill = "gray90", ...)
}


#' @rdname plot_space
#' @export
layer_mutation_spread <- function(object, snvs, ...) {
  # SNVs(object)
  list(
    # aes(size = 0.1),
    ggalt::geom_encircle(
      aes(color = gene_symbol, group = mutation_id),
      data = SNVs(object) |>
        left_join(get_metadata(object), by = "sample_id") |>
        semi_join(snvs),
      width = 3
      # fill = "black",
      # alpha = 0.05
    )
  )
}


xxx <- function() {
  snvs <- SNVs(object)
  plot_space(object, alpha = 0.5) +
    aes(fill = sample_classification) +
    layer_mutation_spread(object, snvs)
}

# shapes <- set_names(
#   rep(c(15, 16, 17, 18), 2) |> c(19),
#   spread_mutations$gene_symbol |> unique()
# )

  # geom_jitter(
  #   aes(size = VAF),
  #   data = driver_mutations |>
  #     group_by(mutation_id) |>
  #     filter(n() == 1),
  #   color = "black"
  # ) +
  # geom_jitter(
  #   aes(size = VAF, color = gene_symbol, shape = gene_symbol),
  #   data = driver_mutations |>
  #     group_by(mutation_id) |>
  #     filter(n() > 1)
  # ) +
  # scale_y_reverse(breaks = 1:20) +
  # scale_size_area() +
  # guides(
  #   fill = guide_legend(title.position = "top"),
  #   size = guide_legend(title.position = "top"),
  #   color = guide_legend(title.position = "top")
  # )
