rankhospital <- function(state, outcome, num = "best"){
    setwd("/Users/abhishekdubey/abhishek-git-repos/datasciencecoursera/rprog_data_ProgAssignment3-data")
    ## Read outcome data
    my_df <- read.csv("outcome-of-care-measures.csv", header = TRUE, na.strings = "Not Available", stringsAsFactors = FALSE)
    outcomes <- c("heart attack"=11, "heart failure"=17, "pneumonia"=23)
    state.names <- my_df[, "State"]
    
    ## Check that state and outcome are valid
    if (!(outcome %in% names(outcomes)))
        stop("invalid outcome")
    if (!(state %in% state.names))
        stop("invalid state")
    
    ## Return hospital name in that state with the given rank
    ## 30-day death rate
    outcome.state <- na.omit(subset(my_df[, c(2,7,outcomes[outcome])], State == state))
    outcome.state.ordered <- outcome.state[order(outcome.state[, 3], outcome.state[, 1]), ]
    num_rank <- num
    if (num == "best")
        num_rank <- 1
    if (num == "worst")
        num_rank <- nrow(outcome.state.ordered)
    outcome.state.ordered[num_rank, "Hospital.Name"]
}