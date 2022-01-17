####################################################
####### Data Preparation
###################################################

## Load directory and packages
library(readxl)
setwd("~/School/Summer 2019/STAA 556")


### Read in data
Project_Data <- read_excel("Project_Data.xlsx", 
                           col_types = c("numeric", "numeric", "numeric", 
                                         "text", "text", "text", "text", "text", 
                                         "text", "text", "text", "date", "numeric", 
                                         "numeric", "numeric", "text", "numeric", 
                                         "numeric", "numeric", "text", "text", 
                                         "text", "text", "text", "text", "text", 
                                         "text", "text", "text", "numeric", 
                                         "text", "text", "text", "text", "text", 
                                         "text", "text", "text", "numeric", 
                                         "numeric", "text", "text", "text", 
                                         "text", "text", "text", "text", "numeric", 
                                         "text", "text", "text", "text", "text", 
                                         "text", "text", "text", "numeric", 
                                         "numeric", "text", "text", "text", 
                                         "text", "text", "text", "text", "text", 
                                         "text", "text", "text", "text", "text", 
                                         "numeric", "text", "numeric", "text", 
                                         "numeric", "text", "text", "numeric", 
                                         "text", "text", "text", "text", "text", 
                                         "text", "text", "text", "text", "text", 
                                         "text", "text", "numeric", "text", 
                                         "text", "text", "text", "text", "numeric", 
                                         "numeric", "numeric", "text", "text", 
                                         "text", "text", "text", "text", "text", 
                                         "text", "text", "numeric", "numeric", 
                                         "text", "text", "text", "text", "text", 
                                         "text", "text", "numeric", "text", 
                                         "text", "text", "text", "text", "text", 
                                         "text", "numeric", "text", "text", 
                                         "text", "text", "text", "text", "text", 
                                         "numeric", "numeric", "text", "text", 
                                         "text", "text", "text", "text", "text", 
                                         "text", "text", "text", "text", "text", 
                                         "text", "numeric", "numeric", "numeric", 
                                         "text", "numeric", "text", "text", 
                                         "numeric", "text", "text", "text", 
                                         "text", "text", "text", "text", "text", 
                                         "text", "text", "text", "text", "numeric"))

## Variables of interest
vars = c('record_id',	'age',	'gender',	'race',	'raceother',	'ethnicity',	'curr_cancer_diag',	'curr_chemo',	'curr_rad',	'curr_surg',	'curr_other',	'gripst_dom',	'gripst_ndom',	'smwt_dist',	'GP7Total',	'GS7TOTAL',	'GE6Total',	'GF7Total',	'FACT-G Total',	'GFAT_TOTAL',	'wr_sl2',	'wr_sl4',	'wr_sl7',	'sleephabits_total',	'gripst_dom_2',	'gripst_ndom_2',	'smwt_dist_2',	'num_ans_gp7_2',	'GP7TOTAL_2',	'GS6TOTAL_2',	'GE6TOTAL_2',	'GF7TOTAL_2',	'FACT_G TOTAL_2',	'GFAT_TOTAL_2',	'wr_sl2_2',	'wr_sl4_2',	'wr_sl7_2',	'sleephabits_total_2')
data_final = Project_Data[vars]

## Remove individuals without data before and after PA intervention
data_final = subset(data_final, !is.na(wr_sl2_2) & !is.na(wr_sl2))
data_final$gender = as.factor(data_final$gender)



####################################################
####### Summary Statistics
###################################################
summary(data_final)
table(data_final$gender, data_final$wr_sl7)


####################################################
####### Aim 1: McNemar's Test 
###################################################
table(Project_Data$wr_sl2, Project_Data$wr_sl2_2)