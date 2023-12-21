source('./r_files/flatten_HTML.r')

############### Library Declarations ###############
libraryRequireInstall("ggplot2");
libraryRequireInstall("plotly");
libraryRequireInstall("tidyverse")
####################################################
label_name = "LowerColumnValue1Format_textLabel"
if(!exists(label_name))
    assign(label_name, FALSE, envir = .GlobalEnv)

df = Values %>% 
  group_by(Region) %>% 
  summarise_all(list(c(sum = "sum")))

df2 = df %>%
  mutate(text = as.character(`Total Revenue`)) %>%
  mutate(color = c("red", "blue", "black", "brown", "yellow", "purple", "green")) %>%
  mutate(size = c(10, 5, 9,8,11,13,4))


if(get("LowerColumnValue1Format_textLabel") == TRUE) {
g = ggplot(df, aes(x = Region, y = `Total Revenue`)) + geom_col() + geom_text(data  =df2, aes(x = Region, y =`Total Revenue`), label = df2$text, color = df2$color, size = df2$size, inherit.aes = FALSE)
} else {

  g = ggplot(df, aes(x = Region, y = `Total Revenue`)) + geom_col()
}

################### Actual code ####################
p = ggplotly(g, tooltip = c( "text"));
internalSaveWidget(p, 'out.html');
####################################################

################ Reduce paddings ###################
ReadFullFileReplaceString('out.html', 'out.html', ',"padding":[0-9]*,', ',"padding":0,')
####################################################
