library(tidyverse)
library(ggplot2)
library(plotly)
library(scales)
library(tsibble)

df3 = read_csv("C:/Users/andre/Downloads/10000 Sales Records.csv")
df3 = read_csv("C:/Users/AndreasMT/Downloads/10000-Sales-Records.zip")


category = data.frame(yearmonth(as.Date(df3$`Order Date`, tryFormats = c("%Y-%m-%d", "%m/%d/%Y"))))
category = data.frame(df3[1])
category = category %>%
  filter(yearmonth.as.Date.df3..Order.Date...tryFormats...c...Y..m..d... %in% yearmonth(c("2016 Jan","2016 Feb","2016 Mar","2016 Apr","2016 May","2016 Jun","2016 Jul","2016 Aug","2016 Sep","2016 Oct","2016 Nov","2016 Dec")))


l_col3 = data.frame(df3[12])
l_col1 = data.frame(df3[13])
l_col2 = data.frame(df3[14])
u_col2 = data.frame(df3[10])
BarSettings_LBar_Size = 1
small_multi =data.frame(df3[5])

LowerColumnValue1Format_textLabel = TRUE
LowerColumnValue1Format_Name = ""
LowerColumnValue2Format_textLabel = FALSE
LowerColumnValue3Format_textLabel = TRUE
LowerColumnValue3Format_Name = "test"

LowerColumnValue2Format_labelColor = "#B24CC2"

LowerColumnValue1Format_labelPlace = "none"
LowerColumnValue2Format_labelPlace = "on top"
LowerColumnValue3Format_labelPlace = "middle"



tester = data.frame(Hovedgruppe = c("Andet", "Fragt", "Maskiner", "N/A", "Produktion", "Reservedele", "Service", "Slibning", "Værktøj"),
                    SalesAmount = c(-7399568.64, 952397.38, 132798640.36, 3158.98, 14042030.30, 13715715.50, 14584769.40, 18024815.36, 24691009.02),
                    SalesOrderAmount = c(-4485058.75, 35605.35, 58208000.99, 0.00, 2772146.52, 5450116.05, 40266.98, 677423.53, 8829174.77),
                    SalesBudget = c(NA, NA, 133926315, NA, 12150990, 14502000, 17999000, 19675632, 27082151))

category = data.frame(tester[1])
l_col1 = data.frame(tester[2])
u_col2 = data.frame(tester[3])
u_col1 = data.frame(tester[4])








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

df
typeof(df$newx_axis)
as.Date(df$newx_axis, tryFormats = "%Y %b")

as.yearmon


library(lubridate)

convertTextToDate <- function(date_strings, date_formats) {
  result_dates <- vector("list", length(date_strings))
  
  for (i in seq_along(date_strings)) {
    current_date <- date_strings[i]
    
    parsed_date <- NA
    
    for (format in date_formats) {
      parsed_date <- tryCatch(
        as.Date(current_date, format),
        error = function(e) NA
      )
      
      if (!is.na(parsed_date)) {
        break  # Break the loop if a successful conversion is made
      }
    }
    
    result_dates[[i]] <- parsed_date
  }
  
  return(as.Date(unlist(result_dates)))
}
lct <- Sys.getlocale("LC_TIME"); Sys.setlocale("LC_TIME", "C")
# Example usage:
date_strings <- c("2023 Jan", "Feb 2023", "2023 January", "February 2023", "2023-Jan", "Feb-2023", "2023-February", "February-2023")
date_formats <- c("%Y %b", "%b %Y", "%Y %B", "%B %Y", "%Y-%b", "%b-%Y", "%Y-%B", "%B-%Y")

result_dates <- convertTextToDate(date_strings, date_formats)

# Print the result
print(result_dates)
Sys.setlocale("LC_TIME", "english")
Sys.setlocale("LC_TIME", "danish")

# Install and load the zoo package if not already installed
if (!requireNamespace("zoo", quietly = TRUE)) {
  install.packages("zoo")
}
library(zoo)

convert_to_date <- function(char_vector) {
  # Attempt different date formats
  formats <- c("%Y %b", "%b %Y", "%Y %B", "%B %Y")
  date_vector <- NULL
  
  for (format in formats) {
    date_vector <- as.yearmon(char_vector, format)
    if (!any(is.na(date_vector))) {
      break
    }
  }
  
  if (any(is.na(date_vector))) {
    warning("Failed to convert some elements to dates.")
  }
  
  return(as.Date(date_vector))
}

