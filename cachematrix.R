## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

"The makeCacheMatrix() function creates a list object with four functions:
      
set(): assigns a matrix to the cache matrix object.
get(): retrieves the matrix from the matrix cache object.
setinv(): assigns an inverse matrix to the matrix cache object.
getinv(): retrieve the inverse matrix of the cache matrix object."


makeCacheMatrix <- function(x = matrix()) {
      inv <- NULL
      set <- function(y) {
            x <<- y
            inv <<- NULL
      }
      get <- function() x
      setinv <- function(inverse) inv <<- inverse
      getinv <- function() inv
      list(set = set, get = get, setinv = setinv, getinv = getinv)
}



"The cacheSolve() function takes in a cache matrix object and retrieves the inverse matrix 
of the cache matrix object if it has already been calculated. If the inverse matrix has not yet
been computed, the function computes the inverse matrix. 
calculated, the function calculates the inverse of the matrix, stores the result in the 
cache matrix object
object using setinv() and returns the inverse matrix. The ... argument is used to pass additional
arguments to the solve() function. The message() function is used to print a message
message indicating that the function gets the cached data."


cacheSolve <- function(x, ...) {
      inv <- x$getinv()
      if(!is.null(inv)) {
            message("getting cached data")
            return(inv)
      }
      data <- x$get()
      inv <- solve(data, ...)
      x$setinv(inv)
      inv
}


