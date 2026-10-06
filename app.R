library(shiny)

# All figures are invented for this demonstration.
departments <- c("Public safety", "Streets & transit", "Parks & recreation", "Libraries", "Administration")
shares <- c(0.35, 0.25, 0.20, 0.10, 0.10)

ui <- fluidPage(
  tags$head(tags$style(HTML("
    body { background: #f4f7fa; color: #203247; }
    .container-fluid { max-width: 1100px; margin: 30px auto; }
    h1 { font-weight: 700; }
    .well { background: white; border-radius: 12px; }
    .demo-note { color: #526577; margin-bottom: 28px; }
  "))),
  titlePanel("City budget explorer"),
  p("An interactive Shiny demonstration. All data are fictional; this is not an actual city budget.",
    class = "demo-note"),
  sidebarLayout(
    sidebarPanel(
      h3("Explore a scenario"),
      sliderInput("budget", "Annual budget ($ millions)",
                  min = 10, max = 100, value = 50, step = 5, pre = "$"),
      helpText("Move the slider to update the chart and table. Department shares stay fixed."),
      downloadButton("download", "Download scenario (CSV)")
    ),
    mainPanel(
      h3(textOutput("summary")),
      plotOutput("allocation", height = "340px"),
      h4("Budget details"),
      tableOutput("details"),
      p("Illustrative shares: public safety 35%, streets & transit 25%, parks & recreation 20%, libraries 10%, administration 10%.",
        class = "demo-note")
    )
  )
)

server <- function(input, output, session) {
  scenario <- reactive({
    data.frame(Department = departments, Share = shares,
               Budget_dollars = input$budget * 1e6 * shares)
  })

  output$summary <- renderText(paste0("Your scenario: $", input$budget, " million"))
  output$allocation <- renderPlot({
    d <- scenario()
    par(mar = c(5, 11, 1, 2), bg = "#f4f7fa", fg = "#203247", las = 1)
    barplot(rev(d$Budget_dollars / 1e6), names.arg = rev(d$Department),
            horiz = TRUE, col = "#287f8e", border = NA,
            xlim = c(0, 35), xlab = "Annual allocation ($ millions)", cex.names = 1)
  }, res = 110)

  output$details <- renderTable({
    d <- scenario()
    data.frame(Department = d$Department,
               Share = paste0(round(d$Share * 100), "%"),
               Allocation = paste0("$", formatC(d$Budget_dollars, format = "f", digits = 0, big.mark = ",")))
  }, striped = TRUE, bordered = FALSE, spacing = "m")

  output$download <- downloadHandler(
    filename = function() paste0("fictional-city-budget-", input$budget, "-million.csv"),
    content = function(file) write.csv(scenario(), file, row.names = FALSE)
  )
}

shinyApp(ui, server)
