source('./r_files/flatten_HTML.r')

############### Library Declarations ###############
suppressWarnings(suppressMessages(libraryRequireInstall("ggplot2")));
suppressWarnings(suppressMessages(libraryRequireInstall("plotly")))
suppressWarnings(suppressMessages(libraryRequireInstall("tidyverse")))
suppressWarnings(suppressMessages(libraryRequireInstall("scales")))
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
      colnames(df)[length(df)] <- colnames(get(col_name))
    }
  }
  return(df)
}

Values <- initialize_data_frame(Values, "l")
Values2 <- initialize_data_frame(Values2, "u")


#######Color Specefications
default_labels <- c("blue", "#ADD8E6", "#1BD8E6", "red", "orange", "green", "lightgreen", "chartreuse4", "lightyellow", "purple")
colors = c()
colors2 = c()

colors <- lapply(1:num_cols, function(i) {
  label_name <- paste("LowerColumnValue", i, "Format_colLabel", sep = "")
  col_name <- paste("l_col", i, sep = "")
  if (!exists(label_name) && exists(col_name)) {
    return(default_labels[i])
  } else if (exists(label_name) && exists(col_name)) {
    return(get(label_name))
  }
})

colors2 <- lapply(1:num_cols, function(i) {
  label_name <- paste("UpperColumnValue", i, "Format_colLabel", sep = "")
  col_name <- paste("u_col", i, sep = "")
  label <- 5 + i
  if (!exists(label_name) && exists(col_name)) {
    return(default_labels[label])
  } else if (exists(label_name) && exists(col_name)) {
    return(get(label_name))
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
    df = Values %>%
      group_by(x_axis, small) %>%
      summarise_all(list(c(sum = "sum"))) %>%
      pivot_longer(c(-x_axis, -small), names_to = "type", values_to = "values") %>%
      mutate(newx_axis = str_wrap(x_axis, width = 10),
      values2 = paste0(as.character(round(values / 1e6, 0)), "M")) %>%
      assign_numeric_order(type_column = type) %>%
      group_by(x_axis, small) %>%
      arrange(x_axis,small, numeric_order) %>%
      mutate(sum_values = accumulate(values, ~.x + .y)[numeric_order]) %>%
      ungroup()
  } else if (!exists("small_multi") && length(data) > 1) {
    df = data %>%
      group_by(x_axis) %>%
      summarise_all(list(c(sum = "sum"))) %>%
      pivot_longer(c(-x_axis), names_to = "type", values_to = "values") %>%
      mutate(newx_axis = str_wrap(x_axis, width = 10),
      values2 = paste0(as.character(round(values / 1e6, 0)), "M"))%>%
      assign_numeric_order(type_column = type) %>%
      group_by(x_axis) %>%
      arrange(x_axis, numeric_order) %>%
      mutate(sum_values = accumulate(values, ~.x + .y)[numeric_order]) %>%
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
                  Name = c(2))
  for (i in 1:num_cols) {
    col_name <- paste(str, "_col", i, sep = "")
    if (str == "l") text_label = paste("LowerColumnValue", i, "Format_textLabel", sep = "") else text_label = paste("UpperColumnValue", i, "Format_textLabel", sep = "")
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
test = rbind(test1, test2)

g <- ggplot() +
  scale_fill_manual(values = all_colors, name = NULL) +
  scale_y_continuous(labels = scales::comma_format(big.mark = ".", decimal.mark = ",")) +
  labs(x = "", y = "")

if(exists("small_multi")) {
  data_to_use <- if (length(df) == 1) df2 else if (length(df2) == 1) df else merge(df, df2, all = TRUE, by = c("newx_axis", "values", "type", "type2", "values2", "small", "numeric_order", "sum_values"))

  label_text = unique(test$Variable)

  g <- g +
    geom_col(data = data_to_use[data_to_use$type2 == "type1",], 
             aes(x = newx_axis, y = values, fill = type), 
             width = 0.6) +
    geom_col(data = data_to_use[data_to_use$type2 == "type2",], 
             aes(x = newx_axis, y = values, fill = type), 
             width = 0.35)+
             facet_grid(~small) + ##### Tror alt til small multi format kan lægges her
             theme(strip.background =element_rect(fill="#FFFFFF"))

  for (label in label_text) {
  g <- g + geom_text(data = data_to_use[data_to_use$type == label, ],
                     aes(x = newx_axis, y = sum_values, label = values2),
                     inherit.aes = FALSE)  # Adjust the nudge_y as needed
}
} else {
  data_to_use <- if (length(df) == 1) df2 else if (length(df2) == 1) df else merge(df, df2, all = TRUE, by = c("newx_axis", "values", "type", "type2", "values2", "numeric_order", "sum_values"))

  label_text = unique(test$Variable)

  g <- g +
    geom_col(data = data_to_use[data_to_use$type2 == "type1",], 
             aes(x = newx_axis, y = values, fill = type), 
             width = 0.6) +
    geom_col(data = data_to_use[data_to_use$type2 == "type2",], 
             aes(x = newx_axis, y = values, fill = type), 
             width = 0.35) 
 
  for (label in label_text) {
  g <- g + geom_text(data = data_to_use[data_to_use$type == label, ],
                     aes(x = newx_axis, y = sum_values, label = values2),
                     inherit.aes = FALSE)  # Adjust the nudge_y as needed
}
}


g2 = ggplot() + geom_text(aes(x = 0.5, y = 0.5, label = LowerColumnValue1Format_textLabel))
####################################################

############# Create and save widget ###############
p = ggplotly(g, tooltip =c("values"))%>%
  layout(plot_bgcolor='#FFFFFF',
         yaxis = list(gridcolor = "#F1F2F3",
                      gridwidth = 0.1),
         legend = list(orientation = 'h',
                       y = 1.1,
                       font = list(size = 9),
                       title=list(text='')),
         hoverlabel = list(align = "left")
  ) %>% 
  config(displayModeBar = F);

p2 = ggplotly(g2)
internalSaveWidget(p, 'out.html');
####################################################

################ Reduce paddings ###################
ReadFullFileReplaceString('out.html', 'out.html', ',"padding":[0-9]*,', ',"padding":0,')
####################################################