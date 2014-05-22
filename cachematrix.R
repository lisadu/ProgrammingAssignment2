## This is similar to the example code except one refactoring:
## I moved the calculation to inside the makeCacheMatrix since
## from an object oriented programing perspective, it makes sense

## This function creates a wrapper around a matrix
## It adds functionality to calculate the inverse and cache it
makeCacheMatrix <- function(x = matrix()) {
  cachedInverse <- NULL
  
  set <- function(data) {
    x <<- data
    cachedInverse <<- NULL
  }
  get <- function() x
  
  getInverse <- function() {
    if(is.null(cachedInverse)) {
      message("calculating inverse of data")
      cachedInverse <<- solve(x)
    } else {
      message("getting cached data")
    }
    cachedInverse
  }
  
  list(set = set, 
       get = get,
       getInverse = getInverse)
}


## All the work is done in makeCacheMatrix

cacheSolve <- function(x, ...) {
  m <- makeCacheMatrix(x)
  m$getInverse()
}
