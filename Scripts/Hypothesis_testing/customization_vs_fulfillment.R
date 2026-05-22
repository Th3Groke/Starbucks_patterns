library(readr)
library(ggplot2)

# Load the data
df <- read_csv("starbucks_customer_ordering_patterns.csv")

# Filter for single drink orders without food for the selected categories
target_drinks <- c("Espresso", "Brewed Coffee")
product_df <- df[df$drink_category %in% target_drinks & df$cart_size == 1 & df$has_food_item == FALSE, ]

# Visualization: Averages with Error Bars (Standard Error)
# This handles the discrete nature of num_customizations much better than a scatter plot
p <- ggplot(product_df, aes(x = num_customizations, y = fulfillment_time_min, color = drink_category, group = drink_category)) +
    # Plot the means as points and connect them with lines
    stat_summary(fun = mean, geom = "line", size = 1) +
    stat_summary(fun = mean, geom = "point", size = 3) +
    # Add error bars (Standard Error of the Mean)
    stat_summary(fun.data = mean_se, geom = "errorbar", width = 0.2) +
    labs(
        title = "Average Fulfillment Time vs. Customizations",
        subtitle = "Mean fulfillment time with Standard Error bars (Comparison: Espresso vs. Brewed Coffee)",
        x = "Number of Customizations",
        y = "Mean Fulfillment Time (minutes)",
        color = "Drink Category"
    ) +
    theme_minimal() +
    scale_x_continuous(breaks = 0:max(product_df$num_customizations))

# Save the plot
output_pdf <- "Resources/Hypothesis_testing/Customization_vs_Fulfillment_Averages.pdf"
ggsave(output_pdf, plot = p, width = 8, height = 6)
message("New plot saved to: ", output_pdf)

# Correlation Analysis (Mathematical confirmation)
for (drink in target_drinks) {
    subset_df <- product_df[product_df$drink_category == drink, ]
    
    cat("\n--- Spearman Correlation for", drink, "---\n")
    outcome <- cor.test(subset_df$fulfillment_time_min, subset_df$num_customizations, method = "spearman")
    print(outcome)
}
