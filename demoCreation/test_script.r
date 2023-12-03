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
