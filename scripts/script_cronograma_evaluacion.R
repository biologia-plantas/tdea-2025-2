library("here")
library("tidyverse")
library("googlesheets4")
library("gt")

cronograma_oriente <- 
  googlesheets4::read_sheet(
    "https://docs.google.com/spreadsheets/d/1HbEA1sPWc1Us1aAOGgMMlCMN19GKnS4tmQm0Aio0ZtA",
    sheet = 1
  )

tbl_cronograma_oriente <- 
  cronograma_oriente |> 
  gt::gt() |> 
  gt::sub_missing(
    missing_text = ""
  ) |> 
  gt::cols_label(
    clase = "Clase",
    fecha = "Fecha",
    docente = "Docente",
    tema = "Tema",
    laboratorio = "Laboratorio",
    evaluacion = "Evaluación"
  ) |> 
  gt::fmt_markdown(
    columns = c(tema, laboratorio)
  ) |> 
  gt::opt_table_font(
    font = gt::google_font(name = "Atkinson Hyperlegible")
  ) |> 
  gt::tab_style(
    style = gt::cell_text(weight = "bold"),
    locations = gt::cells_column_labels()
  ) |> 
  gt::tab_footnote(
    footnote = ("El cronograma puede variar dependiendo del desarrollo del curso"),
  ) |> 
  gt::cols_width(
    fecha ~ gt::px(110)
  )

evaluacion_general <- 
  googlesheets4::read_sheet(
    "https://docs.google.com/spreadsheets/d/1HbEA1sPWc1Us1aAOGgMMlCMN19GKnS4tmQm0Aio0ZtA",
    sheet = 2
  )

tbl_evaluacion_general <- 
  evaluacion_general |> 
  gt::gt() |> 
  gt::sub_missing(
    missing_text = ""
  ) |> 
  gt::cols_label(
    criterio = "Criterio",
    temas = "Temas",
    porcentaje = "Porcentaje"
  ) |> 
  gt::fmt_percent(
    columns = porcentaje,
    decimals = 1
  ) |> 
  gt::opt_table_font(
    font = gt::google_font(name = "Atkinson Hyperlegible")
  ) |> 
  gt::tab_style(
    style = gt::cell_text(weight = "bold"),
    locations = gt::cells_column_labels()
  )

evaluacion_laboratorio <- 
  googlesheets4::read_sheet(
    "https://docs.google.com/spreadsheets/d/1HbEA1sPWc1Us1aAOGgMMlCMN19GKnS4tmQm0Aio0ZtA",
    sheet = 3
  )

tbl_evaluacion_laboratorio <- 
  evaluacion_laboratorio |> 
  gt::gt() |> 
  gt::sub_missing(
    missing_text = ""
  ) |> 
  gt::cols_label(
    criterio = "Criterio",
    temas = "Temas",
    porcentaje = "Porcentaje"
  ) |> 
  gt::fmt_percent(
    columns = porcentaje,
    decimals = 1
  ) |> 
  gt::opt_table_font(
    font = gt::google_font(name = "Atkinson Hyperlegible")
  ) |> 
  gt::tab_style(
    style = gt::cell_text(weight = "bold"),
    locations = gt::cells_column_labels()
  ) |> 
  gt::tab_footnote(
    footnote = ("Estos porcentajes corresponden al 25.0% del laboratorio"),
  )
