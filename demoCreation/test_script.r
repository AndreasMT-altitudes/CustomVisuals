library(tidyverse)
library(ggplot2)
library(plotly)
library(scales)

df3 = read_csv("C:/Users/AndreasMT/Downloads/10000-Sales-Records.zip")

category = data.frame(df3$Region)

l_col1 = data.frame(df3[12])
l_col2 = data.frame(df3[13])
l_col3 = data.frame(df3[14])

small_multi =data.frame(df3[4])

Values <- data.frame(category)

num_l_cols = 5

for (i in 1:num_l_cols) {
  l_col_name <- paste("l_col", i, sep="")
  if (exists("category") && exists(l_col_name)) {
    Values[[l_col_name]] <- get(l_col_name)
    names(Values[[l_col_name]]) = names(get(l_col_name))
  }
}

head(Values, 5)

u_col1 = data.frame(df3[11])

rm(u_col3)


df = df %>%
  mutate(type2 = "type1")

df2 = df2 %>%
  mutate(type2 = "type2")


# Example data
set.seed(123)
data_to_use <- data.frame(
  type = rep(c("A", "B", "C"), each = 4),
  newx_axis = rep(1:4, times = 3),
  sum_values = rnorm(12),
  values2 = letters[1:12]
)

LowerColumnValue1Format_textLabel = TRUE
LowerColumnValue2Format_textLabel = TRUE
LowerColumnValue3Format_textLabel = TRUE

LowerColumnValue2Format_labelColor = "#B24CC2"

LowerColumnValue1Format_labelPlace = "middle"
LowerColumnValue2Format_labelPlace = "on top"




for (i in 1:num_cols) {
  label_name <- paste0("LowerColumnValue", i, "Format_textLabel")
  if (!exists(label_name)) {
    assign(label_name, FALSE, envir = .GlobalEnv)
  }
}

for (i in 1:num_cols) {
  label_name <- paste0("UpperColumnValue", i, "Format_textLabel")
  if (!exists(label_name)) {
    assign(label_name, FALSE, envir = .GlobalEnv)
  }
}

# Labels to use in the loop
label_text <- unique(data_to_use$type)

initialize_columns <- function(str) {
  df = data.frame(Variable = c(1),
                  Name = c(2))
  for (i in 1:num_cols) {
    col_name <- paste(str, "_col", i, sep = "")
    text_label = paste(toupper(str),"owerColumnValue", i, "Format_textLabel", sep = "")
    if (exists(col_name) && get(text_label) == TRUE) {
     new_row = c(Variable = colnames(get(col_name)),
                 Names = col_name)
      df = rbind(df, new_row)
    }
  }
  df = df[-1,]
  return(df)
}
test1 = initialize_columns("l")
test2 = initialize_columns("u")
test = rbind(test1, test2); print(test)

library(ggplot2)
library(dplyr)
library(tidyr)
library(purrr)

# Sample data
df1 <- data.frame(ID = c(1, 2, 3),
                  Value1 = c('A', 'B', 'C'))

df2 <- data.frame(ID = c(2, 3, 1, 4),
                  Value2 = c('X', 'Y', 'Z', 'W'))

# Merge the dataframes based on the 'ID' column
merged_df <- merge(df2, df1, by = 'ID', all.x = TRUE)

# Create a new column in df2 based on the conditions
df2$new_column <- ifelse(!is.na(merged_df$Value1), merged_df$Value1, NA)

# Print the result
print(df2)

df
used_labels

tester = merge(x=df,y=used_labels, 
             by.x= c("type"), by.y = c("Variable"), all.x=TRUE)


tester2 = tester %>%
  mutate(sum_values2 = if_else(placement == "middle",
                                                    sum_values-values*0.5,
                                                    if_else(placement == "on top",
                                                            sum_values-max_value*-0.02,
                                                            if_else(placement == "bottom",
                                                                   (sum_values-values)-max_value*-0.02,
                                                                    sum_values-max_value*0.02))))


g + geom_text(data = tester2,  aes(x = newx_axis, y = sum_values2), label = tester2$values2, inherit.aes = FALSE)

