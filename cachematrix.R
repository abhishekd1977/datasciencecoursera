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
    ## One way to find out if matrix is not changes is to multiply it by it's inverse
    ## If the result is an Identity matrix (1,0,0,1), then 
    
    ## First create an identity matrix
    identityMatrix <- matrix(c(1,0,0,1), nrow = 2, ncol = 2)
    ##print(identityMatrix)
    
    m <- x$getInverse()
    
    message("before")
    print(m)    
    message("after")
    if(!is.null(m)) {
        n <- x$get()
        ##Multiply identyMatrix with its inverse.
        result <- m %*% n
        message("result")
        print(result)
        
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
