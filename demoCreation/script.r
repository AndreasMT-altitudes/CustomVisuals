source('./r_files/flatten_HTML.r')

############### Library Declarations ###############
suppressWarnings(suppressMessages(libraryRequireInstall("ggplot2")));
suppressWarnings(suppressMessages(libraryRequireInstall("plotly")))
suppressWarnings(suppressMessages(libraryRequireInstall("tidyverse")))
suppressWarnings(suppressMessages(libraryRequireInstall("scales")))
suppressWarnings(suppressMessages(libraryRequireInstall("tsibble")))
suppressWarnings(suppressMessages(libraryRequireInstall("lubridate")))
####################################################

################### Actual code ####################
###################Dealing with errors##############
if(!exists("category")) {
  errorText <- "There needs to be a categorical column
                </br> in the Category field"
  g = ggplot() + geom_text(aes(x = 0.5, y = 0.5, label = errorText), size = 5) +
    theme(
      axis.title.x = element_blank(),
      axis.text.x = element_blank(),
      axis.ticks.x = element_blank(),
      axis.title.y = element_blank(),
      axis.text.y = element_blank(),
      axis.ticks.y = element_blank()
    )
  p = ggplotly(g) %>%
    layout(plot_bgcolor='#FFFFFF',
           yaxis = list(zerolinecolor = '#ffff',
                        zerolinewidth = 2,
                        gridcolor = 'ffff',
                        showticklabels=FALSE),
           xaxis = list(zerolinecolor = '#ffff',
                        zerolinewidth = 2,
                        gridcolor = 'ffff',
                        showticklabels=FALSE))
  internalSaveWidget(p, 'out.html')
  ReadFullFileReplaceString('out.html', 'out.html', ',"padding":[0-9]*,', ',"padding":0,')
  quit()                       
}

###########Settings defualt values for formating options############
num_cols <- 5

##Setting Labels to True in the enviroment, if nothing is supplied
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


##Setting label placement to default values if nothing else is supplied
for (i in 1:num_cols) {
  label_name <- paste0("LowerColumnValue", i, "Format_labelPlace")
  if (!exists(label_name)) {
    assign(label_name, "top", envir = .GlobalEnv)
  }
}

for (i in 1:num_cols) {
  label_name <- paste0("UpperColumnValue", i, "Format_labelPlace")
  if (!exists(label_name)) {
    assign(label_name, "top", envir = .GlobalEnv)
  }
}

##########Legend Settings###################
if (!exists("LegendSettings_Orientation")) {
  LegendSettings_Orientation = "h"
}

if (!exists("LegendSettings_textSize")) {
  LegendSettings_textSize = "8"
}

if (!exists("LegendSettings_legendTitle")) {
  LegendSettings_legendTitle = ""
}
if (!exists("LegendSettings_legendTitleSize")) {
  LegendSettings_legendTitleSize = "12"
}


##########Bar Settings###################
if (!exists("BarSettings_textSize")) {
  BarSettings_textSize = 12/4
} else {
  BarSettings_textSize = as.numeric(BarSettings_textSize)/4
}

if (!exists("BarSettings_colLabel")) {
  BarSettings_colLabel = "black"
}

if (!exists("BarSettings_LBarSize")) {
  BarSettings_LBarSize = 0.6
} else {
   as.numeric(BarSettings_LBarSize)
}

if (!exists("BarSettings_UBarSize")) {
  BarSettings_UBarSize = 0.35
} else {
   as.numeric(BarSettings_UBarSize)
}


##########Axes Settings###################
if (!exists("mySettingsAxes_x_axis_title")) {
  mySettingsAxes_x_axis_title = ""
}

if (!exists("mySettingsAxes_y_axis_title")) {
  mySettingsAxes_y_axis_title = ""
}

if (!exists("mySettingsAxes_x_axis_titleTextSize")) {
mySettingsAxes_x_axis_titleTextSize = 10
}

if (!exists("mySettingsAxes_y_axis_titleTextSize")) {
mySettingsAxes_y_axis_titleTextSize = 10
}

if (!exists("mySettingsAxes_x_axis_textSize")) {
 mySettingsAxes_x_axis_textSize = 8
}

if (!exists("mySettingsAxes_y_axis_textSize")) {
 mySettingsAxes_y_axis_textSize = 8
}

