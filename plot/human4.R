library(ggplot2)
library(gridExtra)

# Baron-human4-NMI
df <- read.table(header=TRUE, text='
 Methods Methods  NMI
  EL-KNN  EL-KNN   0.8896
  EL-LDA  EL-LDA   0.8257
  EL-SVM  EL-SVM   0.9467
  EL-NB   EL-NB    0.9223
  EL-DT   EL-DT    0.8525
  EL-HW   EL-HW    0.8925
  SC3     SC3      0.775
  CIDR    CIDR     0.6567
  Seurat  Seurat   0.7012
  t-SNE+k-means t-SNE+k-means 0.771
  SAFE    SAFE     0.7603
  SAME    SAME     0.8664
  EC-PGMGR EC-PGMGR 0.876
')  
df$Methods = factor(df$Methods, levels = c("EL-KNN", "EL-LDA", "EL-SVM", 
                                           "EL-NB","EL-DT", "EL-HW", "SC3", 
                                           "CIDR", "Seurat", "t-SNE+k-means",
                                           "SAFE", "SAME", "EC-PGMGR"))
ggplot(df, aes(x=Methods, y=NMI, fill=Methods), width = 0.35) + 
  geom_col(data = df, position = "dodge") + theme_classic() + 
  ggtitle("Baron-human4") + 
  geom_text(label = df$NMI, position = position_dodge(0.9), vjust = -0.3)

# Baron-human4-ARI
df <- read.table(header=TRUE, text='
 Methods Methods  ARI
  EL-KNN  EL-KNN   0.9174
  EL-LDA  EL-LDA   0.8134
  EL-SVM  EL-SVM   0.9661
  EL-NB   EL-NB    0.9442
  EL-DT   EL-DT    0.8847
  EL-HW   EL-HW    0.9373
  SC3     SC3      0.5507
  CIDR    CIDR     0.5722
  Seurat  Seurat   0.4684
  t-SNE+k-means t-SNE+k-means 0.7533
  SAFE    SAFE     0.75
  SAME    SAME     0.8621
  EC-PGMGR EC-PGMGR 0.8903
')

df$Methods = factor(df$Methods, levels = c("EL-KNN", "EL-LDA", "EL-SVM", 
                                           "EL-NB","EL-DT", "EL-HW", "SC3", 
                                           "CIDR", "Seurat", "t-SNE+k-means",
                                           "SAFE", "SAME", "EC-PGMGR"))

ggplot(df, aes(x=Methods, y=ARI, fill=Methods), width = 0.35) + 
  geom_col(data = df, position = "dodge") + theme_classic() + 
  ggtitle("Baron-human4") + 
  geom_text(label = df$ARI, position = position_dodge(0.9), vjust = -0.3)
