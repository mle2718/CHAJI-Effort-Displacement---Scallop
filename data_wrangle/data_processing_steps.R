# Before you can run the scallop Analysis code, some data processing must be done.  The scallop analysis code takes in cable routes, the "final_product_lease.Rds", and some shapefiles of closure areas.
# This is a small R script run all of those things.

library("here")
library("rmarkdown")

here::i_am("data_wrangle/data_processing_steps.R")
net<-network_location_remote
vintage_string<-Sys.Date()
vintage_string<-gsub("-","_",vintage_string)

#To render the data_extracting.Rmd
# rmarkdown::render(here("data_wrangle","data_extracting.rmd"),params = list(
#   DMIS_STYLE = "copyover"
#       ),
#       output_file = here("data_wrangle","data_extracting.pdf"))
# 
# #To render the data_processing.Rmd
# rmarkdown::render(here("data_wrangle","data_processing.Rmd"),
#                   output_file = here("data_wrangle","data_processing.pdf"))


#Pick over the most recent final_product_lease
ml.data.main<-file.path(net,"home2","mlee","Effort-Displacement---Scallop","data","main")

  mlee_data_vintage<-list.files(path=ml.data.main, pattern="final_product_lease_")
  mlee_data_vintage<-gsub("final_product_lease_","",mlee_data_vintage )
  mlee_data_vintage<-gsub(".Rds","",mlee_data_vintage)
  mlee_data_vintage<-gsub(".csv","",mlee_data_vintage)
  mlee_data_vintage<-max(mlee_data_vintage)
  
  final_product_lease_static<-file.path(ml.data.main,paste0("final_product_lease_",mlee_data_vintage, ".Rds"))
  
  # Copy it over to the current directory. Note that the vintage string is rewritten here, which is a little sketchy.
  destination<-here("data","main",paste0("final_product_lease_",vintage_string,".Rds"))
  
  file.copy(final_product_lease_static,destination, overwrite=FALSE)

  
  


# To render the combine_cable_routes.Rmd
rmarkdown::render(here("data_wrangle","combine_cable_routes.Rmd"),
                  output_file = here("data_wrangle","combine_cable_routes.html"))


  