if (!exists("mySettingsAxes_x_axis_textRotate")) {
 mySettingsAxes_x_axis_textRotate = 0
} else {
    mySettingsAxes_x_axis_textRotate = as.numeric(mySettingsAxes_x_axis_textRotate)
}




update_geom_defaults("text", list(size = BarSettings_textSize, color = BarSettings_colLabel)) ##sæt nu genereal size her

#############Create Values- dataset from user selected fields####################
# Set the number of columns

category[] <- lapply(category[1], as.character)

Values <- data.frame(category)
Values2 <- data.frame(category)

initialize_data_frame <- function(df, str) {
  if (exists("small_multi")) {
    small_multi[] <- lapply(small_multi[1], as.character)
    df <- data.frame(category, small_multi)
    colnames(df)[length(df)] <- "small"
  }

  for (i in 1:num_cols) {
    col_name <- paste(str, "_col", i, sep = "")
    if (exists("category") && exists(col_name)) {
      df[[col_name]] <- get(col_name)
      if(str == "l"){
        test = "Lower"
    } else {
      test = "Upper"
    }
      if(exists(paste0(test ,"ColumnValue", i, "Format_Name"))){
        if(get(paste0(test ,"ColumnValue", i, "Format_Name")) == ""){
          colnames(df)[length(df)] <- colnames(get(col_name))
      } else {
          colnames(df)[length(df)] <- get(paste0(test ,"ColumnValue", i, "Format_Name"))
        }
      } 
      else{
      colnames(df)[length(df)] <- colnames(get(col_name))
      }
    }
  }
  return(df)
}

Values <- initialize_data_frame(Values, "l")
Values2 <- initialize_data_frame(Values2, "u")


#######Color Specefications
default_labels <- c("#9e7e38", "#59786c", "#82231c", "#511536", "#443e67", "#375669", "#456525", "#000000", "#3d3c1d", "#625750")
colors = c()
colors2 = c()

colors <- lapply(1:num_cols, function(i) {
  label_name <- paste("LowerColumnValue", i, "Format_colLabel", sep = "")
  label_name2 <- paste("LowerColumnValue", i, "Format_Name", sep = "")
  col_name <- paste("l_col", i, sep = "")

  if(exists(label_name2) && get(label_name2) != "") {
    if (!exists(label_name) && exists(col_name)) {
      col_vec = c()
      name = get(label_name2)
      col_vec[name] = default_labels[i]
      value = col_vec[name]
      return(col_vec)
    } else if (exists(label_name) && exists(col_name)) {
      col_vec = c()
      name = get(label_name2)
      col_vec[name] = get(label_name)
      value = col_vec[name]
      return(value)
    } 
  } else {
    if (!exists(label_name) && exists(col_name)) {
      col_vec = c()
      name = colnames(get(col_name))
      col_vec[name] = default_labels[i]
      value = col_vec[name]
      return(col_vec)
    } else if (exists(label_name) && exists(col_name)) {
      col_vec = c()
      name = colnames(get(col_name))
      col_vec[name] = get(label_name)
      value = col_vec[name]
      return(value)
    }

  }
})

colors2 <- lapply(1:num_cols, function(i) {
  label_name <- paste("UpperColumnValue", i, "Format_colLabel", sep = "")
  label_name2 <- paste("UpperColumnValue", i, "Format_Name", sep = "")
  col_name <- paste("u_col", i, sep = "")
  label <- 5 + i
  if(exists(label_name2) && get(label_name2) != "") {
    if (!exists(label_name) && exists(col_name)) {
      col_vec = c()
      name = get(label_name2)
      col_vec[name] = default_labels[label]
      value = col_vec[name]
      return(col_vec)
    } else if (exists(label_name) && exists(col_name)) {
      col_vec = c()
      name = get(label_name2)
      col_vec[name] = get(label_name)
      value = col_vec[name]
      return(value)
    } 
  } else {
    if (!exists(label_name) && exists(col_name)) {
      col_vec = c()
      name = colnames(get(col_name))
      col_vec[name] = default_labels[label]
      value = col_vec[name]
      return(col_vec)
    } else if (exists(label_name) && exists(col_name)) {
      col_vec = c()
      name = colnames(get(col_name))
      col_vec[name] = get(label_name)
      value = col_vec[name]
      return(value)
    }

  }
})

