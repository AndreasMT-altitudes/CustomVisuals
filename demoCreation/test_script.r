library(tidyverse)
library(ggplot2)
library(plotly)
library(scales)

df3 = read_csv("C:/Users/AndreasMT/Downloads/10000-Sales-Records.zip")

category = data.frame(df3$Region)

l_col1 = data.frame(df3[11])
u_col2 = data.frame(df3[12])
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
LowerColumnValue2Format_textLabel = FALSE
LowerColumnValue3Format_textLabel = TRUE

LowerColumnValue2Format_labelColor = "#B24CC2"

LowerColumnValue1Format_labelPlace = "none"
LowerColumnValue2Format_labelPlace = "on top"
LowerColumnValue3Format_labelPlace = "middle"




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


g + geom_text(data = tester2,  aes(x = newx_axis, y = sum_values2), label = tester2$values2, color = tester2$color, inherit.aes = FALSE)


 for (label in label_text) {
    placement = used_labels$placement[which(label_text == label)]
  g <- g + geom_text(data = data_to_use[data_to_use$type == label, ],
                     aes(x = newx_axis, y = if_else(rep(placement, nrow(data_to_use[data_to_use$type == label, ][1])) == "middle",
                                                    sum_values-values*0.5,
                                                    if_else(rep(placement, nrow(data_to_use[data_to_use$type == label, ][1])) == "on top",
                                                            sum_values-max_value*-0.02,
                                                            if_else(rep(placement, nrow(data_to_use[data_to_use$type == label, ][1])) == "bottom",
                                                                   (sum_values-values)-max_value*-0.02,
                                                                    sum_values-max_value*0.02))))
                                                            , label = values2,
                     color = used_labels$color[which(label_text == label)],
                     size = used_labels$font_size[which(label_text == label)],
                     inherit.aes = FALSE)
}

df01 <- data.frame(
  category = rep(c("D", "B", "C"), each = 5),
  value = rnorm(15)
)

# Define custom colors for each category
custom_colors <- c("D" = "red", "B" = "green", "C" = "blue")

# Create a ggplot with custom colors
ggplot(df01, aes(x = category, y = value, fill = category)) +
  geom_bar(stat = "identity") +
  scale_fill_manual(values = custom_colors) +
  labs(title = "Custom Color Assignment") +
  theme_minimal()

# Create a vector
my_vector <- c()

# Save a text string
my_text <- "example_entry"

# Use the text string as the name of an entry in the vector
my_vector[my_text] <- 42

# Access the entry using the saved text string
value <- my_vector[my_text]

# Print the value
print(value)

num_cols <- 5

# Vector of default colors
default_labels <- c("#73b761", "#4a588a", "#ecc846", "#cd4c46", "#71afe2")

# Create an empty list to store colors
colors <- list()

# Loop through columns
for (i in 1:num_cols) {
  label_name <- paste("LowerColumnValue", i, "Format_colLabel", sep = "")
  col_name <- paste("l_col", i, sep = "")
  
  # Check if label_name and col_name exist
  if (exists(label_name) && exists(col_name)) {
    col_vec <- c()
    name <- colnames(get(col_name))
    col_vec[name] <- get(label_name)
    colors[[name]] <- col_vec
  } else {
    # Use default color if conditions are not met
    name <- colnames(get(col_name))
    colors[[name]] <- default_labels[i]
  }
}

# Print the resulting colors
print(colors)
