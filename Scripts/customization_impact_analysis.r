library(readr)

my_data <- read_csv("./starbucks_customer_ordering_patterns.csv")


chart_data <- aggregate(fulfillment_time_min ~ num_customizations, 
                        data = my_data, 
                        FUN = mean)

colors <- c("#f7fcf5", "#e5f5e0", "#c7e9c0", "#a1d99b", "#74c476", "#41ab5d", "#238b45", "#006d2c", "#00441b")

pdf("customization_impact_analysis.pdf", width = 7, height = 5)

barplot(chart_data$fulfillment_time_min, 
        names.arg = chart_data$num_customizations,
        col = colors,
        main = "Fulfillment Time by Number of Customizations",
        xlab = "Number of Customizations",
        ylab = "Average Fulfillment Time (min)",
        ylim = c(0, max(chart_data$fulfillment_time_min) * 1.2)
        )

dev.off()
