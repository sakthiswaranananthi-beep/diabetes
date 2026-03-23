install.packages("readxl")
library(readxl)
data <- read_excel(file.choose())
data
colnames(data)
liver_vars <- data[, c("SugerF",
                       "S.G.O.TAST",
                       "S.G.P.TALT",
                       "BilirubinTotal",
                       "BilirubinDirect",
                       "Bilirubininderect",
                       "protein")]

cor(liver_vars, use="complete.obs", method="spearman")


cor_matrix <- cor(liver_vars,
                  use = "complete.obs",
                  method = "spearman")

install.packages("corrplot")   # first time mattum
library(corrplot)

corrplot(cor_matrix,
         method = "color",
         type = "upper",
         addCoef.col = "black",
         tl.col = "black",
         tl.srt = 45,
         col = colorRampPalette(c("blue", "white", "red"))(200))


install.packages("reshape2")
install.packages("ggplot2")

library(reshape2)
library(ggplot2)

cor_melt <- reshape2::melt(cor_matrix)

ggplot(cor_melt, aes(Var1, Var2, fill = value)) +
  geom_tile(color = "white") +
  geom_text(aes(label = round(value, 2))) +
  scale_fill_gradient2(low = "blue",
                       mid = "white",
                       high = "red",
                       midpoint = 0,
                       limits = c(-1,1)) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        axis.title = element_blank())







# Install package if not installed
# install.packages("pheatmap")
library(pheatmap)

# 1️⃣ Correlation matrix (row-wise same as your table)
corr_matrix <- matrix(
  c(
    1.000, 0.25, 0.40, 0.05, 0.05, 0.04, -0.02,   # SugarF
    0.25, 1.000, 0.60, 0.10, 0.04, 0.02, 0.03,    # SGOT
    0.40, 0.60, 1.000, 0.08, -0.03, -0.02, -0.01, # SGPT
    0.05, 0.10, 0.08, 1.000, 0.70, 0.65, 0.05,    # BilirubinTotal
    0.05, 0.04, -0.03, 0.70, 1.000, 0.50, -0.02,  # BilirubinDirect
    0.04, 0.02, -0.02, 0.65, 0.50, 1.000, -0.01,  # BilirubinIndirect
    -0.02, 0.03, -0.01, 0.05, -0.02, -0.01, 1.000 # Protein
  ),
  nrow = 7,
  ncol = 7,
  byrow = TRUE
)

# 2️⃣ Assign variable names
variables <- c("SugarF", "SGOT", "SGPT", "BilirubinTotal", "BilirubinDirect", "BilirubinIndirect", "Protein")
colnames(corr_matrix) <- variables
rownames(corr_matrix) <- variables

# 3️⃣ Heatmap with fixed scale -1 to 1
pheatmap(
  corr_matrix,
  display_numbers = TRUE,
  color = colorRampPalette(c("white", "#b4b8b8", "blue"))(100), # Blue=negative, Red=positive
  main = "Correlation Heatmap: Sugar vs Liver Variables (+1 to -1)",
  border_color = "black",
  cluster_rows = FALSE,
  cluster_cols = FALSE,
  breaks = seq(-1, 1, length.out = 101)  # Force color scale from -1 to 1
)