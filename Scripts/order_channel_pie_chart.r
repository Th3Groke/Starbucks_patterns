install.packages("readr")
library(readr)


my_data <- read_csv("./starbucks_customer_ordering_patterns.csv")

chart_data <- table(my_data$order_channel)

colors <- c("skyblue", "orange", "chartreuse", "tomato")
pdf("Resources/Charts/order_channel_pie_chart.pdf", width = 7,height = 7)

pie(chart_data,
    labels = paste0(names(chart_data), " (", chart_data, ")"),
    col = colors)

dev.off()