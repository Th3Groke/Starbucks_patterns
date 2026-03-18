install.packages("readr", repos = "https://cloud.r-project.org")
library(readr)


my_data <- read_csv("./starbucks_customer_ordering_patterns.csv")

chart_data <- my_data$num_customizations

pdf("Resources/Charts/num_customizations_histogram.pdf", width = 5, height = 4)

hist(chart_data, col = "#007BA8", border = "white", main = "", xlab = "number of customizations", breaks = 10, xlim = c(0, 8))


dev.off()
