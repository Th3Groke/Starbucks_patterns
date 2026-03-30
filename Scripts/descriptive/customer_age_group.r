library(readr)

dataset <- read.csv("starbucks_customer_ordering_patterns.csv")

my_data <- table(dataset$customer_age_group)

mode_age_group <- names(which.max(my_data))
cardinality <- length(names(my_data))




print(paste0("mode: ", mode_age_group))
print(paste0("cardinality: ", cardinality))