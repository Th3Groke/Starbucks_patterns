# install.packages("dgof")
library(dgof)
library(readr)

data <- read_csv("starbucks_customer_ordering_patterns.csv")

# Filters for a standardized "Black Coffee" order
# 1 item, Brewed Coffee, no customizations, no food
subset_data <- data[
    data$cart_size == 1 &
        data$drink_category == "Brewed Coffee" &
        data$num_customizations == 0 &
        data$has_food_item == FALSE,
]

mean_val <- mean(subset_data$fulfillment_time_min, na.rm = TRUE)
sd_val <- sd(subset_data$fulfillment_time_min, na.rm = TRUE)

ks_result <- ks.test(subset_data$fulfillment_time_min, "pnorm",
    mean = mean_val, sd = sd_val
)

# Output results
print(paste("Sample size for subset:", nrow(subset_data)))
print(ks_result)

# P-value > 0.05 indicates the subset is normally distributed.
