## Put comments here that give an overall description of what your
## functions do

## caching the inverse of a matrix to avoid computation every time. it will act as input to cachesolve function

makeCacheMatrix <- function(x = matrix()) {
  
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
  }




## Check cache for inverse of the matrix and if it is already calculated, it will get that, else it will calculate the inverse with solve() function
##and store it in the cache

 cacheSolve <- function(x, ...) {
  i <- x$getinverse()
  if (!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  i
}
