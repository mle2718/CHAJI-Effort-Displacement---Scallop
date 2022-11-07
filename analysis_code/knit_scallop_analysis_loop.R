# Small R script to render lots of variations of the scallop_report_322.Rmd. This allows us to pass in different shapefiles or do different aggregations.  

library("here")
library("rmarkdown")

here::i_am("analysis_code/knit_scallop_analysis_loop.R")

#Borrowed heavily from https://bookdown.org/yihui/rmarkdown/params-knit.html

#Define a function that passes parameters into the rmarkdown::render function

render_report = function(AA_DAS_only, subtrip_aggregate, input_shapefile) {
  rmarkdown::render(here("analysis_code","scallop_analysis_0322.Rmd"), params = list(
      AA_DAS_only = AA_DAS_only,
      subtrip_aggregate = subtrip_aggregate,
      input_shapefile=input_shapefile
    ),
    output_file = paste0("scallop_analysis_AA_",AA_DAS_only,"_subtripaggregate_",subtrip_aggregate,"_shapefile_",input_shapefile, ".html")
  )
}
 

# Test out the function without looping
#AA_DAS_only_val<-TRUE
#subtrip_aggregate_val<-TRUE
#input_shapefile_val<-"wind_sf_final.RDS"
#render_report(AA_DAS_only_val,subtrip_aggregate_val, input_shapefile_val)

# input_shapefile_val in c("wind_NY1.RDS", "wind_NY2.RDS","wind_Central_Atlantic_1.RDS","wind_Central_Atlantic_2.RDS") 
  
# 
# 
# 
for (AA_DAS_only_val in c(TRUE, FALSE) ) {
  for (subtrip_aggregate_val in c(TRUE, FALSE) ) {
    for (input_shapefile_val in c("wind_sf_final.RDS", "wind_sf_nocable.RDS") ) {
      render_report(AA_DAS_only_val,subtrip_aggregate_val, input_shapefile_val)
    }
  }
}






  