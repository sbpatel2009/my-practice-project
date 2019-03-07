library(readxl)
library(VennDiagram)

#######################################################
##               READ IN NGS PANELS                  ##
#######################################################

#load StrataNGS version 3 panel
StrataNGSv3 = read_xlsx(path = "Gene lists.xlsx", sheet = "StrataNGSv3")
StrataNGSv3$StrataNGSv3 = "Yes"

#load Tempus xT gene panel
xT = read_xlsx(path = "Gene lists.xlsx", sheet = "xT")
xT = xT[ , 1]
xT$xT = "Yes"

#load Tempus xO gene panel
xO = read_xlsx(path = "Gene lists.xlsx", sheet = "xO")
xO$xO = "Yes"

#load Illumina TSO 500 gene panel
TSO500 = read_xlsx(path = "Gene lists.xlsx", sheet = "TSO500")
TSO500 = TSO500[TSO500$`Small variants` == "Yes", 1]
TSO500$TSO500 = "Yes"

#load Illumina FoundationOne gene panel
FoundationOne = read_xlsx(path = "Gene lists.xlsx", sheet = "F_One")
FoundationOne$FoundationOne = "Yes"

#load MSK-IMPACT gene panel
MSK = read_xlsx(path = "Gene lists.xlsx", sheet = "MSK")
MSK$MSK = "Yes"

venn.diagram(x = list(StrataNGSv3 = StrataNGSv3$Gene.Symbol, TSO500 = TSO500$Gene.Symbol, MSK = MSK$Gene.Symbol, FoundationOne = FoundationOne$Gene.Symbol), filename = "Pic.png")

#Merge panels
gene_list = merge(x = StrataNGSv3, y = xT, by = "Gene.Symbol", all = TRUE)
gene_list = merge(x = gene_list, y = xO, by = "Gene.Symbol", all = TRUE)
gene_list = merge(x = gene_list, y = TSO500, by = "Gene.Symbol", all = TRUE)
gene_list = merge(x = gene_list, y = FoundationOne, by = "Gene.Symbol", all = TRUE)
gene_list = merge(x = gene_list, y = MSK, by = "Gene.Symbol", all = TRUE)

#save merged file
write.csv(x = gene_list, file = "panel_comparison.csv")


#######################################################
##               READ IN CANCER CENSUS GENES         ##
#######################################################

#load Cacer Gene Census gene list
CancerGeneCensus = read_xlsx(path = "Gene lists.xlsx", sheet = "CancerGeneCensus")
CancerGeneCensus$CancerGeneCensus = "Yes"

#load Cold Spring Harbor gene list
ColdSpringHarbor = read_xlsx(path = "Gene lists.xlsx", sheet = "ColdSpringHarbor")
ColdSpringHarbor$ColdSpringHarbor = "Yes"

#load Vogelstein gene list
Vogelstein = read_xlsx(path = "Gene lists.xlsx", sheet = "Vogelstein")
Vogelstein$Vogelstein = "Yes"

#load allOnco gene list
allOnco = read_xlsx(path = "Gene lists.xlsx", sheet = "allOnco")
allOnco$allOnco = "Yes"

#load CCGD list
CCGD = read_xlsx(path = "Gene lists.xlsx", sheet = "CCGD")
CCGD$CCGD = "Yes"
View(CCGD)


#Merge lists
gene_list = merge(x = CancerGeneCensus, y = ColdSpringHarbor, by = "Gene.Symbol", all = TRUE)
gene_list = merge(x = gene_list, y = Vogelstein, by = "Gene.Symbol", all = TRUE)
gene_list = merge(x = gene_list, y = allOnco, by = "Gene.Symbol", all = TRUE)
gene_list = merge(x = gene_list, y = CCGD, by = "Gene.Symbol", all = TRUE)
gene_list = merge(x = gene_list, y = StrataNGSv3, by = "Gene.Symbol", all = TRUE)

#save merged file
write.csv(x = gene_list, file = "panel_comparison.csv")

