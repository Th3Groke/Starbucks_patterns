library(dgof)
library(readr)

data <- read_csv("starbucks_customer_ordering_patterns.csv")

mean_fulfillment <- mean(data$fulfillment_time_min, na.rm = TRUE)
sigma_fulfillment <- sd(data$fulfillment_time_min, na.rm = TRUE)

ks_result_fulfillment <- ks.test(data$fulfillment_time_min, "pnorm",
                                 mean = mean_fulfillment, sd=sigma_fulfillment)

print(ks_result_fulfillment)

#There will probably be a warning about ties. We can just acknowledge that
#the 'ties' exist and still use the p-value to check the hypothesis