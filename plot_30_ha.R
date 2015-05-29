# Hospital Data
outcome <- read.csv("data/outcome-of-care-measures.csv", colClasses = "character")
head(outcome)

# Histogram for 30 day heart attack mortality rate
outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11])

