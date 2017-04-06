#minimal-shiny-query-strings

library(shiny)

ui <- fluidPage(
  selectInput("crust", "Crust", c("Traditional", "Thin", "Deep Dish")),
  checkboxInput("cheese", "Cheese", TRUE),
  selectInput("toppings", "Toppings", c("Pineapple", "Chicken", "Basil"), multiple = TRUE)
)

server <- function(input, output, session) {
  observe({
    query <- parseQueryString(session$clientData$url_search)
    if (!is.null(query[['crust']])) {
      updateTextInput(session, "crust", value = query[['crust']])
    }
    if (!is.null(query[['cheese']])) {
      updateNumericInput(session, "cheese", value = query[['cheese']])
    }
  })
}

shinyApp(ui, server)