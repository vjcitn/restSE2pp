
 library(SummarizedExperiment)
 library(BiocOncoTK)
 library(ggplot2)
 cdar = BiocOncoTK::darmGBMcls
 ind = match("PTPRC", rowData(cdar)$symbol)
 var = gsub("selection: ", "", 
        cdar$characteristics_ch1.8)
 vals = log10(as.numeric(assay(cdar[ind,])+1))
 ddd = data.frame(log10norm=vals, pan=var)
 ggplot(ddd, aes(x=log10norm, colour=pan)) + 
   geom_density() + ylim(0,1) + xlab("log10 CD45+1")