all_colors <- unlist(c(colors, colors2))

###########Transforming Dataframe###############
colnames(Values)[1] = "x_axis"
colnames(Values2)[1] = "x_axis"


#Function to make alphabetical order of columns
assign_numeric_order <- function(data, type_column) {
  data %>%
    mutate(numeric_order = match({{type_column}}, rev(sort(unique({{type_column}})))))
}

# Function to create summary data frame
create_summary_df <- function(data) {
  if (exists("small_multi") && length(data) > 2) {
    df = data %>%
      group_by(x_axis, small) %>%
      summarise_all(list(c(sum = "sum"))) %>%
      pivot_longer(c(-x_axis, -small), names_to = "type", values_to = "values") %>%
      assign_numeric_order(type_column = type) %>%
      group_by(x_axis, small) %>%
      arrange(x_axis,small, numeric_order) %>%
      mutate(sum_values = accumulate(coalesce(values, 0), ~.x + .y)[numeric_order]) %>%
      ungroup()
  } else if (!exists("small_multi") && length(data) > 1) {
    df = data %>%
      group_by(x_axis) %>%
      summarise_all(list(c(sum = "sum"))) %>%
      pivot_longer(c(-x_axis), names_to = "type", values_to = "values") %>%
      assign_numeric_order(type_column = type) %>%
      group_by(x_axis) %>%
      arrange(x_axis, numeric_order) %>%
      mutate(sum_values = accumulate(coalesce(values, 0), ~.x + .y)[numeric_order]) %>%
      ungroup()
  } else {
    df = data.frame()  # or NULL, depending on your use case
  }
  return(df)
}

# Create summary data frames
df = create_summary_df(Values)
df2 = create_summary_df(Values2)

#Add type for ploting
df = df %>%
  mutate(type2 = "type1")
df2 = df2 %>%
  mutate(type2 = "type2")

###############Plotting section################

#Collecting wanted labels
initialize_columns <- function(str) {
  df = data.frame(Variable = c(1),
                  Name = c(2),
                  placement = 1)
  for (i in 1:num_cols) {
    col_name <- paste(str, "_col", i, sep = "")
    if (str == "l") text_label = paste("LowerColumnValue", i, "Format_textLabel", sep = "") else text_label = paste("UpperColumnValue", i, "Format_textLabel", sep = "")
    if (str == "l") name_label = paste("LowerColumnValue", i, "Format_Name", sep = "") else name_label = paste("UpperColumnValue", i, "Format_Name", sep = "")
    if (exists(col_name) && get(text_label) == TRUE && !exists(name_label)) {
     new_row = c(Variable = colnames(get(col_name)),
                 Names = col_name,
                 placement = get(paste(str_split(text_label, "_")[[1]][1], "_labelPlace", sep = "")))
      df = rbind(df, new_row)
    } else if(exists(col_name) && get(text_label) == TRUE && exists(name_label) && get(name_label) != "") {
     new_row = c(Variable = get(name_label),
                 Names = col_name,
                 placement = get(paste(str_split(text_label, "_")[[1]][1], "_labelPlace", sep = "")))
      df = rbind(df, new_row)
    }else if(exists(col_name) && get(text_label) == TRUE && exists(name_label) && get(name_label) == "") {
     new_row = c(Variable = colnames(get(col_name)),
                 Names = col_name,
                 placement = get(paste(str_split(text_label, "_")[[1]][1], "_labelPlace", sep = "")))
      df = rbind(df, new_row)
  }

  }
    df = df[-1,]
  return(df)

}
used_labels1 = initialize_columns("l")
used_labels2 = initialize_columns("u")
used_labels = rbind(used_labels1, used_labels2)

df$date_axis = df$x_axis
df2$date_axis = df2$x_axis

