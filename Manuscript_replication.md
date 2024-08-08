# Manuscript Replication
This document describes how to replicate the analysis contained in manuscript submitted to *Fisheries Oceanography*, originally titled "Assessing Impacts of Offshore Wind Development: An Analysis of the Minimization of Economic Exposure of the Scallop Fishery through the Regulatory Process"

## Prologue
You will need R and a bunch of packages, including [FishSET](https://github.com/noaa-nwfsc/FishSET/) to replicate the code.  If you also want to pull data, you will need appropriate access and a properly configured set of credentials.  Since some of the data is "live", you may get slightly different results. 

If you want to replicate the paper exactly, please use the frozen data on ``\\nefscdata\Scallop_Effort_Displacement`` 

## Data Wrangling

1. Source the ``/data_wrangle/data_processing_steps.R`` file. This will call a few Rmarkdown files that extract and process data.

## Tables


1. Table 2 contains summary statistics (Totals and Averages) of Trip length, Scallop Revenue, Landed Pounds, Operating Profit, and Revenue Per day disaggregated by metier.  Knit the file ``/analysis_code/scallop_summary_stats.Rmd`` to generate these tables. 

1. Table 3 contains Total trips and average Trip length, Scallop Revenue, Landed Pounds, Operating Profit, and Revenue Per day for trips inside and outside lease areas. These are disaggregated by metier and  t-tests of equality are performed. We present p-values.  Source the file ``/knit_ttest_scallop_analysis_loop.R`` to generate these tables. This calls  ``/analysis_code/scallop_analysis_t_test.Rmd`` and makes one html file for the GCIFQ metier and one html file for the two LA metiers.

1. Tables 4 and 5 contain case studies for the NYB and CA respectively.
    1.  Source the file ``/analysis_code/knit_tiny_scallop_analysis_loop.R`` to construct the casestudy_ datasets.
    2.  knit the file ``/analysis_code/case_study_comparisons.Rmd`` to generate the html containg the infomration in these tables.


