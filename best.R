# Best hospital in state
best <- function(state, outcome) {
  ## Read outcome data
  data <- read.csv("data/outcome-of-care-measures.csv", colClasses = "character", na.strings="Not Available")
  
  ## Check that state and outcome are valid
  validQueries = c("heart attack","heart failure","pneumonia")
  if (!outcome %in% validQueries) { stop("invalid outcome")}
  
  validStates = unique(data[,7])
  if (!state %in% validStates) stop("invalid state")
  
  ## convert outcome name into column name
  fullColName <- c("Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure", "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")
  colName <- fullColName[match(outcome,validQueries)]
  
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  data.state <- data[data$State == state,]
  idx <- which.min(as.double(data.state[,colName]))
  data.state[idx,"Hospital.Name"]
}