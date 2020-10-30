library(shiny)
library(raphael)
library(tibble)
library(dplyr)

data <- mtcars %>% rownames_to_column("names")

ui <- pageWithSidebar(
        headerPanel("Pie Chart"),
        sidebarPanel(
            selectizeInput("names", "Cars", data$names, data$names[1:4], multiple = TRUE)
        ),
        mainPanel(
            raphaelOutput("plot")
        )
)

server <- function(input, output, session) {

      selectedData <- reactive({
            data %>% filter(names %in% input$names)
      })

      output$plot <- renderRaphael({
        df    <- selectedData()
        names <- input$names
        if (!is.null(df) && nrow(df) > 0 && length(names) >= 2) {
            df %>%
              arrange(-hp) %>%
              raphael(x = names, y = hp, type = "pie")
        }
      })
}

shinyApp(ui = ui, server = server)
