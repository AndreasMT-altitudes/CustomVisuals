source('./r_files/flatten_HTML.r')

############### Library Declarations ###############
libraryRequireInstall("ggplot2");
libraryRequireInstall("plotly");
libraryRequireInstall("shiny")
####################################################
ui <- fluidPage(
  sliderInput(inputId = "user_input",
              label = "User Input", 
              value = 10,
              min = 0, max = 100,
              step = 5,
              # Added animation
              animate = animationOptions(
                interval = 1000,
                loop = TRUE,
                playButton = NULL,
                pauseButton = NULL
              )
  )
  
)

server <- function(input, output, session) {}

g2 = shinyApp(ui, server)

################### Actual code ####################
g = qplot(`Petal.Length`, data = iris, fill = `Species`, main = Sys.time());
####################################################

############# Create and save widget ###############

internalSaveWidget(g2, 'out.html');
####################################################

################ Reduce paddings ###################
ReadFullFileReplaceString('out.html', 'out.html', ',"padding":[0-9]*,', ',"padding":0,')
####################################################
