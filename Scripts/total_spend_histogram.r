install.packages("readr")
library(readr)


my_data <- read_csv("./starbucks_customer_ordering_patterns.csv")

chart_data <- my_data$total_spend

pdf("Resources/Charts/total_spend_histogram.pdf", width = 5, height = 4)

hist(chart_data, col = "#007BA8", border = "white", main = "", xlab = "value of the order in USD", breaks = 20, xlim = c(0, 40))


dev.off()