if(any(grepl("^(\\d{4}\\s?[-\\s/]\\s?[a-zA-Z]{3,}|[a-zA-Z]{3,}\\s?[-\\s/]\\s?\\d{4})$", df$x_axis, perl = TRUE))) {

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
    return(parse_date_time(test, 
        orders = c("%Y %b %d", "%b %Y %d",
                       "%Y %B %d", "%B %Y %d",
                       "%Y-%b-%d", "%b-%Y-%d",
                       "%Y-%B-%d", "%B-%Y-%d",
                       "%Y - %B-%d", "%B - %Y-%d",
                       "%Y - %b-%d", "%b - %Y-%d",                       
                       "%Y/%b/%d", "%b/%Y/%d",
                       "%Y/%B/%d", "%B/%Y/%d",
                       "%Y / %b/%d", "%b / %Y/%d",
                       "%Y / %B/%d", "%B / %Y/%d")))                
},
error = function(err) {
    # If an error occurs with the English date format, try Danish date format
    danish_date <- tryCatch(
      {
        return(parse_date_time(test, 
        orders = c("%Y %b %d", "%b %Y %d",
                       "%Y %B %d", "%B %Y %d",
                       "%Y-%b-%d", "%b-%Y-%d",
                       "%Y-%B-%d", "%B-%Y-%d",
                       "%Y/%b/%d", "%b-%Y/%d",
                       "%Y/%B/%d", "%B-%Y/%d"), locale = "da"))             
      },
      error = function(danish_err) {
        cat("Error with Danish date format. Both attempts failed.\n")
        return(NULL)  # Handle the case where both attempts fail
      }
    )
  }
)
}

if(length(df) > 1){
df$date_axis = convert_to_date(df$x_axis)
}
if(length(df2) > 1){
df2$date_axis = convert_to_date(df2$x_axis)
}
}

max = max(rbind(df, df2)$sum_values, na.rm = TRUE)
unit = ifelse(max > 1000000000000, "bio.", ifelse(max > 1000000000, "mia.", ifelse(max > 1000000, "mio.", ifelse(max > 1000, "tus.", ""))))
scale = ifelse(max > 1000000000000, 1e-12, ifelse(max > 1000000000, 1e-9, ifelse(max > 1000000, 1e-6, ifelse(max > 1000, 1e-3, ""))))

g <- ggplot() +
  scale_fill_manual(values = all_colors, name = NULL) +
  scale_y_continuous(labels = unit_format(unit = unit, scale = scale)) +
  labs(x = mySettingsAxes_x_axis_title, y = mySettingsAxes_y_axis_title) + 
  theme(axis.text.x = element_text(size = mySettingsAxes_x_axis_textSize, angle = mySettingsAxes_x_axis_textRotate),
        axis.text.y = element_text(size = mySettingsAxes_y_axis_textSize),
        axis.title.x = element_text(size=mySettingsAxes_x_axis_titleTextSize),
        axis.title.y = element_text(size=mySettingsAxes_y_axis_titleTextSize))

if(!exists("BarSettings_decimal")){
  BarSettings_decimal = 0
}
BarSettings_decimal = as.numeric(BarSettings_decimal)

if (exists("BarSettings_unitLabel")) {
  if(BarSettings_unitLabel == "auto") {

  } else{
  unit = BarSettings_unitLabel

    if(unit == "tus.") {
      scale = 1e-3
    } else if(unit == "mio.") {
      scale = 1e-6
    } else if(unit == "mia.") {
      scale = 1e-9
    } else if(unit == "bio.") {
      scale = 1e-12
    }

  } 
}


if(length(df) > 1){
  df = df %>%
    mutate(values2 = ifelse(is.na(values), paste0("0", unit), paste0(as.character(round(values*scale, BarSettings_decimal)), unit))) 
}

if(length(df2) > 1){
  df2 = df2 %>%
    mutate(values2 = ifelse(is.na(values), paste0("0", unit), paste0(as.character(round(values*scale, BarSettings_decimal)), unit))) 
}

##########Advanced plotting start################

