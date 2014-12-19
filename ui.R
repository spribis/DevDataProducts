## change wd first - setwd("~/Coursera/LastCourse/test1")
library(shiny)
shinyUI(navbarPage("Would You Survive the Titanic Disaster?",
                   footer = "This page was created by S. Pribis for the Developing Data Products course in the JHU Data Science Specialization offered through Coursera",
                   tabPanel("About",
                                    h4("Introduction"),
                                    p("Ever wonder what it would have been like if YOU were on the Titanic? This app was designed with the intent to make the tragedy and the lives of the passengers aboard the Titanic more personal. You can find the data used for this app at the the website for the Vanderbilt University Department of Biostatistics",
                                        a("biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/titanic3.xls")),
                                    h4("Using the app"),
                                    p("To begin using the app, click on the 'Predict' button on the main menu bar. There you will be able to enter some attributes about yourself, and select a ticket price. When you are ready, click 'Submit' and the results will be displayed, including the information you entered, the price in 1912 British pounds (converted from 2014 US dollars), and a prediction of whether or not you would have survived."),
                                    h4("Assumptions"),
                                    p("The model used is a random forest model, training on the entire data set, which proved to be 81% accurate. Only the age, sex, and fareper variables were used. Other variables were excluded as there is not a direct connection between someone entering that informaion now and the passenger on the Titanic back in 1912. The num variable was created to determine the number of passengers on that ticket, which was used to determine the fare per passenger, the fareper variable.")
                            ),
                   tabPanel("Predict",
                            # headerPanel("Hi nuggy!"),
                            sidebarPanel(
                                   h3('Inputs'),
                                   p("Enter the following information about yourself:"),
                                   radioButtons("inputsex", label = h4("Sex"),
                                                choices = list("Female" = "female", "Male" = "male"),
                                                selected = "female"),
                                   sliderInput("inputage", label = h4("Age"),
                                               min = 0, max = 80, value = 25),
                                   p("Now enter the price in US dollars that you would pay to voyage across the Atlantic. Note: Average price for 1st, 2nd, and 3rd class were roughly $5000, $2000, and $1200, respectively."),
                                   sliderInput("inputfare", label = h4("Ticket Price (US$)"),
                                               min = 1000, max = 7000, value = 2000, step = 100),
                                   submitButton('Submit')
                           ),
                           mainPanel(
                                   h3('Results'),
                                   h4('For sex, you selected'),
                                   verbatimTextOutput("outputsex"),
                                   h4('For age, you entered'),
                                   verbatimTextOutput("outputage"),
                                   h4('For ticket price, you chose'),
                                   verbatimTextOutput("outputfare"),
                                   h4('Which in 1912 British pounds would be'),
                                   verbatimTextOutput("oldfare"),
                                   h4('Would you have survived?'),
                                   verbatimTextOutput("result")
                           )
                   )
))