# Your character vector
char_vector <- c("Jan 2014", "Feb 2014", "Mar 2014", "Apr 2014", "May 2014", "Jun 2014", "Jul 2014", "Aug 2014", "Sep 2014", "Oct 2014", "Nov 2014", "Dec 2014")
char_vector2 = c("Jan-2014", "Feb-2014", "Mar-2014", "Apr-2014", "May-2014")
char_vector3 = c("2014 January", "2014 February", "2014 March", "2014 April", "2014 May")
char_vector4 = c("2014 Januar", "2014 Februar", "2014 Marts", "2014 April", "2014 Maj")
# Convert to date vector
date_vector <- convert_to_date(char_vector)

# Print the result
print(date_vector)
Sys.setlocale(locale = "da_DK.UTF-8")
Sys.setlocale(locale = "en_US.UTF-8") 


test = paste0(char_vector, " 01")

convert_to_date <- function(char_vec) {
if(any(grepl("[-]", char_vec))) {
  test = paste0(char_vec, "-01")
} else if (any(grepl("[/]", char_vec))) {
  test = paste0(char_vec, "/01")
} else {
  test = paste0(char_vec, " 01")
}
  
tryCatch(
  {
    Sys.setlocale(locale = "en_US.UTF-8") 
    out = as.Date(test, 
        tryFormats = c("%Y %b %d", "%b %Y %d",
                       "%Y %B %d", "%B %Y %d",
                       "%Y-%b-%d", "%b-%Y-%d",
                       "%Y-%B-%d", "%B-%Y-%d",
                       "%Y/%b/%d", "%b-%Y/%d",
                       "%Y/%B/%d", "%B-%Y/%d"))                 
print(out)
},
error = function(err) {
    # If an error occurs with the English date format, try Danish date format
    danish_date <- tryCatch(
      {
        Sys.setlocale(locale = "da_DK.UTF-8")
        dout = as.Date(test, 
        tryFormats = c("%Y %b %d", "%b %Y %d",
                       "%Y %B %d", "%B %Y %d",
                       "%Y-%b-%d", "%b-%Y-%d",
                       "%Y-%B-%d", "%B-%Y-%d",
                       "%Y/%b/%d", "%b-%Y/%d",
                       "%Y/%B/%d", "%B-%Y/%d"))                 
      },
      error = function(danish_err) {
        cat("Error with Danish date format. Both attempts failed.\n")
        return(NULL)  # Handle the case where both attempts fail
      }
    )
    print(dout)
  }
)
}
convert_to_date(char_vector4)

parse_date_time("Januar 2014 01", 
        orders = c("%Y %b %d", "%b %Y %d",
                       "%Y %B %d", "%B %Y %d",
                       "%Y-%b-%d", "%b-%Y-%d",
                       "%Y-%B-%d", "%B-%Y-%d",
                       "%Y/%b/%d", "%b-%Y/%d",
                       "%Y/%B/%d", "%B-%Y/%d"), locale = "da")

text = paste0("</br>CampaignID: ", CampaignID,
                                 "</br>Chain: ", Chain,
                                 "</br>Kampagnesalg volumen: ", round(Salg),
                                 "</br>Kampagnesalg - gns. pris (stk): ", round(Pris, digits = 2),
                                 "</br>Kampagnesalg stk: ", `Kampagnesalg stk`,
                                 "</br>PromoEndWeek: ", PromoEndWeek,
                                 "</br>Inkluderede subbrands: ", `Kampagne Unik Subbrands`,
                                 "</br>Antal produkter: ", `Product`,
                                 "</br>Stk tilskud: ", `Stk tilskud`,
                                 "</br>Markedsfoeringstilskud: ", Markedsfoeringstilskud
                   )

dftest <- data.frame(A=c(1,1,1,2,2,2), B=c(3,3,3,6,6, 6), C=c(2,3,9,12,2, 6), D=c("a1", "a2", "a3", "a1", "a2", "a3"))
dftest$D2 = dftest$D
# Pivot the dataframe wider while keeping all columns
result <- pivot_wider(dftest, id_cols = c(A, B, C, D), names_from = D2, values_from = D2)
# Print the result
print(result)

data_to_use
data_to_use$test = data_to_use$values
data_to_use$test2 = data_to_use$type

data_to_use = pivot_wider(data_to_use, id_cols = c(x_axis, type, values, newx_axis, values2, numeric_order, sum_values, type2, date_axis), names_from = test2, values_from = test)

df_test <- data.frame(Column1 = c("A", "B", "C"),
                 Column2 = c(1, 2, 3))

# Create a vector with the desired format
formatted_vector <- apply(df_test, 1, function(row) {
  paste0(row[1], ": ", row[2])
})

# Print the result
print(formatted_vector)
