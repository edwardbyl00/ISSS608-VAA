pacman::p_load(shiny, tidyverse)

exam <- read_csv('Data/Exam_data.csv')

# print(exam)

# Define UI for application that draws a histogram
# fluidpage allow for resoultion to be scaled accordingly

ui <- fluidPage(
  titlePanel("Pupils Exam Results Dashboard"),
  sidebarLayout(sidebarPanel(
    selectInput(
      inputId = 'variable',
      label = 'Subject:',
      choices = c('English'='ENGLISH',
                  'Maths'='MATHS',
                  'Science'='SCIENCE'),
      selected = 'ENGLISH'),
    sliderInput(
      inputId = 'bins',
      label = 'Number of bins:',
      min = 5,
      max = 20,
      value = 10)
    ),
  mainPanel(
    plotOutput('distplot')
  ))
)


# Define server logic required to draw a histogram
server <- function(input, output){
  output$distplot <- renderPlot({
    ggplot(exam,
           aes_string(x = input$variable)) +
      geom_histogram(bins = input$bins,
                     color = 'black',
                     fill = 'light blue')
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)
