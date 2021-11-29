library(ggplot2)
library(gridExtra)

# Baron-human1-NMI
df <- read.table(header=TRUE, text='
 Methods Methods  NMI
  EL-KNN  EL-KNN   0.8801
  EL-LDA  EL-LDA   0.7713
  EL-SVM  EL-SVM   0.9252
  EL-NB   EL-NB    0.9207
  EL-DT   EL-DT    0.909
  EL-HW   EL-HW    0.9024
  SC3     SC3      0.7157
  CIDR    CIDR     0.3541
  Seurat  Seurat   0.5408
  t-SNE+k-means t-SNE+k-means 0.7741
  SAFE    SAFE     0.6636
  SAME    SAME     0.8103
  EC-PGMGR EC-PGMGR 0.825
')  
df$Methods = factor(df$Methods, levels = c("EL-KNN", "EL-LDA", "EL-SVM", 
                                           "EL-NB","EL-DT", "EL-HW", "SC3", 
                                           "CIDR", "Seurat", "t-SNE+k-means",
                                           "SAFE", "SAME", "EC-PGMGR"))
ggplot(df, aes(x=Methods, y=NMI, fill=Methods), width = 0.35) + 
  geom_col(data = df, position = "dodge") + theme_classic() + 
  ggtitle("Baron-human1") + 
  geom_text(label = df$NMI, position = position_dodge(0.9), vjust = -0.3)

# Baron-human1-ARI
df <- read.table(header=TRUE, text='
 Methods Methods  ARI
  EL-KNN  EL-KNN   0.9279
  EL-LDA  EL-LDA   0.7614
  EL-SVM  EL-SVM   0.9497
  EL-NB   EL-NB    0.9494
  EL-DT   EL-DT    0.9458
  EL-HW   EL-HW    0.9302
  SC3     SC3      0.3781
  CIDR    CIDR     0.238
  Seurat  Seurat   0.2654
  t-SNE+k-means t-SNE+k-means 0.5427
  SAFE    SAFE     0.281
  SAME    SAME     0.63
  EC-PGMGR EC-PGMGR 0.6987
')

df$Methods = factor(df$Methods, levels = c("EL-KNN", "EL-LDA", "EL-SVM", 
                                           "EL-NB","EL-DT", "EL-HW", "SC3", 
                                           "CIDR", "Seurat", "t-SNE+k-means",
                                           "SAFE", "SAME", "EC-PGMGR"))

ggplot(df, aes(x=Methods, y=ARI, fill=Methods), width = 0.35) + 
  geom_col(data = df, position = "dodge") + theme_classic() + 
  ggtitle("Baron-human1") + 
  geom_text(label = df$ARI, position = position_dodge(0.9), vjust = -0.3)
