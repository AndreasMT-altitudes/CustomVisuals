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


#############Create Values- dataset from user selected fields####################
# Set the number of columns
num_l_cols <- 5
num_u_cols <- 5

category[] <- lapply(category[1], as.character)

Values <- data.frame(category)
Values2 <- data.frame(category)


# Initialize Values and Values2
if (exists("small_multi")) {
  small_multi[] <- lapply(small_multi[1], as.character)

  Values <- data.frame(category, small_multi)

  Values2 <- data.frame(category, small_multi)

  colnames(Values2)[length(Values2)] = "small"

  colnames(Values)[length(Values)] = "small"
}

# Loop through l_cols
for (i in 1:num_l_cols) {
  l_col_name <- paste("l_col", i, sep="")
  if (exists("category") && exists(l_col_name)) {
    Values[[l_col_name]] <- get(l_col_name)
  }
}

# Loop through u_cols
for (i in 1:num_u_cols) {
  u_col_name <- paste("u_col", i, sep="")
  if (exists("category") && exists(u_col_name)) {
    Values2[[u_col_name]] <- get(u_col_name)
  }
}


#######Color Specefications
default_labels <- c("blue", "#ADD8E6", "#1BD8E6", "red", "orange", "green", "lightgreen", "chartreuse", "lightyellow", "purple")
colors = c()
colors2 = c()

for (i in 1:num_l_cols) {
  label_name <- paste("LowerColumnValue", i, "Format_colLabel", sep = "")
  l_col_name <- paste("l_col", i, sep="")
  if (!exists(label_name) && exists(l_col_name)) {
    colors = append(colors, default_labels[i])
  } else if (exists(label_name) && exists(l_col_name)){
    pick = get(label_name)
    colors = append(colors, pick)
  }
}

for (i in 1:num_u_cols) {
  label_name <- paste("UpperColumnValue", i, "Format_colLabel", sep = "")
  u_col_name <- paste("u_col", i, sep="")
  label = 5 + i
  if (!exists(label_name) && exists(u_col_name)) {
    colors2 = append(colors2, default_labels[label])
  } else if (exists(label_name) && exists(u_col_name)){
    pick = get(label_name)
    colors2 = append(colors2, pick)
  }
}

colors = append(colors, colors2)

###########Transforming Dataframe###############
colnames(Values)[1] = "x_axis"
colnames(Values2)[1] = "x_axis"


if (length(Values) > 2 && exists("small_multi")) {
    df = Values %>% 
      group_by(x_axis, small) %>% 
      summarise_all(list(c(sum="sum"))) %>%
      pivot_longer(c(-x_axis, -small), names_to = "type", values_to = "values") %>%
      mutate(newx_axis = str_wrap(x_axis, width = 10))
  }  else if (length(Values) > 1 && !exists("small_multi")) {
    df = Values %>% 
      group_by(x_axis) %>% 
      summarise_all(list(c(sum="sum"))) %>%
      pivot_longer(-x_axis, names_to = "type", values_to = "values") %>%
      mutate(newx_axis = str_wrap(x_axis, width = 10))
}

if (length(Values2) > 2 && exists("small_multi")) {

    df2 = Values2 %>% 
      group_by(x_axis, small) %>% 
      summarise_all(list(c(sum="sum"))) %>%
      pivot_longer(c(-x_axis, -small), names_to = "type", values_to = "values") %>%
      mutate(newx_axis = str_wrap(x_axis, width = 10))
    } else if (length(Values2) > 1 && !exists("small_multi")){
    df2 = Values2 %>% 
      group_by(x_axis) %>% 
      summarise_all(list(c(sum="sum")))%>%
      pivot_longer(-x_axis, names_to = "type", values_to = "values") %>%
      mutate(newx_axis = str_wrap(x_axis, width = 10))
}

if (exists("small_multi")) {
   if(length(Values2) < 3) {
g = ggplot(df) +
  geom_col(aes(x =newx_axis,
               y = values,
               fill = type),
           width = 0.6) +
  facet_wrap(~small)+
  scale_fill_manual(values = colors,
                     name = NULL)+
           scale_y_continuous(labels = comma_format(big.mark = ".", 
                                               decimal.mark = ","))+
              labs(x = "", y = "");
   } else if (length(Values) < 3){
  g = ggplot(df2) +
  geom_col( aes(newx_axis,  
               y = values, fill = type), 
           width = 0.35) +
  facet_wrap(~small)+
  scale_fill_manual(values = colors,
                     name = NULL)+
           scale_y_continuous(labels = comma_format(big.mark = ".", 
                                               decimal.mark = ","))+
              labs(x = "", y = "");
   } else {
  g = ggplot(df) +
  geom_col(aes(x =newx_axis,
               y = values,
               fill = type),
           width = 0.6) +
   geom_col(data = df2, aes(newx_axis,  
               y = values, fill = type), 
           width = 0.35,
           inherit.aes = FALSE) +
             facet_wrap(~small)+
  scale_fill_manual(values = colors,
                     name = NULL)+
           scale_y_continuous(labels = comma_format(big.mark = ".", 
                                               decimal.mark = ","))+
              labs(x = "", y = "");
  

   }
} else if (!exists("small_multi")) {
  if (length(Values2) < 2){
g = ggplot(df) +
  geom_col(aes(x =newx_axis,
               y = values,
               fill = type),
           width = 0.6) +
  scale_fill_manual(values = colors,
                     name = NULL)+
           scale_y_continuous(labels = comma_format(big.mark = ".", 
                                               decimal.mark = ","))+
              labs(x = "", y = "");
  } else if (length(Values) < 2) {
g = ggplot(df2) +
  geom_col( aes(newx_axis,  
               y = values, fill = type), 
           width = 0.35) +
  scale_fill_manual(values = colors,
                     name = NULL)+
           scale_y_continuous(labels = comma_format(big.mark = ".", 
                                               decimal.mark = ","))+
              labs(x = "", y = "");
  } else {
    g = ggplot(df) +
  geom_col(aes(x =newx_axis,
               y = values,
               fill = type),
           width = 0.6) +
   geom_col(data = df2, aes(newx_axis,  
               y = values, fill = type), 
           width = 0.35,
           inherit.aes = FALSE) +
  scale_fill_manual(values = colors,
                     name = NULL)+
           scale_y_continuous(labels = comma_format(big.mark = ".", 
                                               decimal.mark = ","))+
              labs(x = "", y = "");
  

  }
} else {
g = ggplot(df) +
  geom_col(aes(x =newx_axis,
               y = values,
               fill = type),
           width = 0.6) +
   geom_col(data = df2, aes(newx_axis,  
               y = values, fill = type), 
           width = 0.35,
           inherit.aes = FALSE) +
  scale_fill_manual(values = colors,
                     name = NULL)+
           scale_y_continuous(labels = comma_format(big.mark = ".", 
                                               decimal.mark = ","))+
              labs(x = "", y = "");
  
}

g2 = ggplot() + geom_text(aes(x = 0.5, y = 0.5, label = colors))
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