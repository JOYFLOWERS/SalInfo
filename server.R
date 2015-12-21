# This program creates a Shiny app that calculates min, max, and mean salaries over all California County jobs. 
# December 16, 2015   Joy Flowers
#setwd("/Users/joy/Documents/Coursera/SalInfo")
library("shiny"); library("xtable"); library("data.table"); library("dplyr")
# The main website for this data is at http://publicpay.ca.gov then go to Download All Data. Choose 2013 Counties.
options(warn=-1)
fileUrl <- "http://publicpay.ca.gov/Reports/RawExport.aspx?file=2013_County.zip"
cp2 <- download.file(fileUrl,destfile="2013_County.zip",method="curl",mode="wb")
dateDownloaded <- date() 
unzip("2013_County.zip")
cat("*** R E A D Y   N O W ***")
salary <- read.csv("2013_County.csv",header=TRUE,skip=4)
## Eliminates records where pay is less than minimum allowed (not full year salary-due to new hire or term) or zero
sal <- subset(salary,Regular.Pay >= Min.Classification.Salary & Max.Classification.Salary > 0) 
setnames(sal, old = c('Department...Subdivision','Entity.Name','Total.Retirement.and.Health.Cost',
                         'Entity.Population','Total.Wages','Pension.Formula'), new = c('Dept','County',
                         'Tot.Ret.Hlth','Population','Tot.Wages','Pens.Formula'))   
#exact <- 0  # exact match = 1 and partial search = 0

shinyServer(
        function(input, output) {
                output$results <- renderTable({
                        if (input$exact==0) { salsub <-
                                sal %>%
                                filter(grepl(input$POSITION,Position,ignore.case=TRUE))
                        }
                        else {
                                salsub <-
                                        sal %>%
                                        filter(Position == input$POSITION)
                                        
                        }
                        ind1 <- as.data.frame(salsub[which.max(salsub$Tot.Wages), ]); ind1 <- mutate(ind1,Range="Highest")
                        ind2 <- as.data.frame(salsub[which.min(salsub$Tot.Wages), ]); ind2 <- mutate(ind2,Range="Lowest")
                        ind3 <- as.data.frame(salsub[which.min(abs(salsub$Tot.Wages - mean(salsub$Tot.Wages))),]); ind3 <- mutate(ind3,Range="Closest to the Mean")
                        ind4 <- rbind(ind1,ind3); ind5 <- rbind(ind4,ind2)
                        ind <- subset(ind5,select=(c(Range,Position,County,Dept,Tot.Wages,Tot.Ret.Hlth,Population,Pens.Formula))) 
                        #ind$Tot.Wages.<-prettyNum(ind$Tot.Wages, big.mark = ",")
                        #ind$Tot.Ret.Hlth.<-prettyNum(ind$Tot.Ret.Hlth, big.mark = ",") 
                        #ind$Population.<-prettyNum(ind$Population, big.mark = ",")
                        #cat(ind$Tot.Wages.,ind$Tot.Ret.Hlth.,ind$Population.)
                        #ind[,c(1:4,9,10,11,8)]
                        ind
                })                

  #              output$Go <- renderText({if(input$goButton>=1) {
  #                      output$sal <- renderText({c(as.character(ind$Position[1]),ind$Tot.Wages[1],as.character(ind$Position[2]),ind$Tot.Wages[2])})

        }
)



