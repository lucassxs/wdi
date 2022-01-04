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

WDI(indicator = c("EG.ELC.ACCS.ZS", # access to electricity
                  "BN.CAB.XOKA.GD.ZS", # current account balance
                  "IC.BUS.DFRN.XQ", # ease of doing business
                  "FP.CPI.TOTL.ZG", # CPI
                  "FR.INR.LNDP"), # interest rate spread
    start = 1960, end = 2020) %>% as_tibble() -> Data

Data %>%
  rename(elecperpop = 4,
         cab = 5,
         edb = 6,
         cpi = 7,
         ratespread = 8) -> Data

Data %>%
  filter(country == "Mexico") %>%
  mutate(cpiprop = cpi/100) %>% # going somewhere with this...
  ggplot(.,aes(year, cpiprop)) + 
  theme_steve_web() + post_bg() +
  geom_bar(stat="identity", alpha=.8, fill="#619cff", color="black") +
  scale_x_continuous(breaks = seq(1960, 2020, by = 10)) +
  # Below is why I like proportions
  scale_y_continuous(labels = scales::percent) +
  labs(x = "", y = "Consumer Price Index (Annual %)",
       caption = "Data: International Monetary Fund, via {WDI}",
       title = "The Consumer Price Index (Annual %) in Mexico, 1960-2020",
       subtitle = "Debt crises and currency devaluations will account for the spikes you see.")
