require(tidyverse)
require(dplyr)
require(foreign)
require(psych)

movement <- read.csv('./data/wber.csv')
upc <- read.csv('./data/upcber.csv')
