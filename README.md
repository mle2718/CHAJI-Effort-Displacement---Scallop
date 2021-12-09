# Purpose
This repository contains code to extract and processes data. Our goal is to construct a dataset that can be used to estimate a location choice model scallops to understand the effect of wind energy areas on this fleet. We are using data from 2007-2019 (calendar years).  The main datasource is a frozen DMIS table.

# Testing and Functionality

This code has primarily been developed by Marina Chaji and runs on the neptune server at NEFSC. 

# Getting started

You will probably want to clone the repository to a place on the NEFSC network. That is a bit of a pain, but look [here](https://github.com/NEFSC/READ-SSB-LEE-On-the-servers). 

# Dependencies

This code depends on:
1.  The ability to connect to NEFSC oracle databases (VTR and the Live DMIS tables at APSD.t_ssb_trip_current@garfo_nefsc).  We are using RODBC.  R may need to be aware of where your ORACLE_HOME is  -- take a look [here](https://github.com/NEFSC/READ-SSB-LEE-On-the-servers).  
2.  The ability to get files from the frozen APSD_DMIS_2 and trip_cost.xlsx files from the network

# Project Roles and Responsibilities

The roles/responsibilties doesn't quite belong in this spot, and yet here we are.

## NEFSC 

* Marina - Day-to-day work on assembling data, estimating choice models (the hard and fun stuff)
* Greg - Data advice
* Tammy - Big picture modeling advice
* Min-Yang - R and stata troubleshooting.  Half-baked modeling advice. Scallop fishery context. Replicability, generalizability, and documentation (new).
* Eric - Big picture wind and other fishery applications

## NWFSC

* Lisa - actual modeling advice

## AKFSC  

* Alan- Big picture fishery applications.
* Bryce - Day to day FishSET
* Melanie -  Day to day FishSET 


# Disclaimer
This repository is a scientific product and is not official communication of the National Oceanic and Atmospheric Administration, or the United States Department of Commerce. All NOAA GitHub project code is provided on an ‘as is’ basis and the user assumes responsibility for its use. Any claims against the Department of Commerce or Department of Commerce bureaus stemming from the use of this GitHub project will be governed by all applicable Federal law. Any reference to specific commercial products, processes, or services by service mark, trademark, manufacturer, or otherwise, does not constitute or imply their endorsement, recommendation or favoring by the Department of Commerce. The Department of Commerce seal and logo, or the seal and logo of a DOC bureau, shall not be used in any manner to imply endorsement of any commercial product or activity by DOC or the United States Government.
