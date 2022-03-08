################################################################################
#
# Project build script
#
################################################################################

# Load packages (in packages.R) and load project-specific functions in R folder
suppressPackageStartupMessages(source("packages.R"))
for (f in list.files(here::here("R"), full.names = TRUE)) source (f)


# Set build options ------------------------------------------------------------



# Groups of targets ------------------------------------------------------------

## Form/questionnaire development
xlsform_test_setup <- tar_plan(
  ## Download endline xlsform from googledrive
  tar_target(
    name = xlsform_file,
    command = download_googledrive(
      filename = "sofala_s3m",
      path = "forms/sofala_s3m.xlsx",
      overwrite = TRUE
    ) |>
      (\(x) x[["local_path"]])(),
    format = "file"
  ),
  ona_project_id = okapi::ona_project_list() |>
    subset(name == "Sofala S3M") |>
    (\(x) x[["projectid"]])(),
  ona_form_published = okapi::ona_form_publish(
    xls_file = xlsform_file,
    project_id = ona_project_id,
    public = TRUE
  )
)

## Read associated text and code information
codebook <- tar_plan(
  ##
)


## Outputs
outputs <- tar_plan(
  ##
)

## Deploy targets
deploy <- tar_plan(
  ##
)

## Set seed
set.seed(1977)

# Concatenate targets ----------------------------------------------------------
list(
  xlsform_setup,
  codebook,
  outputs,
  deploy
)