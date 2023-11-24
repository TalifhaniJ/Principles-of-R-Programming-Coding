library(dplyr)
data <- read.csv("concrete.csv")
print(data)

data <- data %>% mutate_all(~ ifelse (. == 0, NA, .))
write.csv(data, "Concretev1.csv", row.names = FALSE)

data2 <- read.csv("Concretev1.csv")
print(data2)
