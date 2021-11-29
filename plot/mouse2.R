library(ggplot2)
library(gridExtra)

# Baron-mouse2-NMI
df <- read.table(header=TRUE, text='
 Methods Methods  NMI
  EL-KNN  EL-KNN   0.8801
  EL-LDA  EL-LDA   0.7713
  EL-SVM  EL-SVM   0.9252
  EL-NB   EL-NB    0.9207
  EL-DT   EL-DT    0.909
  EL-HW   EL-HW    0.9024
  SC3     SC3      0.5835
  CIDR    CIDR     0.5998
  Seurat  Seurat   0.5715
  t-SNE+k-means t-SNE+k-means 0.6587
  SAFE    SAFE     0.5317
  SAME    SAME     0.6253
  EC-PGMGR EC-PGMGR 0.8306
')  
df$Methods = factor(df$Methods, levels = c("EL-KNN", "EL-LDA", "EL-SVM", 
                                           "EL-NB","EL-DT", "EL-HW", "SC3", 
                                           "CIDR", "Seurat", "t-SNE+k-means",
                                           "SAFE", "SAME", "EC-PGMGR"))
ggplot(df, aes(x=Methods, y=NMI, fill=Methods), width = 0.35) + 
  geom_col(data = df, position = "dodge") + theme_classic() + 
  ggtitle("Baron-mouse2") + 
  geom_text(label = df$NMI, position = position_dodge(0.9), vjust = -0.3)

# Baron-mouse2-ARI
df <- read.table(header=TRUE, text='
 Methods Methods  ARI
  EL-KNN  EL-KNN   0.9279
  EL-LDA  EL-LDA   0.7614
  EL-SVM  EL-SVM   0.9497
  EL-NB   EL-NB    0.9494
  EL-DT   EL-DT    0.9458
  EL-HW   EL-HW    0.9302
  SC3     SC3      0.4083
  CIDR    CIDR     0.6623
  Seurat  Seurat   0.2653
  t-SNE+k-means t-SNE+k-means 0.3948
  SAFE    SAFE     0.1849
  SAME    SAME     0.4103
  EC-PGMGR EC-PGMGR 0.9145
')

df$Methods = factor(df$Methods, levels = c("EL-KNN", "EL-LDA", "EL-SVM", 
                                           "EL-NB","EL-DT", "EL-HW", "SC3", 
                                           "CIDR", "Seurat", "t-SNE+k-means",
                                           "SAFE", "SAME", "EC-PGMGR"))

ggplot(df, aes(x=Methods, y=ARI, fill=Methods), width = 0.35) + 
  geom_col(data = df, position = "dodge") + theme_classic() + 
  ggtitle("Baron-mouse2") + 
  geom_text(label = df$ARI, position = position_dodge(0.9), vjust = -0.3)
