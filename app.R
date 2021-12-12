#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
ui <- fluidPage(
    titlePanel("Quadratic Function Visualizer"),
    sidebarLayout(
        sidebarPanel(
            
            sliderInput("xm",
                        "x mean",
                        min = -10,
                        max = 10,
                        value = 0,
                        step=0.01),
            sliderInput("xsd",
                        "x standard deviation",
                        min = -10,
                        max = 10,
                        value = 1,
                        step=0.01),
            sliderInput("ysd",
                        "error",
                        min = -10,
                        max = 10,
                        value = 1,
                        step=0.01),
            sliderInput("int",
                        "intercept coefficient",
                        min = -10,
                        max = 10,
                        value = 0,
                        step=0.01),
            sliderInput("x",
                        "x coefficient",
                        min = -10,
                        max = 10,
                        value = 0,
                        step = 0.01),
            sliderInput("x2",
                        "x^2 coefficient",
                        min = -10,
                        max = 10,
                        value = 0,
                        step = 0.01)
        ),
        mainPanel(
           plotOutput("distPlot")
        )
    )
)
server <- function(input, output) {
    output$distPlot <- renderPlot({
        x<-rnorm(1000,input$xm,input$xsd)
        y<-input$int+(x*input$x)+((x^2)*input$x2)+rnorm(1000,0,input$ysd)
        plot(y~x)
    })
}
shinyApp(ui = ui, server = server)
