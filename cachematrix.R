## Put comments here that give an overall description of what your
## functions do

## This function creates a wrapper matrix, which is a list containing a function that
## sets the value of the matrix, gets the value of the matrix, and sets the inverse
## of the matrix, and gets the value of the inverse of the matrix.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## The following function calculates the inverse of the wrapper matrix 
## created with the makeCacheMatrix function. First it checks to see if the inverse 
## has already been calculated. If so, it gets the inverse from the cache and skips 
## the computation. Otherwise, it calculates the inverse of the matrix and sets the 
## value of the inverse matrix in the cache via the setinverse function.

cacheSolve <- function(x, ...) {
        
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}