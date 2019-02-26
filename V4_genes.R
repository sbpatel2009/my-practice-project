library(readxl)

#load StrataNGS version 3 gene list
StrataNGSv3 = read_xlsx(path = "Gene lists.xlsx", sheet = "StrataNGSv3")
StrataNGSv3$StrataNGSv3 = "Yes"
View(StrataNGSv3)

#load Tempus xT gene list
xT = read_xlsx(path = "Gene lists.xlsx", sheet = "xT")
xT$xT = "Yes"
View(xT)

#load Tempus xO gene list
xO = read_xlsx(path = "Gene lists.xlsx", sheet = "xO")
xO$xO = "Yes"
View(xO)

#load Illumina TSO 500 gene list
TSO500 = read_xlsx(path = "Gene lists.xlsx", sheet = "TSO500")
TSO500$TSO500 = "Yes"
View(TSO500)

#load Illumina FoundationOne gene list
FoundationOne = read_xlsx(path = "Gene lists.xlsx", sheet = "FoundationOne")
FoundationOne$FoundationOne = "Yes"
View(FoundationOne)

#load MSK-IMPACT gene list
MSK = read_xlsx(path = "Gene lists.xlsx", sheet = "MSK")
MSK$MSK = "Yes"
View(MSK)
