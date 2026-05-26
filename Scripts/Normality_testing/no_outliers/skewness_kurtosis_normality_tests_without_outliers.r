install.packages("moments")
library(moments)
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

spend_skew <- skewness(df_spend_clean$total_spend)
spend_kurt <- kurtosis(df_spend_clean$total_spend)

print(paste("Skewness of total_spend:", spend_skew))
print(paste("Kurtosis of total_spend:", spend_kurt))
