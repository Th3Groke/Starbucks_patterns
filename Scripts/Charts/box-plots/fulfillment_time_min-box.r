library(readr)

data <- read_csv("starbucks_customer_ordering_patterns.csv")

fulfillment <- data$fulfillment_time_min

pdf("Resources/Charts/box-plots/fulfillment_time_min-box.pdf", width = 6)

boxplot(fulfillment, col = c("#74dab6"),ylab="time for the order to be completed (minutes)")

dev.off()
