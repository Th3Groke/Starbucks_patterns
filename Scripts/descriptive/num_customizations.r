library(readr)

# Source - https://stackoverflow.com/a/13874750
# Posted by Rasmus Bååth
# Retrieved 2026-03-26, License - CC BY-SA 3.0
estimate_mode <- function(x) {
  d <- density(x)
  d$x[which.max(d$y)]
}


dataset <- read.csv("./starbucks_customer_ordering_patterns.csv")
my_data <- dataset$num_customizations
avgValue <- mean(my_data)
medianValue <- median(my_data)
modeValue <- estimate_mode(my_data)
rangeValues <- range(my_data)

stdDeviation <- sd(my_data)

firstQuartile <- quantile(my_data, 0.25)
thirdQuartile <- quantile(my_data, 0.75)

print(paste0("mean value: ", avgValue))

print(paste0("median value: ", medianValue))

print(paste0("mode value: ", modeValue))

print(paste0("range: ", rangeValues))

print(paste0("standard deviation: ", stdDeviation))

print(paste0("0.25 Quartile: ", firstQuartile))
print(paste0("0.75 Quartile: ", thirdQuartile))
