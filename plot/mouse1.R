library(ggplot2)
library(gridExtra)

# Baron-mouse1-NMI
df <- read.table(header=TRUE, text='
 Methods Methods  NMI
  EL-KNN  EL-KNN   0.8299
  EL-LDA  EL-LDA   0.6592
  EL-SVM  EL-SVM   0.8751
  EL-NB   EL-NB    0.9693
  EL-DT   EL-DT    0.9605
  EL-HW   EL-HW    0.8954
  SC3     SC3      0.7106
  CIDR    CIDR     0.6574
  Seurat  Seurat   0.5054
  t-SNE+k-means t-SNE+k-means 0.6603
  SAFE    SAFE     0.7759
  SAME    SAME     0.802
  EC-PGMGR EC-PGMGR 0.8331
')  
df$Methods = factor(df$Methods, levels = c("EL-KNN", "EL-LDA", "EL-SVM", 
                                           "EL-NB","EL-DT", "EL-HW", "SC3", 
                                           "CIDR", "Seurat", "t-SNE+k-means",
                                           "SAFE", "SAME", "EC-PGMGR"))
ggplot(df, aes(x=Methods, y=NMI, fill=Methods), width = 0.35) + 
  geom_col(data = df, position = "dodge") + theme_classic() + 
  ggtitle("Baron-mouse1") + 
  geom_text(label = df$NMI, position = position_dodge(0.9), vjust = -0.3)

# Baron-mouse1-ARI
df <- read.table(header=TRUE, text='
 Methods Methods  ARI
  EL-KNN  EL-KNN   0.8678
  EL-LDA  EL-LDA   0.59
  EL-SVM  EL-SVM   0.9114
  EL-NB   EL-NB    0.9826
  EL-DT   EL-DT    0.9731
  EL-HW   EL-HW    0.9035
  SC3     SC3      0.4135
  CIDR    CIDR     0.5038
  Seurat  Seurat   0.28
  t-SNE+k-means t-SNE+k-means 0.5933
  SAFE    SAFE     0.7222
  SAME    SAME     0.7461
  EC-PGMGR EC-PGMGR 0.781
')

df$Methods = factor(df$Methods, levels = c("EL-KNN", "EL-LDA", "EL-SVM", 
                                           "EL-NB","EL-DT", "EL-HW", "SC3", 
                                           "CIDR", "Seurat", "t-SNE+k-means",
                                           "SAFE", "SAME", "EC-PGMGR"))

ggplot(df, aes(x=Methods, y=ARI, fill=Methods), width = 0.35) + 
  geom_col(data = df, position = "dodge") + theme_classic() + 
  ggtitle("Baron-mouse1") + 
  geom_text(label = df$ARI, position = position_dodge(0.9), vjust = -0.3)
