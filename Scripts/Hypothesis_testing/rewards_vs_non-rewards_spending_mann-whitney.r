#install.packages("readr")
library(readr)


dataset <- read_csv("starbucks_customer_ordering_patterns.csv")
rewards_spend <- dataset$total_spend[dataset$is_rewards_member == TRUE]
non_rewards_spend <-dataset$total_spend[dataset$is_rewards_member == FALSE]

## Descriptive statistics (median calculation)
median_rewards <- median(rewards_spend, na.rm = TRUE)
median_non_rewards <- median(non_rewards_spend, na.rm = TRUE)

cat("Median spend (Rewards Members): ", median_rewards, "\n")
cat("Median spend (Non-Rewards Members): ", median_non_rewards, "\n")


##Mann-Whitney test
#H0: The distribution of total spend is the same for both groups
#H1: The distribution of total spend is different for two groups
test_result <- wilcox.test(total_spend ~ is_rewards_member, data=dataset)

print(test_result)
if(test_result$p.value < 0.05){
    cat("\n Conclusion: Reject the null hypothesis (p < 0.05).\n")
    cat("There is a statistically significant difference in total spend between rewards members and non-members")
}else {
    cat("\nConclusion: Fail to reject the null hypothesis (p >= 0.05).\n")
    cat("There is no statistically significant difference in total spend between rewards and non-rewards members")
}