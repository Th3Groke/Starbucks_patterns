# install.packages("dgof")
library(dgof)
library(readr)

# Load the data
data <- read_csv("starbucks_customer_ordering_patterns.csv")

# Aggregate the fulfillment time by store to get the mean for each store
# This applies the Central Limit Theorem: the distribution of averages 
# tends toward normality even if the individual data points are skewed.
store_averages <- aggregate(fulfillment_time_min ~ store_id, data = data, FUN = mean)

# Extract just the mean fulfillment times
avg_times <- store_averages$fulfillment_time_min

mean_val <- mean(avg_times, na.rm = TRUE)
sd_val <- sd(avg_times, na.rm = TRUE)

ks_result <- ks.test(avg_times, "pnorm",
    mean = mean_val, sd = sd_val
)

# Output results
print(paste("Number of stores analyzed:", length(avg_times)))
print(ks_result)

# P-value > 0.05 indicates that the averages follow a normal distribution,
# providing strong proof via the Central Limit Theorem.
