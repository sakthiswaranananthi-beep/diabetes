install.packages("readxl")
library(readxl)
data <- read_excel(file.choose())
data
############## renal
renal_model <- lm(`SugerF` ~ Urea + Creatinine + UricAcid + 
                  SodiumNA + PotassiumK
 + ChlorideCL + BicorbonateHCO3
, data = data)
summary(renal_model)

############# liver
liver_model <- lm(`SugerF` ~ S.G.O.TAST + S.G.P.TALT
 + BilirubinTotal + BilirubinDirect + Bilirubininderect
 + protein, data = data)
summary(liver_model)

########### Lipid model
lipid_model <- lm(`SugerF` ~ TotalCholesterol
, data = data)

summary(lipid_model)
