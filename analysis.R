library(tidyverse)
df <- read_csv("workingDataset.csv")

x <-df$cholestoral
y <-df$sex
# boxplot(x~y)
# by(df$cholestoral, df$sex, summary)
result <- wilcox.test(x~y, data=df)
print(result)
