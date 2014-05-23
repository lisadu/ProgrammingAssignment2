## This is similar to the example code 
## Usage:
## m <- makeCacheMatrix(x)
## cacheSolve(m)

## This function creates a wrapper around a matrix to cache values
makeCacheMatrix <- function(x = matrix()) {
  cachedInverse <- NULL
  
  set <- function(data) {
    x <<- data
    cachedInverse <<- NULL
  }
  get <- function() x
  setInverse <- function(inv) cachedInverse <<- inv
  getInverse <- function() cachedInverse
  
  list(set = set, 
       get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## This function takes in a makeCacheMatrix, tries to get the cached inverse, 
## if it doesnt exist yet, then it will be calculated
cacheSolve <- function(x, ...) {
  inv <- x$getInverse()
  if(is.null(inv)) {
    message("calculating inverse of data")
    inv <- solve(x$get())
    x$setInverse(inv)
  } else {
    message("getting cached data")
  }
  return(inv)
}
