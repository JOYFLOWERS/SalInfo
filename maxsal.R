fileUrl <- "http://publicpay.ca.gov/Reports/RawExport.aspx?file=2013_County.zip"
cp2a <- download.file(fileUrl,destfile="2013_County.zip",method="curl",mode="wb")
dateDownloaded <- date() 
unzip("2013_County.zip")
salary1 <- read.csv("2013_County.csv",header=TRUE,skip=4)
## Eliminates records where pay is less than minimum allowed (not full year salary-due to new hire or term) or zero
sal1 <- subset(salary1,Regular.Pay >= Min.Classification.Salary & Max.Classification.Salary > 0) 
setnames(sal1, old = c('Department...Subdivision','Entity.Name','Total.Retirement.and.Health.Cost',
                      'Entity.Population','Total.Wages','Pension.Formula'), new = c('Dept','County',
                      'Tot.Ret.Hlth','Population','Tot.Wages','Pens.Formula'))  
ind1a <- as.data.frame(sal1[which.max(sal1$Tot.Wages), ]); ind1a <- mutate(ind1a,Range="Highest")
ind2a <- as.data.frame(sal1[which.min(sal1$Tot.Wages), ]); ind2a <- mutate(ind2a,Range="Lowest")
ind3a <- as.data.frame(sal1[which.min(abs(sal1$Tot.Wages - mean(sal1$Tot.Wages))),]); ind3a <- mutate(ind3a,Range="Closest to the Mean")
ind4a <- rbind(ind1a,ind3a); ind5a <- rbind(ind4a,ind2a)
ind <- subset(ind5a,select=(c(Range,Position,County,Dept,Tot.Wages,Tot.Ret.Hlth,Population,Pens.Formula))) 
ind$Tot.Wages<-prettyNum(ind$Tot.Wages, big.mark = ","); ind$Tot.Wages <- paste('$',OverallSal$Tot.Wages)
write.table(ind,file="OverallSal.txt",row.names=FALSE)
OverallSal <- read.table(file="OverallSal.txt",header=TRUE)