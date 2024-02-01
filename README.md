# Purpose
This repository is intended to estimate a location choice model scallops to understand the effect of wind energy areas on this fleet.  Currently, we have code to [extract data](/data_wrangle/data_extracting.Rmd) and [process data](/data_wrangle/data_processing.Rmd). This code constructs aggregates NEFSC data into a dataset that can be imported to FishSET for data exploration and estimation.  We also have some code to analyse data in the analysis_code folder.

We are using [DMIS](https://github.com/NEFSC/READ-SSB-Lee-metadata/blob/master/DMIS.md) data from 2007-2021 (calendar years).  The main datasource is a frozen DMIS table, you can see the two pieces of sql used to construct that table [here](https://github.com/NEFSC/READ-SSB-Lee-metadata/blob/master/external/MAKE_DMIS_SFCLAM_122121.sql) and [here](https://github.com/NEFSC/READ-SSB-Lee-metadata/blob/master/external/make_sfclam_only_013022.sql).

We have documentation about the research question, motivation, and fishery context [here](effort_displacement_overview.Rmd).

Perhaps one day, in the not too distant future, this repository will contain code to estimate the choice model also.

While the empirical setting that we have chosen is the Limited Access Scallop fishery, we envision this serving as a pilot project that enhances our ability to estimate discrete choice models and conduct spatial analyses for other fisheries.

# A Few Guidelines For Contributing

1.  [Our Code of Conduct](code_of_conduct.md)
2. The *main* branch should always work.  Committing directly to main should *only* be done for writing text or comments.    
3. For all other changes, please create a branch and develop your code there.  Then, issue a [pull request](https://github.com/NEFSC/READ-SSB-CHAJI-Effort-Displacement---Scallop/compare) and please make sure to request review(s) from the appropriate person(s).
4. Once a pull request is approved, the originator should merge and delete the branch if warranted.
5. Please try to keep a relatively clean repository with few branches and even fewer branches that just hang around.  Approximately monthly, we will try to delete stale branches that are not being developed.

# Testing and Functionality

The data extraction code was primarily been developed by Marina Chaji and ran on the neptune server at NEFSC. 
*   R version 4.0.5 (2021-03-31) -- "Shake and Throw"
*   Rstudio server Version 1.4.1103

In preparation for the retirement on the Neptune server, development was moved to individual containers in July 2023. This code will run on the standard NEFSC R container, which is running R 4.3.0 (2023-04-21)
The data analysis code runs properly.  The containers do not support RODBC, so all of the data extraction code has to be switched to ROracle.  Only some of it has been switched over.

# Getting started

1. Get a container set up on the NEFSC network.
1.  Clone the repository onto the your container on the NEFSC network.
    1.  If you are already using github on your container, then this is straightforward.
    1.  If not, you will need to follow the steps here [here](https://github.com/NEFSC/READ-SSB-LEE-On-the-servers) for the steps to create an access token, store it, and clone a repository.
1.  Rename and edit your local copy of [R_credentials_sample.R](/data_wrangle/R_credentials_sample.R) to `credentials.R`. Follow the instructions in comments at the top.
1.  Edit your .Rprofile or .Renviron to be aware of *network_location_desktop* and *network_location_remote* variables.
1.  Use Rstudio to knit the [code to extract and processes data](/data_wrangle/data_extraction_and_processing_code.Rmd) to html.

# Creating and Setting API Key for deflator data

We use the fredr package to import Federal Reserve deflator data which needs a unique FRED API key for each user. Follow the instructions below to unique API key for multiple uses.   

1. In order to obtain your API key you must create an account and submit a description of this application using the [Federal Reserve's website](https://research.stlouisfed.org/useraccount/apikey). 
 *Additional resources on API keys can be found [here](https://fred.stlouisfed.org/docs/api/api_key.html). 
2. After obtaining your API key you will need to open the .Renviron file located in your network drive. Once you have your .Renviron file open, you will then need to save your API using the following format: FRED_API_KEY=abcdefghijklmnopqrstuvwxyz123456



# Dependencies

The data processing code depends on:

1.  The ability to connect to NEFSC oracle databases (VTR and the Live DMIS tables at APSD.t_ssb_trip_current@garfo_nefsc).  We are using RODBC.  R may need to be aware of where your ORACLE_HOME is  -- take a look [here](https://github.com/NEFSC/READ-SSB-LEE-On-the-servers).  
2.  The ability to get files from the frozen `APSD_DMIS_2.rda`, `trip_cost.xlsx`, and `just_ports_YYYY_MM_DD.dta` files from the network.

You may also need to use set R's libPath to home2/mlee/R/x86_64_pc-linux-gnu-library to use a pre-release version of FishSET.


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

## Others  

* Alan (ICES)- Big picture fishery applications.
* Paul - Pacific States Marine Fisheries Commission - FishSET development.

# Outside data sources
We have added various shapefiles to the repository. 
1.  `East_Cst_crop_2020_extended` shapefile was taken from `/net/work5/socialsci/Geret_Rasters/data/offshore_wind_package_data/shapefiles`
2.  `All_Lease_Areas_Shapefile` shapefile was taken from `/net/home4/mchaji/All_Lease_Areas_Shapefile`
3.  `VMS_Demarcation_Line` shapefile was taken from https://www.fisheries.noaa.gov/resource/map/vms-demarcation-line
4.  `Scallop_DAS_Change_to_DOF_Transit_w_Product_On_Board_Area` shapefile was taken from https://www.fisheries.noaa.gov/resource/map/scallop-days-sea-change-declare-out-fishery-transit-product-board-area

There are also some data that we get internally from the network, this can be figured out just by looking through the data processsing code.



# Disclaimer
This repository is a scientific product and is not official communication of the National Oceanic and Atmospheric Administration, or the United States Department of Commerce. All NOAA GitHub project code is provided on an ‘as is’ basis and the user assumes responsibility for its use. Any claims against the Department of Commerce or Department of Commerce bureaus stemming from the use of this GitHub project will be governed by all applicable Federal law. Any reference to specific commercial products, processes, or services by service mark, trademark, manufacturer, or otherwise, does not constitute or imply their endorsement, recommendation or favoring by the Department of Commerce. The Department of Commerce seal and logo, or the seal and logo of a DOC bureau, shall not be used in any manner to imply endorsement of any commercial product or activity by DOC or the United States Government.
