# Salary Benchmarking Tool 
This assignment consists of a web application using Shiny from RStudio and a presentation containing a pitch explaining the selling features of the application.
<p>
                   This Shiny app is a <b>salary benchmarking tool</b> that lists <b>highest, lowest and 
                   average actual salaries</b> for a specified position (or partial word search). This application lists 
                   salary information for employees of all <b>California County governments</b>. It uses the most current (2013)
                   public data, downloading the raw export data from <a href="http://publicpay.ca.gov">publicpay.ca.gov</a>. 
                   This information is consistent with what is displayed in <a href="http://www.TransparentCalifornia.org">
                   TransparentCalifornia.org</a> but this application lists additional information such as county department, 
                   total pay and total retirement/health benefit contributions and does the calculations for the user. To use the 
                   application, the user will just enter a job title such as “Human Resources Director” as an exact match, or something  
                   such as “director” as a partial word search. The session is made to be interactive so the user can just keep typing  
                   new positions into the Search without even having to hit enter into the search until done. This tool will give some 
                   insight into California County government’s pay structures. Compare away! <b>Prior to the first search, the data file
                   may take up to a couple of minutes to download as it is coming live from the Internet.</b> 
                   Results are shown below the instructions. /nNotes: The data was scrubbed attempting to remove anyone who worked 
                   just a partial year (by comparing the earned salary to the minimum salary range). Also anyone with a zero 
                   salary was eliminated. These reduced the number of records from 353,453 to 233,623. The employee names 
                   were not available and therefore are not displayed. /nThe Shiny application can be run at 
                   <a href="https://joyflowers.shinyapps.io/SalInfo">https://joyflowers.shinyapps.io/SalInfo</a>.
                   /nThe presentation lists key features of the application. It can be run at  
                   <a href="http://joyflowers.github.io/SalInfo/SalInfo.html#/">http://joyflowers.github.io/SalInfo/SalInfo.html#/</a>.
                   The presentation includes reading from a summary file. The code to generate this file can be found in an R script on 
                   github called maxsal. This file (Overall) was created so the user would not need to wait while viewing the 
                   presentation for the data. </p>
                   
                   
