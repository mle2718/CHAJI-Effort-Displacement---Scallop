# Purpose
This repository is intended to estimate a location choice model scallops to understand the effect of wind energy areas on this fleet.  Currently, we have [code to extract and processes data](data_extraction_and_processing_code.Rmd). This code constructs aggregates NEFSC data into a dataset that can be imported to FishSET for data exploration and estimation.

We are using data from 2007-2019 (calendar years).  The main datasource is a frozen DMIS table.  

We have documentation about the research question, motivation, and fishery context [here](effort_displacement_overview.Rmd).

Perhaps one day, in the not too distant future, this repository will contain code to estimate the choice model also.

While the empirical setting that we have chosen is the Limited Access Scallop fishery, we envision this serving as a pilot project that enhances our ability to estimate discrete choice models and conduct spatial analyses for other fisheries.
# Testing and Functionality

The data extraction code has primarily been developed by Marina Chaji and runs on the neptune server at NEFSC. 
*   R version 4.0.5 (2021-03-31) -- "Shake and Throw"
*   Rstudio server Version 1.4.1103

# Getting started

1.  Clone the repository onto the neptune server on the NEFSC network.
    1.  If you are already using github on neptune, then this is straightforward.
    1.  If not, you will need to follow the steps here [here](https://github.com/NEFSC/READ-SSB-LEE-On-the-servers) for the steps to create an access token, store it on neptune, and clone a repository.
1.  Rename and edit your local copy of [R_credentials_sample.R](R_credentials_sample.R) to `credentials.R`. Follow the instructions in comments at the top.
1.  Edit your .Rprofile or .Renviron to be aware of *network_location_desktop* and *network_location_remote* variables.
1.  Use Rstudio to knit the [code to extract and processes data](data_extraction_and_processing_code.Rmd) to html.
    
# Dependencies

The data processing code depends on:

1.  The ability to connect to NEFSC oracle databases (VTR and the Live DMIS tables at APSD.t_ssb_trip_current@garfo_nefsc).  We are using RODBC.  R may need to be aware of where your ORACLE_HOME is  -- take a look [here](https://github.com/NEFSC/READ-SSB-LEE-On-the-servers).  
2.  The ability to get files from the frozen `APSD_DMIS_2.rda`, `trip_cost.xlsx`, and `just_ports_YYYY_MM_DD.dta` files from the network.

# Project Roles and Responsibilities

The roles/responsibilties doesn't quite belong in this spot, and yet here we are.

## NEFSC 

* Marina - Day-to-day work on assembling data
* Greg - Data advice
* Tammy - Big picture modeling advice.
* Min-Yang - R and stata troubleshooting.  Half-baked modeling advice. Scallop fishery context. Replicability, generalizability, and documentation (new).
* Eric - Big picture wind and other fishery applications

## NWFSC

* Lisa - actual modeling advice

## AKFSC  

* Alan- Big picture fishery applications.
* Bryce - Day to day FishSET
* Melanie -  Day to day FishSET 


# Outside data sources
We have added various shapefiles to the repository. The `East_Cst_crop_2020_extended` shapefile was taken from `/net/work5/socialsci/Geret_Rasters/data/offshore_wind_package_data/shapefiles`.

There are also some data that we get internally from the network, this can be figured out just by looking through the data processsing code.


# Code of Conduct

[Our Code of Conduct](code_of_conduct.md)

# Disclaimer
This repository is a scientific product and is not official communication of the National Oceanic and Atmospheric Administration, or the United States Department of Commerce. All NOAA GitHub project code is provided on an ‘as is’ basis and the user assumes responsibility for its use. Any claims against the Department of Commerce or Department of Commerce bureaus stemming from the use of this GitHub project will be governed by all applicable Federal law. Any reference to specific commercial products, processes, or services by service mark, trademark, manufacturer, or otherwise, does not constitute or imply their endorsement, recommendation or favoring by the Department of Commerce. The Department of Commerce seal and logo, or the seal and logo of a DOC bureau, shall not be used in any manner to imply endorsement of any commercial product or activity by DOC or the United States Government.
