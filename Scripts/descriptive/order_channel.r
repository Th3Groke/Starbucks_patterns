library(readr)

dataset <- read.csv("starbucks_customer_ordering_patterns.csv")

my_data <- table(dataset$order_channel)


most_common <- max(my_data)
most_common_name <- names(which.max(my_data))
cardinality <- length((names(my_data)))


print(paste0("cardinality: ", cardinality))
print(paste("mode:", most_common_name, "-", most_common, "orders"))
