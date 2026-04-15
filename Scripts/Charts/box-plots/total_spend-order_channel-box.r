library(readr)

data <- read_csv("starbucks_customer_ordering_patterns.csv")

tot_spend <- data$total_spend
order_ch <- data$order_channel

pdf("Resources/Charts/box-plots/total_spend-order_channel-box.pdf", width = 7)

boxplot(tot_spend ~ order_ch, xlab="Channel", ylab="Total Spend (USD)",col = c("lightgreen", "lightblue", "lightpink", "lightgrey"))

dev.off()
