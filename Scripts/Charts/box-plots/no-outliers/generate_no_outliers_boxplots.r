library(readr)

# Load data
df <- read_csv("starbucks_customer_ordering_patterns.csv")

# Function to filter out outliers based on IQR
filter_outliers <- function(data, column) {
  x <- data[[column]]
  q1 <- quantile(x, 0.25, na.rm = TRUE)
  q3 <- quantile(x, 0.75, na.rm = TRUE)
  iqr <- q3 - q1
  lower <- q1 - 1.5 * iqr
  upper <- q3 + 1.5 * iqr
  return(data[x >= lower & x <= upper, ])
}

# 1. Total Spend (No Outliers)
df_spend_clean <- filter_outliers(df, "total_spend")
pdf("Resources/Charts/box-plots/no-outliers/total_spend-no-outliers.pdf", width = 5)
boxplot(df_spend_clean$total_spend, 
        col = "#669c3e", 
        ylab = "Amount spent (USD)", 
        main = "Total Spend (Outliers Removed)",
        outline = FALSE) # Also setting outline=FALSE to be sure no new outliers are shown
dev.off()

# 2. Fulfillment Time (No Outliers)
df_fulfillment_clean <- filter_outliers(df, "fulfillment_time_min")
pdf("Resources/Charts/box-plots/no-outliers/fulfillment_time_min-no-outliers.pdf", width = 6)
boxplot(df_fulfillment_clean$fulfillment_time_min, 
        col = "#74dab6", 
        ylab = "Time for the order to be completed (minutes)", 
        main = "Fulfillment Time (Outliers Removed)",
        outline = FALSE)
dev.off()

# 3. Total Spend by Order Channel (No Outliers)
# Removing outliers per group for the grouped boxplot
df_grouped_clean <- do.call(rbind, lapply(split(df, df$order_channel), function(sub) {
  x <- sub$total_spend
  q1 <- quantile(x, 0.25, na.rm = TRUE)
  q3 <- quantile(x, 0.75, na.rm = TRUE)
  iqr <- q3 - q1
  lower <- q1 - 1.5 * iqr
  upper <- q3 + 1.5 * iqr
  return(sub[x >= lower & x <= upper, ])
}))

pdf("Resources/Charts/box-plots/no-outliers/total_spend-order_channel-no-outliers.pdf", width = 7)
boxplot(total_spend ~ order_channel, 
        data = df_grouped_clean, 
        xlab = "Channel", 
        ylab = "Total Spend (USD)", 
        col = c("lightgreen", "lightblue", "lightpink", "lightgrey"),
        main = "Total Spend by Channel (Outliers Removed)",
        outline = FALSE)
dev.off()

cat("Boxplots without outliers have been generated in Resources/Charts/box-plots/no-outliers/\n")
