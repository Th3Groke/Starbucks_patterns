# install.packages("dgof")
library(dgof)
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

data <- filter_outliers(df, "total_spend")

mean_spend <- mean(data$total_spend, na.rm = TRUE)
sigma_spend <- sd(data$total_spend, na.rm = TRUE)

ks_result_spent <- ks.test(data$total_spend, "pnorm",
    mean = mean_spend, sd = sigma_spend
)

print(ks_result_spent)

# There will probably be a warning about ties. We can just acknowledge that
# the 'ties' exist and still use the p-value to check the hypothesis
