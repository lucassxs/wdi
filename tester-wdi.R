install.packages("WDI")
install.packages('stevemisc')
install.packages('kableExtra')

library(tidyverse)  # for most things
library(stevemisc)  # for my own vanity
library(WDI)        # for World Bank goodness
library(kableExtra) # for tables, where appropriate

WDI(
  country = "BR", # vector of countries
  indicator = "NY.GDP.PCAP.KD", # character vector of indicators code
  start = 2001, # start date, usually a year in integer format
  end = 2020, # end date, usually a year in integer format
  extra = FALSE, # TRUE returns extra variables such as region, iso3c code, and incomeLevel.
  cache = NULL, # NULL (optional) a list created by WDIcache() to be used with the extra=TRUE argument
  latest = NULL, # Integer indicating the number of most recent non-NA values to get. Default is NULL. If specified, it overrides the start and end dates
  language = "en" # ISO-2 code in lower case indicating in which language the characters should be provided. List of languages available with ‘WDI::languages_supported()‘. Default is English.
)