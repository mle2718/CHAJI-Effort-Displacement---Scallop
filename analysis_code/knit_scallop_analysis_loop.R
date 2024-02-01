# Small R script to render lots of variations of the scallop_report_322.Rmd. This allows us to pass in different shapefiles or do different aggregations.  
# Borrowed heavily from https://bookdown.org/yihui/rmarkdown/params-knit.html

library("here")
library("rmarkdown")

here::i_am("analysis_code/knit_scallop_analysis_loop.R")

# Define the "things" you want to loop over.
AADAS_Vals_to_loop<-c(TRUE) # TRUE is the AADAS fleet. FALSE is the IFQ fleet
subtrip_aggregate_vals_to_loop<-c(TRUE) # TRUE aggregates subtrips to trips. FALSE does not
input_shapefile_vals_to_loop<-c("wind_sf_final.RDS", "wind_sf_nocable.RDS") # Different "closure areas". 


# You shouldn't need to edit anything below this.




##################################################################################
# The combine_cable_routes.Rmd must be rendered to process the cable route and finagle the shapefiles into a format required by FishSET
rmarkdown::render(here("data_wrangle","combine_cable_routes.Rmd"),
                  output_file = here("data_wrangle","combine_cable_routes.html"))
##################################################################################


# To just render the scallop_analysis_0322.Rmd with whatever parameters are in the markdown, do this:
# rmarkdown::render(here("analysis_code","scallop_analysis_0322.Rmd"),
#                   output_file = here("results","scallop_analysis_0322.html"))


##################################################################################
#Define a function that passes parameters into the rmarkdown::render function
render_report = function(AA_DAS_only, subtrip_aggregate, input_shapefile) {
  rmarkdown::render(here("analysis_code","scallop_analysis_0322.Rmd"), params = list(
      AA_DAS_only = AA_DAS_only,
      subtrip_aggregate = subtrip_aggregate,
      input_shapefile=input_shapefile
    ),
    output_file = here("results",paste0("scallop_analysis_AA_",AA_DAS_only,"_subtripaggregate_",subtrip_aggregate,"_shapefile_", gsub(".RDS", "",input_shapefile ), ".html")
  ))
}
################################################################################## 

# Run lots of scallop analysis reports.
for (AA_DAS_only_val in AADAS_Vals_to_loop ) {
  for (subtrip_aggregate_val in subtrip_aggregate_vals_to_loop ) {
    for (input_shapefile_val in input_shapefile_vals_to_loop)  {
      render_report(AA_DAS_only_val,subtrip_aggregate_val, input_shapefile_val)
    }
  }
}



  
