# Sugar categories
data$Sugar_status <- cut(data$SugerF,
                         breaks = c(-Inf, 99, 125, Inf),
                         labels = c("Normal","Prediabetic","Diabetic"))

# Table
x <- table(data$Gender, data$Sugar_status)

# Percentage
tab_percent <- prop.table(x,1)*100

# extra space for legend
par(mar=c(5,5,4,8))

# Stacked barplot (bars thin)
bp <- barplot(t(tab_percent),
              col = c("lightgreen","orange","red"),
              ylim = c(0,150),
              width = 0.40,   # bars thin
              space = 0.1,   # gap between bars
              main = "Gender vs Sugar Status (count)",
              xlab = "Gender",
              ylab = "sugar")

# Legend outside
legend("topright",
       inset = c(-0.15,0),
       legend = colnames(x),
       fill = c("lightgreen","orange","red"),
       bty="n")

# Label position
ypos <- apply(t(tab_percent), 2, cumsum) - t(tab_percent)/2

text(bp,
     ypos,
     labels = t(x),
     cex = 0.9)