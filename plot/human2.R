library(ggplot2)
library(gridExtra)

# Baron-human2-NMI
df <- read.table(header=TRUE, text='
 Methods Methods  NMI
  EL-KNN  EL-KNN   0.9142
  EL-LDA  EL-LDA   0.8639
  EL-SVM  EL-SVM   0.9402
  EL-NB   EL-NB    0.9287
  EL-DT   EL-DT    0.9248
  EL-HW   EL-HW    0.9361
  SC3     SC3      0.7408
  CIDR    CIDR     0.2734
  Seurat  Seurat   0.4503
  t-SNE+k-means t-SNE+k-means 0.8362
  SAFE    SAFE     0.7927
  SAME    SAME     0.8059
  EC-PGMGR EC-PGMGR 0.8629
')  
df$Methods = factor(df$Methods, levels = c("EL-KNN", "EL-LDA", "EL-SVM", 
                                           "EL-NB","EL-DT", "EL-HW", "SC3", 
                                           "CIDR", "Seurat", "t-SNE+k-means",
                                           "SAFE", "SAME", "EC-PGMGR"))
ggplot(df, aes(x=Methods, y=NMI, fill=Methods), width = 0.35) + 
  geom_col(data = df, position = "dodge") + theme_classic() + 
  ggtitle("Baron-human2") + 
  geom_text(label = df$NMI, position = position_dodge(0.9), vjust = -0.3)

# Baron-human2-ARI
df <- read.table(header=TRUE, text='
 Methods Methods  ARI
  EL-KNN  EL-KNN   0.9418
  EL-LDA  EL-LDA   0.8469
  EL-SVM  EL-SVM   0.9642
  EL-NB   EL-NB    0.9617
  EL-DT   EL-DT    0.9462
  EL-HW   EL-HW    0.9626
  SC3     SC3      0.5009
  CIDR    CIDR     0.1084
  Seurat  Seurat   0.2048
  t-SNE+k-means t-SNE+k-means 0.8525
  SAFE    SAFE     0.8025
  SAME    SAME     0.8099
  EC-PGMGR EC-PGMGR 0.8976
')

df$Methods = factor(df$Methods, levels = c("EL-KNN", "EL-LDA", "EL-SVM", 
                                           "EL-NB","EL-DT", "EL-HW", "SC3", 
                                           "CIDR", "Seurat", "t-SNE+k-means",
                                           "SAFE", "SAME", "EC-PGMGR"))

ggplot(df, aes(x=Methods, y=ARI, fill=Methods), width = 0.35) + 
  geom_col(data = df, position = "dodge") + theme_classic() + 
  ggtitle("Baron-human2") + 
  geom_text(label = df$ARI, position = position_dodge(0.9), vjust = -0.3)
