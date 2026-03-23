install.packages("readxl")
library(readxl)
data <- read_excel(file.choose())
data
ref_table <- table(data$RefbyDr)
ref_table
pie(ref_table,
    main = "Referral by Doctor Distribution",
    col = rainbow(length(ref_table)),
    labels = paste(names(ref_table), "\n", 
                   round(prop.table(ref_table)*100,1), "%"))
install.packages("ggplot2")
library(ggplot2)

ref_df <- as.data.frame(ref_table)

ggplot(ref_df, aes(x = "", y = Freq, fill = Var1)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y", start = 0) +
  labs(title = "Referral by Doctor Distribution",
       fill = "Ref by Dr") +
  theme_void()