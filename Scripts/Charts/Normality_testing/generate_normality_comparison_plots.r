install.packages("ggplot2")

library(readr)
library(ggplot2)

# Load the data
data <- read_csv("starbucks_customer_ordering_patterns.csv")

# 1. Store Averages (The most normal)
store_averages_df <- aggregate(fulfillment_time_min ~ store_id, data = data, FUN = mean)
store_averages_data <- store_averages_df$fulfillment_time_min

# 2. Espresso Subset (Normal)
espresso_data <- data$fulfillment_time_min[
    data$cart_size == 1 &
        data$drink_category == "Espresso" &
        data$num_customizations == 0 &
        data$has_food_item == FALSE
]

# 3. Brewed Coffee Subset (Technically not normal)
coffee_data <- data$fulfillment_time_min[
    data$cart_size == 1 &
        data$drink_category == "Brewed Coffee" &
        data$num_customizations == 0 &
        data$has_food_item == FALSE
]

# Function to create and save a Q-Q plot and Histogram side-by-side
save_normality_plots <- function(data_vector, title, filename) {
    pdf(file.path("Resources/Charts/Normality_testing", filename), width = 10, height = 5)
    par(mfrow = c(1, 2))

    # Histogram
    hist(data_vector,
        main = paste("Histogram:", title), xlab = "Fulfillment Time (min)",
        col = "lightblue", border = "white", breaks = 20
    )

    # Q-Q Plot
    qqnorm(data_vector, main = paste("Q-Q Plot:", title))
    qqline(data_vector, col = "red", lwd = 2)

    dev.off()
}


# Generate and save the plots
save_normality_plots(store_averages_data, "Store Averages (p=0.971)", "normality_store_averages.pdf")
save_normality_plots(espresso_data, "Standard Espresso (p=0.447)", "normality_standard_espresso.pdf")
save_normality_plots(coffee_data, "Standard Brewed Coffee (p=0.039)", "normality_standard_brewed_coffee.pdf")

print("Normality plots have been generated in Resources/Charts/Normality_testing/")
