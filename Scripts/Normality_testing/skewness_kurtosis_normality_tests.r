#install.packages('moments')
library(moments)

data <- read_csv("starbucks_customer_ordering_patterns.csv")

spend_skew <- skewness(data$total_spend)
fulfillment_skew <- skewness(data$fulfillment_time_min)

spend_kurt <- kurtosis(data$total_spend)
fulfillment_kurt <- kurtosis(data$fulfillment_time_min)

print(paste("Skewness of total_spend:",spend_skew))
print(paste("Skewness of fulfillment_time_min:", fulfillment_skew))
print(paste("Kurtosis of total_spend:",spend_kurt))
print(paste("Kurtosis of fulfillment_time_min:",fulfillment_kurt))