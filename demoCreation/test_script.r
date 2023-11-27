library(tidyverse)
library(ggplot2)
library(plotly)
library(scales)

df3 = read_csv("C:/Users/AndreasMT/Downloads/10000-Sales-Records.zip")

category = data.frame(df3$Region)

l_col1 = data.frame(df3[12])
l_col2 = data.frame(df3[13])
l_col3 = data.frame(df3[14])

rm(l_col3)

u_col1 = data.frame(df3[14])

rm(u_col1)

l_col3 = data.frame(df3[14])
