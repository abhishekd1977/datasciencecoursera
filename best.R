#####
###'Number.of.Patients...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure',
###'Number.of.Patients...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack',

best <- function(state, outcome){
    setwd("/Users/abhishekdubey/abhishek-git-repos/datasciencecoursera/rprog_data_ProgAssignment3-data")
    ## Read outcome data
    my_df <- read.csv("outcome-of-care-measures.csv", header = TRUE, na.strings = "Not Available", stringsAsFactors = FALSE)
    
    outcomes <- c("heart attack"=11, "heart failure"=17, "pneumonia"=23)
    outcome_1 <- subset(my_df, State == state)
    outcome_2 <- outcome_1[, c(2,7,outcomes[outcome])]
    ## Check that state and outcome are valid
    
    ## Return hospital name in that state with lowest 30-day death rate
    outcome_2
}