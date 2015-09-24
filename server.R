library(shiny)
library(reshape2)
library(ggplot2)
shinyServer(
    function(input, output) {
        t <- melt(Titanic)
        t <- dcast(t, Class + Sex + Age ~ Survived)
        t <- transform(t, total = No + Yes) 
        t <- transform(t, rate = Yes / total)

        output$myplot <- renderPlot({
            xvar <- input$xvar
            xvars <- c("Class", "Sex", "Age") 
            xvars <- xvars[-which(xvars == xvar)]
            
            eval(parse(text = paste0("ggplot(t, aes(x = ", input$xvar, ", y = ", input$yvar, ", fill = Class)) +",
                "geom_bar(stat=\"identity\") + facet_wrap(", xvars[1], "~", xvars[2], ") + ylab(\"\")"
            )))
        })
        
    }
)
