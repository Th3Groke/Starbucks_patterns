library(readr)

data <- read.csv("./starbucks_customer_ordering_patterns.csv")
pdf("Resources/Charts/Normality_testing/total_spend_Q-Q.pdf")
total_spend <- data$total_spend

qqnorm(total_spend,xlab="Thoretical values", ylab="Sample Quantiles (USD)",pch = 16, col = rgb(0,0,1,0.5))


qqline(total_spend, col="red",lwd=2)

dev.off()