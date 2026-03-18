library(readr)


my_data <- read_csv("./starbucks_customer_ordering_patterns.csv")

chart_data <- table(my_data$customer_age_group)

colors <- c("#bec3fc", "#6f75be", "#3d4599", "#19227d", "#060b4d")
pdf("Resources/Charts/customer_age_group_bar_chart.pdf", width = 5, height = 4)

barplot(chart_data,
        col = colors,
        main = "Customer Age Groups",
        xlab = "Age Group",
        ylab = "Count"
        )

dev.off()