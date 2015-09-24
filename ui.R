library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Titanic Survivers' Data"),
    sidebarPanel(
        p("Titanic is perhaps the most famous ship in the world for its tragic accident. 
          The number of survivers was different for their gender, the class of their rooms and age. 
          The graph on the right shows the effect of those parameters on survival rate."),
        hr(),
        p("Use [X axis] to select a variable in x axis. Use [Y axis] to select a variable in y axis."),
        radioButtons("xvar", "X axis:",
                     c("Class" = "Class",
                       "Sex" = "Sex",
                       "Age" = "Age"),
                     selected = "Class"),
        
        radioButtons("yvar", "Y axis:",
                     c("Survival Rate" = "rate",
                       "Number of Survivers" = "Yes",
                       "Number of Casualties" = "No"),
                     selected = "rate"),
        
        p(em("Note : No child in crew members"))

    ),
    
    mainPanel(
        plotOutput('myplot')

    )
))
