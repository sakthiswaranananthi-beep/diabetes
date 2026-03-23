install.packages("Hmisc")   # first time only
library(Hmisc)
data



hoeffd(data$SugerF, data$Urea)

hoeffd(data$SugerF, data$Creatinine)

hoeffd(data$SugerF, data$UricAcid)

hoeffd(data$SugerF, data$SodiumNA)

hoeffd(data$SugerF, data$PotassiumK)

hoeffd(data$SugerF, data$ChlorideCL)

hoeffd(data$SugerF, data$BicorbonateHCO3)
