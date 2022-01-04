install.packages("WDI")
install.packages('stevemisc')
install.packages('kableExtra')

library(tidyverse)  # for most things
library(stevemisc)  # for my own vanity
library(WDI)        # for World Bank goodness
library(kableExtra) # for tables, where appropriate

WDI(
  country = "BR", 
  indicator = "NY.GDP.PCAP.KD",
  start = 2001,
  end = 2020,
  extra = FALSE,
  cache = NULL,
  latest = NULL,
  language = "en"
)