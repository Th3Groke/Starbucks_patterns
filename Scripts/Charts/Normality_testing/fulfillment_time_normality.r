library(readr)

data <- read_csv("starbucks_customer_ordering_patterns.csv")

fulfillment <- data$fulfillment_time_min
pdf("Resources/Charts/Normality_testing/fulfillment_Q-Q.pdf",width = 7,height = 5)

qqnorm(fulfillment, main="",pch = 16, col = "#7474ff89",xlab="Theoretical values", ylab="Sample Quantiles")

qqline(fulfillment,col='red',lwd=2)

dev.off()