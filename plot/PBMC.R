library(ggplot2)
library(gridExtra)

# PBMC-NMI
df <- read.table(header=TRUE, text='
 Methods Methods  NMI
  EL-KNN  EL-KNN   0.486
  EL-LDA  EL-LDA   0.5137
  EL-SVM  EL-SVM   0.5741
  EL-NB   EL-NB    0.5905
  EL-DT   EL-DT    0.6286
  EL-HW   EL-HW    0.5921
  SC3     SC3      0.2565
  CIDR    CIDR     0.3146
  Seurat  Seurat   0.4441
  t-SNE+k-means t-SNE+k-means 0.4607
  SAFE    SAFE     0.254
  SAME    SAME     0.4746
  EC-PGMGR EC-PGMGR 0.5221
')  
df$Methods = factor(df$Methods, levels = c("EL-KNN", "EL-LDA", "EL-SVM", 
                                           "EL-NB","EL-DT", "EL-HW", "SC3", 
                                           "CIDR", "Seurat", "t-SNE+k-means",
                                           "SAFE", "SAME", "EC-PGMGR"))
ggplot(df, aes(x=Methods, y=NMI, fill=Methods), width = 0.35) + 
  geom_col(data = df, position = "dodge") + theme_classic() + 
  ggtitle("PBMC") + 
  geom_text(label = df$NMI, position = position_dodge(0.9), vjust = -0.3)

# PBMC-ARI
df <- read.table(header=TRUE, text='
 Methods Methods  ARI
  EL-KNN  EL-KNN   0.4571
  EL-LDA  EL-LDA   0.479
  EL-SVM  EL-SVM   0.5632
  EL-NB   EL-NB    0.5203
  EL-DT   EL-DT    0.6359
  EL-HW   EL-HW    0.5468
  SC3     SC3      0.0517
  CIDR    CIDR     0.1583
  Seurat  Seurat   0.1951
  t-SNE+k-means t-SNE+k-means 0.2341
  SAFE    SAFE     0.0063
  SAME    SAME     0.3488
  EC-PGMGR EC-PGMGR 0.3672
')

df$Methods = factor(df$Methods, levels = c("EL-KNN", "EL-LDA", "EL-SVM", 
                                           "EL-NB","EL-DT", "EL-HW", "SC3", 
                                           "CIDR", "Seurat", "t-SNE+k-means",
                                           "SAFE", "SAME", "EC-PGMGR"))

ggplot(df, aes(x=Methods, y=ARI, fill=Methods), width = 0.35) + 
  geom_col(data = df, position = "dodge") + theme_classic() + 
  ggtitle("PBMC") + 
  geom_text(label = df$ARI, position = position_dodge(0.9), vjust = -0.3)
