df <- read.csv("./starbucks_customer_ordering_patterns.csv")


model_fulfillment <- lm(fulfillment_time_min ~ num_customizations + cart_size + as.factor(order_channel), data = df)


cat("\n--- Multiple Linear Regression Summary ---\n")
summary(model_fulfillment)


dir.create("Resources/Hypothesis_testing", recursive = TRUE, showWarnings = FALSE)

pdf("Resources/Hypothesis_testing/Regression_Diagnostics.pdf", width = 8, height = 8)


par(mfrow = c(2, 2))
plot(model_fulfillment)

dev.off()
