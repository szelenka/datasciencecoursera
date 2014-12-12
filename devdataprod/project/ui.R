shinyUI(fluidPage(
  title = "1974 Miles Per Gallon (MPG) Predictor",
  withMathJax(),
  h3("1974 Miles Per Gallon (MPG) Predictor"),
  h3("Documentation"),
  p("This is a ShinyApp for Developing Data Products course on Coursera being offered by Johns Hopkins Boolmberg School of Public Health."),
  p("To use this Data Product, please select the desired Cylinders, Displacement, Weight, and Confidence Interval of a vehicle you would like to predict Miles Per Gallon (MPG) if a vehicle with those specifications existed in the year 1974."),
  p(HTML("The prediction function fits a linear model using the <b>mtcars</b> dataset which was extracted from the 1974 Motor Trend US magazine, for 32 automobiles (1973–74 models). Using the formula <b>mpg ~ cy+wt+disp</b>.")),
  hr(),
  fluidRow(
    column(3,
      selectInput("cyl", label=withMathJax("$$\\text{Number of cylinders}$$"), choices = c(4,6,8)),
      numericInput("disp", label=withMathJax("$$\\text{Displacement (in)}^3$$"), 211.81, min=70,max=500,step=0.01),
      numericInput("wt", label=withMathJax("$$\\text{Weight (lbs)}$$"), 4346, min=1000,max=7000,step=1),
      numericInput("ci", label=withMathJax("$$\\text{Confidence Interval}$$"), 0.95, min=0.01,max=0.99,step=0.01)
    ),
    column(1),
    column(8,
      h3("Your Selection"),
      p(uiOutput("userSelection")),
      p("Based on this selection, a vehicle from 1974 is predicted to have the following MPG:"),
      tableOutput('predictedTable')
    )
  ),
  hr(),h4("Warning"),
  p("Using this to predict MPG on current generation vehicles may result in unexpected results. This is because the training set was taken from the year 1974, and the resutls should only be viewed as a historical comparison.")
))