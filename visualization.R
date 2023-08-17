# fetching dataset
# df <- read.csv("https://query.data.world/s/el7jnnlzsh3shi3qwkzqz74e7toiuj", header=TRUE, stringsAsFactors=FALSE);
# print(colnames(df))

# #giving column names
# colnames(df)<- c("age", "sex", "chest_pain", "rstng_BP", "cholestoral", "fbs", "restecg", "max_HR", "exang", "oldpeak", "slope", "ca", "thal", "num")
# print(colnames(df))

# changing values
# fdf <- df["sex"][df["sex"] == 0] <- "F"
# mdf <- df["sex"][df["sex"] == 1] <- "M"

# #saving dataset
# write.csv(df,"workingDataset.csv", row.names = FALSE)
# print(head(df,10))

# Visualization
df <- read.csv("workingDataset.csv")
x <- df$sex
y <- df$cholestoral

# save to pdf
pdf("visualization.pdf")

# graph1
boxplot(y ~ x
    , main = "Boxplot\nCholesterol vs Sex"
    , xlab = substitute(paste(italic("Sex")))
    , ylab = ""
    , pch = 19
    , col = c("#ff00aab0", "#0055ffb0")
    , whiskcol = "#c300ff"
    , xaxt = "n"
)
axis(1, at = 1:2, labels = c("Female", "Male"))
mtext(substitute(paste(italic("Cholesterol (mg/dl)"))), side= 2, line = 2.3)


# graph2
histogram <- hist(y
    , main = "Histogram\nCholeterol vs Frequency"
    , xlab = "Cholesteral (mg/dl)"
    , col = "#ffc800"
    , probability = TRUE
    , font.main = 4, font.lab = 3
)
lines(density(y), col = "#5a00c8", lwd = 2)
text(histogram$mids
    , histogram$counts
    , labels = histogram$counts
    , adj = c(0.5, -0.5)
)

dev.off()