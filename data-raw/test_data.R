
sample_data <- openxlsx::read.xlsx("data-raw/test_data.xlsx") |>
  as_tibble() |>
  rename(row = X1) |>
  pivot_longer(B:E, names_to = "column", values_to = "sample_classification") |>
  filter(!is.na(sample_classification)) |>
  mutate(
    patient_id = "patient_1",
    coordinates = str_c(column, row),
    sample_id = str_c(patient_id, row),
    sample_classification = parse_factor(sample_classification, levels = c("NU", "LGIN", "HGIN", "UC"))
  ) |>
  select(patient_id, sample_id, coordinates, row, column, sample_classification)

test_data <- init_cevodata("Spatial test data") |>
  add_sample_data(sample_data)

usethis::use_data(test_data, overwrite = TRUE)
