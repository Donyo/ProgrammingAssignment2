##
## This function creates a special "matrix" object that can cache its inverse.
## The makeCacheMatrix creates a special "matrix", which is really a list 
## containing a function to set the value of the matrix, get the value of
## the matrix, set the value of the inverse matrix, and get the value of
## the inverse matrix.
## 

makeCacheMatrix <- function(x = matrix()) {
      z <- NULL
      set <- function(y) {
            x <<- y
            z <<- NULL
            
      }
      get <- function() x
      setinverse <- function(solve) z <<- solve
      getinverse <- function() z
      list(set = set, get = get,
           setinverse = setinverse,
           getinverse = getinverse)
}


## The following function calculates the inverse of the "matrix" created
## with the above function. However, it first checks to see if the inverse
## has already been calculated. If so, it gets the inverse from the cache 
## and skips the computation. Otherwise, it calculates the inverse of the 
## matrix and sets the value of the inverse in the cache via the setinverse 
## function.
##

cacheSolve <- function(x, ...) {
      z <- x$getinverse()
      if(!is.null(z)) {
            message("getting cached data")
            return(m)
      }
        ## Return a matrix that is the inverse of 'x'
      data <- x$get()
      z <- mean(data, ...)
      x$setinverse(z)
      z
}
