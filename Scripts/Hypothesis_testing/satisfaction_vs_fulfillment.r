#install.packages("dplyr")
#install.packages("ggplot2")
#install.packages("readr")

library(dplyr)
library(ggplot2)
library(readr)

# Load the dataset
data <- read_csv("starbucks_customer_ordering_patterns.csv")

# 1. Calculate Spearman's rank correlation coefficient
correlation_test <- cor.test(data$fulfillment_time_min, 
                             data$customer_satisfaction, 
                             method = "spearman", 
                             exact = FALSE)

cat("--- Spearman's Rank Correlation Test ---\n")
print(correlation_test)

# 2. Generate a visualization
plot_data <- data %>%
  filter(!is.na(fulfillment_time_min) & !is.na(customer_satisfaction)) %>%
  mutate(fulfillment_time_bin = cut(fulfillment_time_min, 
                                    breaks = seq(0, max(fulfillment_time_min) + 2, by = 2), 
                                    include.lowest = TRUE,
                                    right = FALSE)) %>%
  group_by(fulfillment_time_bin) %>%
  summarize(avg_satisfaction = mean(customer_satisfaction),
            n = n(), .groups = 'drop') %>%
  filter(n > 10) 

# Create a line plot
satisfaction_plot <- ggplot(plot_data, aes(x = fulfillment_time_bin, y = avg_satisfaction, group = 1)) +
  geom_line(color = "#00704A", size = 1.2) + 
  geom_point(color = "#00704A", size = 3) +
  theme_minimal() +
  labs(title = "Average Customer Satisfaction vs. Fulfillment Time",
       x = "Fulfillment Time Bins (Minutes)",
       y = "Average Satisfaction Score (1-5)") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# 3. Save the visualization as a PDF
dir.create("Resources/Hypothesis_testing", recursive = TRUE, showWarnings = FALSE)

# Save the plot
ggsave("Resources/Hypothesis_testing/satisfaction_vs_fulfillment.pdf", 
       plot = satisfaction_plot, 
       width = 8, 
       height = 5,
       device = "pdf")

cat("Visualization successfully saved to Resources/Hypothesis_testing/satisfaction_vs_fulfillment.pdf\n")