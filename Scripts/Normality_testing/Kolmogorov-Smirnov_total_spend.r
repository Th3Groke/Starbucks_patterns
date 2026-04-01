install.packages("dgof")
library(dgof)
library(readr)

data <- read_csv("starbucks_customer_ordering_patterns.csv")

mean_spend <- mean(data$total_spend, na.rm = TRUE)
sigma_spend <- sd(data$total_spend, na.rm = TRUE)

ks_result_spent <- ks.test(data$total_spend, "pnorm",
                           mean = mean_spend, sd = sigma_spend)

print(ks_result_spent)

#There will probably be a warning about ties. We can just acknowledge that
#the 'ties' exist and still use the p-value to check the hypothesis