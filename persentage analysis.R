data$Sugar_status <- cut(data$SugerF,
                         breaks = c(-Inf, 99, 125, Inf),
                         labels = c("Normal", "Prediabetic", "Diabetic")) 

table(data$Gender, data$Sugar_status)

prop.table(table(data$Gender,
                 data$Sugar_status), 1) * 100



data$Age_group <- cut(data$Age,
                      breaks = c(-Inf, 29, 50, Inf),
                      labels = c("Young", "Middle_Age", "Older"))
data$Sugar_status <- cut(data$SugerF,
                         breaks = c(-Inf, 99, 125, Inf),
                         labels = c("Normal", "Prediabetic", "Diabetic"))
table(data$Age_group, data$Sugar_status)
prop.table(table(data$Age_group,
                 data$Sugar_status), 1) * 100