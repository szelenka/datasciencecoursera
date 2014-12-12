library(car)
library(ggplot2)
library(grid)
library(xtable)
data(mtcars)
mtcars$am = factor(mtcars$am)
levels(mtcars$am) = c("automatic","manual")
formula = mpg~cyl+wt+disp
s = sd(mtcars$mpg)
n = nrow(mtcars)
#err = qt(0.975,df=n-1)*(s/sqrt(n))
fit = lm(formula,mtcars)
f.stat = summary(fit)$fstatistic
p.value = pf(f.stat[1],f.stat[2],f.stat[3],lower.tail=F)

# method to update the error window for confidence intervals
predict_err = function(ci) {
  alpha = 1-ci
  value = 1-alpha/2
  err = qt(value,df=n-1)*(s/sqrt(n))
  err
}
# method to produce prediction 
predict_mpg = function(cyl,disp,wt,ci) {
  err = predict_err(ci)
  center = predict(fit,data.frame(cyl=as.numeric(cyl),disp=disp,wt=wt/1000))[[1]]
  left = center - err
  right = center + err
  data.frame(low=left,mean=center,high=right,p.value=p.value)
}

shinyServer(
  function(input,output) {
    # gets executed on each page load!!
    output$userSelection = renderUI({
      HTML(paste('You selected a vehicle from 1974 with',tags$b(input$cyl),'cylinders,',tags$b(input$disp),'displacement (cu) and',tags$b(input$wt),'(lbs)'))
    })
    output$predictedTable = renderTable({predict_mpg(input$cyl,input$disp,input$wt,input$ci)})
  }
)