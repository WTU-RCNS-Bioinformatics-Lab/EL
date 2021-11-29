library(ggplot2)
library(gridExtra)

# Baron-human3-NMI
df <- read.table(header=TRUE, text='
 Methods Methods  NMI
  EL-KNN  EL-KNN   0.891
  EL-LDA  EL-LDA   0.8802
  EL-SVM  EL-SVM   0.8994
  EL-NB   EL-NB    0.9173
  EL-DT   EL-DT    0.8991
  EL-HW   EL-HW    0.9196
  SC3     SC3      0.6498
  CIDR    CIDR     0.6337
  Seurat  Seurat   0.7189
  t-SNE+k-means t-SNE+k-means 0.8008
  SAFE    SAFE     0.7365
  SAME    SAME     0.828
  EC-PGMGR EC-PGMGR 0.8529
')  
df$Methods = factor(df$Methods, levels = c("EL-KNN", "EL-LDA", "EL-SVM", 
                                           "EL-NB","EL-DT", "EL-HW", "SC3", 
                                           "CIDR", "Seurat", "t-SNE+k-means",
                                           "SAFE", "SAME", "EC-PGMGR"))
ggplot(df, aes(x=Methods, y=NMI, fill=Methods), width = 0.35) + 
  geom_col(data = df, position = "dodge") + theme_classic() + 
  ggtitle("Baron-human3") + 
  geom_text(label = df$NMI, position = position_dodge(0.9), vjust = -0.3)

# Baron-human3-ARI
df <- read.table(header=TRUE, text='
 Methods Methods  ARI
  EL-KNN  EL-KNN   0.9366
  EL-LDA  EL-LDA   0.9105
  EL-SVM  EL-SVM   0.9392
  EL-NB   EL-NB    0.9521
  EL-DT   EL-DT    0.9373
  EL-HW   EL-HW    0.9592
  SC3     SC3      0.2889
  CIDR    CIDR     0.5577
  Seurat  Seurat   0.4868
  t-SNE+k-means t-SNE+k-means 0.7524
  SAFE    SAFE     0.595
  SAME    SAME     0.73
  EC-PGMGR EC-PGMGR 0.8454
')

df$Methods = factor(df$Methods, levels = c("EL-KNN", "EL-LDA", "EL-SVM", 
                                           "EL-NB","EL-DT", "EL-HW", "SC3", 
                                           "CIDR", "Seurat", "t-SNE+k-means",
                                           "SAFE", "SAME", "EC-PGMGR"))

ggplot(df, aes(x=Methods, y=ARI, fill=Methods), width = 0.35) + 
  geom_col(data = df, position = "dodge") + theme_classic() + 
  ggtitle("Baron-human3") + 
  geom_text(label = df$ARI, position = position_dodge(0.9), vjust = -0.3)
