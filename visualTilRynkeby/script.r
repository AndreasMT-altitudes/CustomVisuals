source('./r_files/flatten_HTML.r')

############### Library Declarations ###############
suppressWarnings(suppressMessages(libraryRequireInstall("ggplot2")));
suppressWarnings(suppressMessages(libraryRequireInstall("plotly")))
suppressWarnings(suppressMessages(libraryRequireInstall("tidyverse")))
####################################################
################### Actual code ####################
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
  mutate(Markedsfoeringstilskud = replace_na(0))

model = lm(Pris ~ Salg, data = df);

df3 = data.frame('Kampagne salg vol' = numeric(10000), "Kampagnesalg - gns. pris (stk)" = numeric(10000), stringsAsFactors = FALSE);

for (i in 1:length(df3$Kampagne.salg.vol))
{
  
  df3[i,1] = i*15
  df3[i,2] = df3[i,1] * model$coefficients[2] + model$coefficients[1]
};

df3 = df3 %>% 
  rename("Kampagne salg vol" = Kampagne.salg.vol) %>% 
  rename("Kampagnesalg - gns. pris (stk)" = Kampagnesalg...gns..pris..stk.) %>% 
  mutate("Kampagnesalg - gns. pris (stk)" = round(`Kampagnesalg - gns. pris (stk)`, digits = 2));

ticks = if_else(max(df$Salg) > 10000, round(max(df$Salg), digits = -4), round(max(df$Salg), digits = -3))

g = ggplot(df, aes(x = Salg,
                   y = Pris,
                   color = Chain,
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
)) +
  geom_point(size = 3, alpha = 0.9) +
  geom_line(data = df3,
            aes(x = `Kampagne salg vol`,
                y = `Kampagnesalg - gns. pris (stk)`),
            inherit.aes = FALSE) +
  ylim(c(0, max(df$Pris)*1.2)) +
  scale_x_continuous(expand = c(0, 0)) +
  labs(x = 'Kampagne salg vol', y = "Kampagnesalg - gns. pris (stk)") +
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
         xaxis = list(gridcolor = "#F1F2F3",
                      ticktext=list(ticks/4,
                                    ticks/4*2, 
                                    ticks/4*3, 
                                    ticks/4*4),
                      tickvals=list(ticks/4, 
                                    ticks/4*2,
                                    ticks/4*3, 
                                    ticks/4*4),
                      range = list(0, max(df$Salg)*1.1)),
         yaxis = list(gridcolor = "#F1F2F3",
                      gridwidth = 0.1),
         legend = list(orientation = 'h',
                       y = 1,
                       font = list(size = 9)),
         hoverlabel = list(align = "left")
  );
internalSaveWidget(p, 'out.html');
####################################################

################ Reduce paddings ###################
ReadFullFileReplaceString('out.html', 'out.html', ',"padding":[0-9]*,', ',"padding":0,')
####################################################
