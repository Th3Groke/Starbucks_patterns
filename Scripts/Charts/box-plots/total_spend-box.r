library(readr)

data <- read_csv("starbucks_customer_ordering_patterns.csv")

total_spend <- data$total_spend

pdf("Resources/Charts/box-plots/total_spend-box.pdf",width = 5,)

boxplot(total_spend, col = c("#669c3e"),
        ylab = "Amount spent (USD)")
dev.off()