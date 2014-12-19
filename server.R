## change wd first 

library(shiny)

# table <- titanic3[1:10,1:3]
oldfare <- function(faretoday) round(faretoday / (1.57 * 102.72))

# titanic3 <- read.csv("titanic3.csv")
# titanic3 <- titanic3[-1310,]
# titanic3$ticket <- as.character(titanic3$ticket)
# titanic3$tick <- paste0(titanic3$ticket, "Unique")
# for (i in 1:length(titanic3$tick)) {
#         titanic3$num[i] <- length(grep(titanic3$tick[i], titanic3$tick))
# }
# titanic3$fareper <- titanic3$fare/titanic3$num
# titanic3 <- titanic3[is.na(titanic3$age)==F,]
# titanic3 <- titanic3[is.na(titanic3$fare)==F,]
# titanic3 <- titanic3[is.na(titanic3$fare)==0,]
# library(caret)
# library(randomForest)
# titanic3$surv <- as.factor(titanic3$survived)
# set.seed(17)
# modFit2 <- train(surv ~ sex + age + fareper, method = "rf", data = titanic3)

load("modFit2.rf")
library(randomForest)
library(caret)

willsurvive <- function(age, sex = c("male", "female"), fare) {
        tdf <- data.frame(age = age, sex = sex, fareper = fare / (1.57 * 102.72))
        if(predict(modFit2,newdata=tdf)==1) {"Yes!"} else {"No"}
}

shinyServer(
        function(input, output) {
                output$outputsex <- renderPrint({input$inputsex})
                output$outputage <- renderPrint({input$inputage})
                output$outputfare <- renderPrint({input$inputfare})
                output$oldfare <- renderPrint({oldfare(input$inputfare)})
                output$result <- renderPrint({willsurvive(input$inputage, 
                                                          input$inputsex, 
                                                          input$inputfare)})
        }
)