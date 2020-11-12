#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)

# Define UI for application that draws a histogram
ui <- fluidPage(theme = shinytheme("flatly"),

    # Application title
    titlePanel("SinCosApp"),

    # Sidebars with a slider input for value of angular frequency
    sidebarLayout(
        sidebarPanel(
            sliderInput("n",
                        "Angular frequency for sin function:",
                        min = 1,
                        max = 20,
                        value = 1,
                        step = 1),

            sliderInput("m",
                        "Angular frequency for cos function:",
                        min = 1,
                        max = 20,
                        value = 1,
                        step = 1)
        ),

        # Show a plot of the generated plot
        mainPanel(
           plotOutput("SinCosPlot")
        )
    )
)

# Define server logic required to draw a plot
server <- function(input, output) {

    output$SinCosPlot <- renderPlot({
        # generate sin & cos function
        t <- seq(0, 25, 0.01)
        n <- input$n
        m <- input$m
        var1 <- sin(n*t)
        var2 <- cos(m*t)

        # draw the plot with the specified values of angular frequency
        plot(var1, var2, type = "l", lwd = 1.5, col = "violet",
             xlab = "sin", ylab = "cos")
    })
}

# Run the application 
shinyApp(ui = ui, server = server, enableBookmarking = "url")
