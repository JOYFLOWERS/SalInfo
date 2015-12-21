#setwd("/Users/joy/Documents/Coursera/SalInfoOther")
library("shiny")
shinyUI(pageWithSidebar(
        headerPanel("2013 California County Government's Salaries"),
        sidebarPanel(
                radioButtons(inputId="exact", label="Do you want an exact match (case sensitive) or partial search?", 
                           #  choices=list("Exact Title Match" = 1,"Partial Word Search" = 0)), 
                           choices=list("Partial Word Search" = 0,"Exact Title Match" = 1)), 
                h3('Enter your Search'),
                textInput(inputId="POSITION",label="Job Title")
    #            actionButton("goButton","Go!") 
        ),
        mainPanel(
                HTML('<p><b>Prior to the first search, the data file may take up to a couple of minutes to download.</b>
                   See your results below. This is a <b>salary benchmarking tool</b> that lists <b>highest, lowest and 
                   average actual salaries</b> for a specified position (or partial search). This application lists salary information 
                   for employees of all <b>California County governments</b>. It uses the most current public data, downloading the raw 
                   export data from <a href="http://publicpay.ca.gov">publicpay.ca.gov</a>. 
                   This information is consistent with what is displayed in <a href="http://www.TransparentCalifornia.org">
                   TransparentCalifornia.org</a> but this application lists additional information such as county department, 
                   total pay and total retirement/health benefit contributions and does the calculations for you. To use the 
                   application, just enter a job title such as “Human Resources Director” as an exact match, or something such as 
                   “director” as a partial search. The session is made to be interactive so you can just keep typing new positions 
                   into the search until you are done. This tool will give some insight into California County government’s pay structures. 
                   Compare away! Notes: The data was scrubbed attempting to remove anyone who worked just a partial year (by comparing 
                   the earned salary to the minimum salary range). Also anyone with a zero salary was eliminated. 
                   These reduced the number of records from 353,453 to 233,623. The employee names were not available and 
                   therefore are not displayed.</p>'),
                h4('The actual salaries in U.S. dollars for this search are:'),
                textOutput('POSITION'),
                 tableOutput("results")
  #              textOutput('Go')
        )
))

