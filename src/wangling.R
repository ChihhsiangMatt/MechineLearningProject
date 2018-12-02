require(tidyverse)
require(dplyr)
require(foreign)
require(ggplot2)

movement <- read_csv('./data/wber.csv')
upc <- read_csv('./data/upcber.csv')
store <- read.dta("./data/demo.dta")

colnames(upc) <- c("code", "upc", "desc", "size", "case", "nitem")

colnames(movement) <- c("store", "upc", "week", "move", "qty", "price", "prom", "profit", "valid", "priceHex", "profitHex")
movement <- movement %>% 
  filter(valid == 1) %>% 
  select(-c("valid", "priceHex","profitHex")) %>% 
  mutate(sales = price * move / qty)
movement$prom <- as.character(movement$prom)
movement$prom[movement$prom == ""] <- 'N'

store <- store %>% select(c("name", "city", "zip", "store", "age9", "age60", "ethnic", "educ", "nocar", "income"))
