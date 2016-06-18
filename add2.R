###Comment
add2 <- function(x,y){
    x+y
}

above10 <- function(x){
    use <- x > 10
    x[use]
}

above <- function(x, n) {
    use <- x > n
    x[use]
}

#Calculate mean of columns in a dataframe
columnmean <- function(y, removeNA = TRUE) {
    nc <- ncol(y)
    means <- numeric(nc)
    
    for (i in 1:nc) {
        means[i] <- mean(y[, i], na.rm = removeNA)
    }
    means
}

##Free variables
freevar <- function(x, y){
    x + y/z
}

###Lexical Scoping
make.power <- function(n) {
    pow <- function(x){
        x^n
    }
    pow
}

##Environment
ls(environment(cube))
