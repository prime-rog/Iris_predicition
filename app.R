# Import libraries
library(shiny)
library(data.table)
library(randomForest)
library(shinythemes)
library(ggplot2)
library(ggthemes)

# Read in the RF model
model <- readRDS("model.rds")

# Training set
TrainSet <- read.csv("training.csv", header = TRUE)
TrainSet <- TrainSet[,-1]


####################################
# User interface                   #
####################################

ui <- fluidPage(theme = shinytheme('slate'),
                
                navbarPage(
        
                "Iris Flower Prediciton",
        
        # Input values
        tabPanel("Plots",  verticalLayout(
                column(width =12,
                        plotOutput(outputId = "pwpl",)
                ),
                column(width =12,
                       h3("1.Scatter Plot -- Petal Length vs Petal Width")),
                column(width =12,
                       plotOutput(outputId = "swsl",)
                ),
                column(width =12,
                       h3("2.Scatter Plot -- Sepal Length vs Sepal Width"))
        )),
        tabPanel("Model _ Pred",
                 sidebarPanel(h4(
                         HTML("<h3>Input parameters</h4>"),
                         sliderInput("Sepal.Length", label = "Sepal Length", value = 5.0,
                                     min = min(TrainSet$Sepal.Length),
                                     max = max(TrainSet$Sepal.Length)
                         ),
                         sliderInput("Sepal.Width", label = "Sepal Width", value = 3.6,
                                     min = min(TrainSet$Sepal.Width),
                                     max = max(TrainSet$Sepal.Width)),
                         sliderInput("Petal.Length", label = "Petal Length", value = 1.4,
                                     min = min(TrainSet$Petal.Length),
                                     max = max(TrainSet$Petal.Length)),
                         sliderInput("Petal.Width", label = "Petal Width", value = 0.2,
                                     min = min(TrainSet$Petal.Width),
                                     max = max(TrainSet$Petal.Width)),
                         
                         actionButton("submitbutton", "Submit", class = "btn btn-primary")
                 )
                 ),
                 
                 mainPanel(
                         h3(
                         tags$label(h3('Status/Output')), # Status/Output Text Box
                         verbatimTextOutput('contents'),
                         tableOutput('tabledata') # Prediction results table
                         )
                 )
                
                ),
        
        
        
        tabPanel("About", h3("Created by AMAN SINGH") )

        
)
)


####################################
# Server                           #
####################################

server<- function(input, output, session) {
        
        # Input Data
        datasetInput <- reactive({  
                
                df <- data.frame(
                        Name = c("Sepal Length",
                                 "Sepal Width",
                                 "Petal Length",
                                 "Petal Width"),
                        Value = as.character(c(input$Sepal.Length,
                                               input$Sepal.Width,
                                               input$Petal.Length,
                                               input$Petal.Width)),
                        stringsAsFactors = FALSE)
                
                Species <- 0
                df <- rbind(df, Species)
                input <- transpose(df)
                write.table(input,"input.csv", sep=",", quote = FALSE, row.names = FALSE, col.names = FALSE)
                
                test <- read.csv(paste("input", ".csv", sep=""), header = TRUE)
                
                Output <- data.frame(Prediction=predict(model,test), round(predict(model,test,type="prob"), 3))
                print(Output)
                
        })
        
        # Status/Output Text Box
        output$contents <- renderPrint({
                if (input$submitbutton>0) { 
                        isolate("Calculation complete.") 
                } else {
                        return("Server is ready for calculation.")
                }
        })
        
        # Prediction results table
        output$tabledata <- renderTable({
                if (input$submitbutton>0) { 
                        isolate(datasetInput()) 
                } 
        })
        
        output$pwpl <- renderPlot({
                
                ggplot(iris , aes(x = Petal.Length , y = Petal.Width , col = Species))+geom_point(size=3)+theme_bw()
                
        })
        
        output$swsl <- renderPlot({
                
                ggplot(iris , aes(x = Sepal.Length , y = Sepal.Width , col = Species))+geom_point(size = 3)+theme_bw()
                
        })
        
        
}

####################################
# Create the shiny app             #
####################################
shinyApp(ui = ui, server = server)
