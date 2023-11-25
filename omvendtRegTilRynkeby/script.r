source('./r_files/flatten_HTML.r')

suppressWarnings(suppressMessages(libraryRequireInstall("ggplot2")));
suppressWarnings(suppressMessages(libraryRequireInstall("plotly")))
suppressWarnings(suppressMessages(libraryRequireInstall("tidyverse")))
####################################################
################### Actual code ####################
Values = read.csv('C:/Users/AndreasMT/REditorWrapper_eb05ebdc-6d0f-4d4e-9c01-43c6844a2967/input_df_332028cb-b451-448d-b3d6-b33d9b25f807.csv', check.names = FALSE, encoding = "UTF-8", blank.lines.skip = FALSE);
Values$Chain = as.character(Values$Chain)
Values$CampaignID = as.character(Values$CampaignID)
Values$PromoEndWeek = as.character(Values$PromoEndWeek)
Values$`Kampagne Unik Subbrands` = as.character(Values$`Kampagne Unik Subbrands`)

df = Values %>%
  filter(!is.na(`Kampagne salg vol`)) %>%
  rename(Salg = `Kampagne salg vol`) %>% 
  rename(Pris = `Kampagnesalg - gns. pris (stk)`) %>%
  mutate(Chain = if_else(Chain == "Føtex", "Foetex", Chain)) %>% 
  mutate(Chain = if_else(Chain == "Min Købmand", "Min Koebmand", Chain)) %>%
  mutate(`Kampagne Unik Subbrands` = str_replace_all(`Kampagne Unik Subbrands`, "[Æ]|[æ]", "ae")) %>% 
  mutate(`Kampagne Unik Subbrands` = str_replace_all(`Kampagne Unik Subbrands`, "[Ø]|[ø]", "oe")) %>% 
  mutate(`Kampagne Unik Subbrands` = str_replace_all(`Kampagne Unik Subbrands`, "[Å]|[å]", "aa")) %>% 
  filter(Salg < 30000)

model = lm(Salg ~ Pris, data = df);

df3 = data.frame( "Kampagnesalg - gns. pris (stk)"= numeric(10000), 'Kampagne salg vol' = numeric(10000), stringsAsFactors = FALSE);

for (i in 1:length(df3$Kampagne.salg.vol))
{
  
  df3[i,1] = i*0.005
  df3[i,2] = df3[i,1] * model$coefficients[2] + model$coefficients[1]
};

df3 = df3 %>% 
  rename("Kampagne salg vol" = Kampagne.salg.vol) %>% 
  rename("Kampagnesalg - gns. pris (stk)" = Kampagnesalg...gns..pris..stk.) %>% 
  mutate("Kampagnesalg - gns. pris (stk)" = round(`Kampagnesalg - gns. pris (stk)`, digits = 2));

g = ggplot(df, aes(x = Pris,
                   y = Salg,
                   color = Chain,
                   text = paste0("</br>CampaignID: ", CampaignID,
                                 "</br>Chain: ", Chain,
                                 "</br>Kampagnesalg volumen: ", round(Salg),
                                 "</br>Kampagnesalg - gns. pris (stk): ", round(Pris, digits = 2),
                                 "</br>Kampagnesalg stk: ", `Kampagnesalg stk`,
                                 "</br>PromoEndWeek: ", PromoEndWeek,
                                 "</br>Inkluderede subbrands: ", `Kampagne Unik Subbrands`,
                                 "</br>Antal produkter: ", `Product`,
                                 "</br>Stk tilskud: ", `Stk tilskud`
                   )
)) +
  geom_point(size = 3, alpha = 0.9) +
  geom_line(data = df3,
            aes(x = `Kampagnesalg - gns. pris (stk)`,
                y = `Kampagne salg vol`),
            inherit.aes = FALSE) +
  xlim(c(0,45)) +
  scale_y_continuous(expand = c(0, 0)) +
  labs(x = 'Kampagnesalg - gns. pris (stk)', y = "Kampagne salg vol") +
  scale_color_manual(values = c("#118DFF",
                                "#12239E",
                                "#E66C37",
                                "#6B007B",
                                "#E044A7",
                                "#744EC2",
                                "#D9B300",
                                "#D64550",
                                "#197278",
                                "#1aab40",
                                "#15c6f4"),
                     name = NULL);
####################################################

############# Create and save widget ###############
p = ggplotly(g, tooltip = c("text", "Kampagne salg vol", "Kampagnesalg - gns. pris (stk)")) %>%
  layout(plot_bgcolor='#FFFFFF',
         xaxis = list(gridcolor = "#F1F2F3"),
         yaxis = list(gridcolor = "#F1F2F3",
                      gridwidth = 0.1),
         legend = list(orientation = 'h',
                       y = 1.1,
                       font = list(size = 9)),
         hoverlabel = list(align = "left")
  );
internalSaveWidget(p, 'out.html');
####################################################

################ Reduce paddings ###################
ReadFullFileReplaceString('out.html', 'out.html', ',"padding":[0-9]*,', ',"padding":0,')
####################################################
