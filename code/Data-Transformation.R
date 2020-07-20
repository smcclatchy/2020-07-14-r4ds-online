rm(list = ls(all.names = TRUE))
#setwd("C:/Users/yuanx/Desktop/R-for-DataScience-7-16")

library(tidyverse)
library(nycflights13)

1/200*30
sin(pi/2)

x <- 3*4
x

# R names can contain letters, numbers, _, and .
# cannot start with a number 
# 1 becomes X1
# case sensitive
# i_use_snake_case
# otherPeopleUseCamelCase

r_rocks <- 2^3


# filter(): Pick observations(rows) by their values 
# arrange(): reorder the rows
# select(): pick variables(columns) by their names
# mutate():create new variables with functions of existing variables ()
# group_by(): operating functions on user defined groups
# summarise(): collapse many values down to a single summary

# The result will be a NEW dataframe
flights
str(flights)

# use single "|" for OR
NovDec <- filter(flights, month == 11 | month == 12)

# %in%
nov_dec <- filter(flights, month %in% c(11,12))

NA > 5
10 == NA
NA == NA
mean(c(12,3,4,NA))

arrange(flights,year,month,day)

arrange(flights, desc(dep_delay))

select(flights, carrier, dest)

# :
select(flights, year:day)

# -
select(flights,-(year:day))

# functions used together with select()
# starts_with("a")
# ends_with()
# contains()
# matches() <- regular expression
# num_range("x",1:3) will give you x1, x2,and x3

# practice
dat <- read_tsv(file = "ALLphenoData.tsv")

# female above 40
subset1 <- filter(dat,sex == "F", age > 40)

# subsect with only "BCR/ABL" and "NEG" in the mol.biol column.

subset2 <- filter(dat, mol.biol %in% c('BCR/ABL','NEG'))

subset2 <- mutate(subset2, BT_new = substr(BT,1,1))

subset2 %>%
  group_by(mol.biol,BT_new)%>%
  summarise(n())

