library(readxl)
data <- read_excel(file.choose())
data
# #### Scatter Plot s vs age
plot(data$Age, data$SugerF,
     main = "Age vs Sugar",
     xlab = "Age",
     ylab = "Sugar Level",
     pch = 19,
     col = "blue")

# Add regression line
abline(lm(SugerF ~ Age, data = data),
       col = "red",
       lwd = 2)
library(ggplot2)

ggplot(data, aes(x = Age, y = SugerF)) +
  geom_point() +
  geom_smooth(method = "lm", se = TRUE) +
  labs(title = "Age vs Suger",
       x = "Age",
       y = "Sugar Level") +
  theme_minimal()
data$AgeGroup <- cut(data$Age,
                     breaks = c(0,30,50,100),
                     labels = c("<30","30-50",">50"))



############voline plot s vs age

library(ggplot2)
colnames(data)
ggplot(data, aes(x = Age, y = SugerF)) +
  geom_violin(fill = "lightgreen") +
  labs(title = "Sugar Distribution by Age Group")



####### s vs gender
library(ggplot2)

ggplot(data, aes(x = Gender, y = SugerF)) +
  geom_violin(fill = "lightgreen") +
  labs(title = "Sugar Distribution by Gender",
       x = "Gender",
       y = "Sugar Level")



data$Sugar_status <- cut(data$SugerF,
                         breaks = c(-Inf, 99, 125, Inf),
                         labels = c("Normal", "Prediabetic", "Diabetic")) 

x =table(data$Gender, data$SugarF)
x
# Stacked bar chart
barplot(t(x),
        col = c("lightgreen", "orange", "red"),
        legend = rownames(t(tab_percent)),
        main = "Gender vs Sugar Status (Percentage)",
        xlab = "Gender",
        ylab = "Percentage")

bp <- barplot(t(x),
              col = c("lightgreen", "orange", "red"),
              legend = colnames(x),
              main = "Gender vs Sugar Status (Percentage)",
              xlab = "Gender",
              ylab = "Percentage")

text(bp,
     t(x),
     labels = round(t(x),1),
     pos = 3,
     cex = 0.8)