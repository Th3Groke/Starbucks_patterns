library(readr)

my_data <- read_csv("./starbucks_customer_ordering_patterns.csv")

min_val <- min(my_data$fulfillment_time_min, na.rm = TRUE)
max_val <- max(my_data$fulfillment_time_min, na.rm = TRUE)

pdf("fulfillment_time_histogram.pdf", width = 7, height = 5)

hist(my_data$fulfillment_time_min,
     breaks = seq(min_val, max_val, length.out = 31),
     col = "#00704A",
     border = "white",
     main = "Distribution of Fulfillment Time",
     xlab = "Fulfillment Time (min)",
     ylab = "Frequency",
     xlim = c(min_val, max_val),
     xaxt = "n",
     xaxs = "i"
     )

axis(1, at = c(min_val, 4, 6, 8, max_val), labels = c(min_val, 4, 6, 8, max_val))

dev.off()
