data$AgeGroup <- cut(data$Age,
                     breaks = c(0,30,60,100),
                     labels = c("<30","30-60",">60"))
colors <- c("green","red","yellow")

plot(data$Age, data$SugerF,
     main = "Age vs Sugar",
     xlab = "Age",
     ylab = "Sugar Level",
     pch = 19,
     col = colors[data$AgeGroup])

# Regression line
abline(lm(SugerF ~ Age, data = data),
       col = "blue",
       lwd = 2)

legend("topleft",
       legend = levels(data$AgeGroup),
       col = colors,
       pch = 19)

library(ggplot2)

ggplot(data, aes(x = Age, y = SugerF, color = AgeGroup)) +
  geom_point(size = 3) +
  geom_smooth(method = "lm", se = TRUE, color = "black") +
  scale_color_manual(values = c("green","red","yellow")) +
  labs(title = "Age vs Sugar Level",
       x = "Age",
       y = "Sugar Level",
       color = "Age Category") +
  theme_minimal()