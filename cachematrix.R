## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setInverse <- function(inverseMatrix) m <<- inverseMatrix
    getInverse <- function() m
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    ## If the inverse has already been calculated (and the matrix has not changed), 
    ## then the cachesolve should retrieve the inverse from the cache.
    ## One way to find out if matrix is not changed is to multiply it by it's inverse.
    ## If the result is an Identity matrix (1,0,0,1), then matrix has not changed.
    
    ## First create an identity matrix
    identityMatrix <- matrix(c(1,0,0,1), nrow = 2, ncol = 2)
    m <- x$getInverse()
    
    ##This is a two step check in "if" block-
    ##Step 1: Check if inverseMatrix is not null.
    ##Step 2: If step 1) is true, check if multiplication of 
    ##        input matrix and its inverse matrix is an Identity Matrix
    ## If both of above is true, then return the Inverse value from "Cache"
    ## If Inverse Matrix value is null or input matrix has changed, then calculate the inverse value.
    if(!is.null(m)) {
        n <- x$get()
        ##Multiply input matrix with its inverse.
        result <- m %*% n
        ##If output of multiplication is Identity Matrix, then it means that input matrix has not changed
        if(all.equal(result, identityMatrix)){
            message("result == identityMatrix")
            message("getting cached data")
            return(m)            
        }
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setInverse(m)
    m    
}

######### How to test the program#######
########### 1st Test Run[Same Matrix]- Data must NOT come from cache##############
##> yy <- makeCacheMatrix(matrix(1:4, nrow = 2, ncol = 2))
##> cacheSolve(yy)
##[,1] [,2]
##$[1,]   -2  1.5
##[2,]    1 -0.5

########### 2nd Test Run[Same Matrix]- Data MUST come from cache##############
##> cacheSolve(yy)
##result == identityMatrix
##getting cached data
##[,1] [,2]
##[1,]   -2  1.5
##[2,]    1 -0.5

########### 3rd Test Run[Matrix has CHANGED now]- Data must NOT come from cache##############
##> yy <- makeCacheMatrix(matrix(5:8, nrow = 2, ncol = 2))
##> cacheSolve(yy)
##[,1] [,2]
##[1,]   -4  3.5
##[2,]    3 -2.5

########### 4th Test Run[Same matrix as Test Case#3]- Data MUST come from cache##############
##> cacheSolve(yy)
##result == identityMatrix
##getting cached data
##[,1] [,2]
##[1,]   -4  3.5
##[2,]    3 -2.5


