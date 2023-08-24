library(shiny)
library(DT)

ui <- fluidPage(
  titlePanel("Nonparametric Statistics Techniques"),
  
  sidebarLayout(
    sidebarPanel(
      radioButtons('dataSource', 'Data Source', c('Upload CSV File', 'Use Built-in Data')),
      conditionalPanel(condition = "input.dataSource == 'Upload CSV File'",
                       fileInput('file1', 'Choose CSV File', accept=c('.csv'))),
      conditionalPanel(condition = "input.dataSource == 'Use Built-in Data'",
                       selectInput('dataSet', 'Choose a Dataset:', choices = c('mtcars'))),
      radioButtons('test', 'Choose Test', c('Wilcoxon Rank Sum', 'Kruskal-Wallis', 'Spearman\'s Rank Correlation')),
      uiOutput('var_select')
    ),
    
    mainPanel(
      DTOutput('dataView'),
      verbatimTextOutput("result")
    )
  )
)

server <- function(input, output) {
  
  data <- reactive({
    if(input$dataSource == 'Upload CSV File') {
      file1 <- input$file1
      if(is.null(file1)){return(NULL)}
      read.csv(file1$datapath)
    } else if(input$dataSource == 'Use Built-in Data') {
      switch(input$dataSet,
             'mtcars' = mtcars)
    }
  })
  
  output$dataView <- renderDT({
    data()
  })
  
  output$var_select <- renderUI({
    if(is.null(data())) return(NULL)
    
    switch(input$test,
           'Wilcoxon Rank Sum' = list(selectInput('var1', 'Variable 1', names(data())),
                                      selectInput('var2', 'Variable 2', names(data()))),
           'Kruskal-Wallis' = list(selectInput('var1', 'Numeric Variable', names(data())),
                                   selectInput('var2', 'Grouping Variable', names(data())))
           ,
           'Spearman\'s Rank Correlation' = list(selectInput('var1', 'Variable 1', names(data())),
                                                 selectInput('var2', 'Variable 2', names(data())))
    )
  })
  
  output$result <- renderPrint({
    if(is.null(data())) return(NULL)
    
    switch(input$test,
           'Wilcoxon Rank Sum' = print(wilcox.test(data()[[input$var1]], data()[[input$var2]])),
           'Kruskal-Wallis' = print(kruskal.test(data()[[input$var1]] ~ data()[[input$var2]])),
           'Spearman\'s Rank Correlation' = print(cor.test(data()[[input$var1]], data()[[input$var2]], method = "spearman"))
    )
  })
}

shinyApp(ui = ui, server = server)
