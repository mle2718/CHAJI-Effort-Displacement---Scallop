# Before you can run the scallop Analysis code, some data processing must be done.  The scallop analysis code takes in cable routes, the "final_product_lease.Rds", and some shapefiles of closure areas.
# This is a small R script run all of those things.

library("here")
library("rmarkdown")

here::i_am("data_wrangle/data_processing_steps.R")

#To render the data_extracting.Rmd
rmarkdown::render(here("data_wrangle","data_extracting.rmd"),
                  output_file = here("data_wrangle","data_extracting.pdf"))

#To render the data_processing.Rmd
rmarkdown::render(here("data_wrangle","data_processing.Rmd"),
                  output_file = here("data_wrangle","data_processing.pdf"))

# To render the combine_cable_routes.Rmd
rmarkdown::render(here("data_wrangle","combine_cable_routes.Rmd"),
                  output_file = here("data_wrangle","combine_cable_routes.html"))


  
