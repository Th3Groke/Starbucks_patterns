# 1. Load data
df <- read.csv("starbucks_customer_ordering_patterns.csv")

# 2. Rename column for convenience
colnames(df)[colnames(df) == "customer_satisfaction"] <- "satisfaction"

# 3. Calculate descriptive statistics (Base R version)
# We use aggregate instead of dplyr to avoid the %>% error
stats_summary <- aggregate(satisfaction ~ order_channel, data = df, 
                           FUN = function(x) c(Mean = mean(x), Median = median(x), SD = sd(x)))
print("Descriptive Statistics:")
print(stats_summary)

# 4. Kruskal-Wallis Test
kw_test <- kruskal.test(satisfaction ~ order_channel, data = df)
print(kw_test)

# 5. Generate PDF Plot
pdf("satisfaction_channels_boxplot.pdf", width = 8, height = 6)
boxplot(satisfaction ~ order_channel, data = df,
        main = "Customer Satisfaction by Order Channel",
        xlab = "Order Channel",
        ylab = "Satisfaction Rating (1-5)",
        col = c("#A1D99B", "#74C476", "#31A354", "#006D2C"))
dev.off()

print(paste("Plot saved to:", getwd()))