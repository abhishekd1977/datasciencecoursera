best <- function(state, outcome){
    setwd("/Users/abhishekdubey/abhishek-git-repos/datasciencecoursera/rprog_data_ProgAssignment3-data")
    ## Read outcome data
    my_df <- read.csv("outcome-of-care-measures.csv", header = TRUE, na.strings = "Not Available", stringsAsFactors = FALSE)
    outcomes <- c("heart attack"=11, "heart failure"=17, "pneumonia"=23)
    outcome.state <- na.omit(subset(my_df[, c(2,7,outcomes[outcome])], State == state))
    
    ## Check that state and outcome are valid
    
    ## Return hospital name in that state with lowest 30-day death rate
    outcome.state.ordered <- outcome.state[order(outcome.state[, 3], outcome.state[, 1]), ]
    outcome.state.ordered[1, "Hospital.Name"]
}