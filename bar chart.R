

# C# Count gender values
gender_count <- table(data$Gender)

# Increase right margin for legend
par(mar = c(5,4,4,8))

# Create bar chart with extra top space
bp <- barplot(gender_count,
              main = "Gender Count",
              xlab = "Gender",
              ylab = "Count",
              col = c("pink","skyblue"),
              width = 0.5,
              ylim = c(0, max(gender_count) + 20))

# Add counts above bars
text(bp, gender_count + 5,
     labels = gender_count)

# Add legend
legend("topright",
       inset = c(-0.25,0),
       legend = c("Female","Male"),
       fill = c("pink","skyblue"),
       bty = "n",
       xpd = TRUE)