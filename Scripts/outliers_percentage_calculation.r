df <- read.csv('starbucks_customer_ordering_patterns.csv')

calculate_outliers <- function(data, variable_name) {
  values <- df[[variable_name]]
  
  Q1 <- quantile(values, 0.25)
  Q3 <- quantile(values, 0.75)
  IQR <- Q3 - Q1
  
  lower_bound <- Q1 - 1.5 * IQR
  upper_bound <- Q3 + 1.5 * IQR
  
  outliers <- values < lower_bound | values > upper_bound
  n_outliers <- sum(outliers)
  pct_outliers <- (n_outliers / length(values)) * 100
  
  cat(sprintf("\n%s:\n", variable_name))
  cat(sprintf("  Q1: %.4f\n", Q1))
  cat(sprintf("  Q3: %.4f\n", Q3))
  cat(sprintf("  IQR: %.4f\n", IQR))
  cat(sprintf("  Lower bound: %.4f\n", lower_bound))
  cat(sprintf("  Upper bound: %.4f\n", upper_bound))
  cat(sprintf("  Number of outliers: %d\n", n_outliers))
  cat(sprintf("  Percentage of outliers: %.2f%%\n", pct_outliers))
  
  return(list(
    outliers = outliers,
    n_outliers = n_outliers,
    pct_outliers = pct_outliers,
    lower_bound = lower_bound,
    upper_bound = upper_bound
  ))
}

# Calculate outliers for each variable
cat("Outlier Analysis (IQR Method)\n")
cat("========================================\n")

total_spend_outliers <- calculate_outliers(df, 'total_spend')
fulfillment_time_outliers <- calculate_outliers(df, 'fulfillment_time_min')
customizations_outliers <- calculate_outliers(df, 'num_customizations')

# Summary
cat("\n\nSUMMARY:\n")
cat("========================================\n")
cat(sprintf("total_spend: %.2f%% outliers\n", total_spend_outliers$pct_outliers))
cat(sprintf("fulfillment_time_min: %.2f%% outliers\n", fulfillment_time_outliers$pct_outliers))
cat(sprintf("num_customizations: %.2f%% outliers\n", customizations_outliers$pct_outliers))

# the actual outlier values
#cat("\n\nTotal spend outlier values:\n")
#print(df$total_spend[total_spend_outliers$outliers])

#cat("\n\nFulfillment time outlier values:\n")
#print(df$fulfillment_time_min[fulfillment_time_outliers$outliers])