if(exists("small_multi")) {
  data_to_use <- if (length(df) == 1) df2 else if (length(df2) == 1) df else merge(df, df2, all = TRUE, by = c("values", "type", "type2", "values2", "small", "numeric_order", "sum_values", "x_axis", "date_axis"))

  max_value = max(data_to_use$values, na.rm = TRUE)
  combined = merge(x=data_to_use,y=used_labels, 
             by.x= c("type"), by.y = c("Variable"), all.x=TRUE)

combined_df = combined %>%
  mutate(sum_values2 = if_else(placement == "middle",
                               sum_values-values*0.5,
                               if_else(placement == "on top",
                                       sum_values-max_value*-0.02,
                                       if_else(placement == "bottom",
                                               (sum_values-values)-max_value*-0.02,
                                               sum_values-max_value*0.04))))

data_to_use[is.na(data_to_use)] <- 0

data_to_use1 = data_to_use %>% select(c(type, values, numeric_order, type2))

formatted_vector1 <- apply(data_to_use1[data_to_use1$type2 == "type1",], 1, function(row) {
  paste0(row[1], ": ", row[2])
})

formatted_vector2 <- apply(data_to_use1[data_to_use1$type2 == "type2",], 1, function(row) {
  paste0(row[1], ": ", row[2])
})

  g <- g +
    geom_col(data = data_to_use[data_to_use$type2 == "type1",], 
             aes(x = reorder(x_axis, date_axis), y = values, fill = type, text = formatted_vector1), 
             width = BarSettings_LBarSize) +
    geom_col(data = data_to_use[data_to_use$type2 == "type2",], 
             aes(x = reorder(x_axis, date_axis), y = values, fill = type, text = formatted_vector2), 
             width = BarSettings_UBarSize)+
             facet_grid(~small) + ##### Tror alt til small multi format kan lægges her
             theme(strip.background =element_rect(fill="#FFFFFF"))+
    geom_text(data = combined_df,
              aes(x = reorder(x_axis, date_axis),
                  y = sum_values2),
              label = combined_df$values2,
              inherit.aes = FALSE)

} else {
  data_to_use <- if (length(df) == 1) df2 else if (length(df2) == 1) df else merge(df, df2, all = TRUE, by = c("x_axis", "values", "type", "type2", "values2", "numeric_order", "sum_values", "x_axis", "date_axis"))

  max_value = max(data_to_use$values, na.rm = TRUE)

  combined = merge(x=data_to_use,y=used_labels, 
             by.x= c("type"), by.y = c("Variable"), all.x=TRUE)

combined_df = combined %>%
  mutate(sum_values2 = if_else(placement == "middle",
                               sum_values-values*0.5,
                               if_else(placement == "on top",
                                       sum_values-max_value*-0.02,
                                       if_else(placement == "bottom",
                                               (sum_values-values)-max_value*-0.02,
                                               sum_values-max_value*0.04))))                                              

data_to_use[is.na(data_to_use)] <- 0

data_to_use1 = data_to_use %>% select(c(type, values, numeric_order, type2))

formatted_vector1 <- apply(data_to_use1[data_to_use1$type2 == "type1",], 1, function(row) {
  paste0(row[1], ": ", row[2])
})

formatted_vector2 <- apply(data_to_use1[data_to_use1$type2 == "type2",], 1, function(row) {
  paste0(row[1], ": ", row[2])
})

  g <- g +
    geom_col(data = data_to_use[data_to_use$type2 == "type1",], 
             aes(x = reorder(x_axis, date_axis), y = values, fill = type, text = formatted_vector1), 
             width = BarSettings_LBarSize) +
    geom_col(data = data_to_use[data_to_use$type2 == "type2",], 
             aes(x = reorder(x_axis, date_axis), y = values, fill = type, text = formatted_vector2), 
             width = BarSettings_UBarSize) +
    geom_text(data = combined_df,
              aes(x = reorder(x_axis, date_axis),
                  y = sum_values2),
              label = combined_df$values2,
              inherit.aes = FALSE)
 
}

####################################################

############# Create and save widget ###############
p = ggplotly(g, tooltip = c("text"))%>%
  layout(plot_bgcolor='#FFFFFF',
         yaxis = list(gridcolor = "#F1F2F3",
                      gridwidth = 0.1),
         legend = list(orientation = LegendSettings_Orientation,
                       y = 1.1,
                       font = list(size = LegendSettings_textSize),
                       title=list(text=LegendSettings_legendTitle, font = list(size = LegendSettings_legendTitleSize))),
         hoverlabel = list(align = "left")
  ) %>% 
  config(displayModeBar = F);


internalSaveWidget(p, 'out.html');
####################################################

################ Reduce paddings ###################
ReadFullFileReplaceString('out.html', 'out.html', ',"padding":[0-9]*,', ',"padding":0,')
####################################################
