library(readr)

df <- read_csv("starbucks_customer_ordering_patterns.csv")

filter_outliers <- function(data, column) {
        x <- data[[column]]
        q1 <- quantile(x, 0.25, na.rm = TRUE)
        q3 <- quantile(x, 0.75, na.rm = TRUE)
        iqr <- q3 - q1
        lower <- q1 - 1.5 * iqr
        upper <- q3 + 1.5 * iqr
        return(data[x >= lower & x <= upper, ])
}

df_spend_clean <- filter_outliers(df, "total_spend")
pdf("Resources/Charts/Normality_testing/no-outliers/total_spend_without_outliers_Q-Q.pdf")
total_spend <- df_spend_clean$total_spend

qqnorm(total_spend, main = "", xlab = "Theoretical values", ylab = "Sample Quantiles (USD)", pch = 16, col = rgb(0, 0, 1, 0.5))


qqline(total_spend, col = "red", lwd = 2)

dev.off()