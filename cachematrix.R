## The first function, makeVector creates a special "vector", which is really a list containing a function to

# set the value of the vector
# get the value of the vector
# set the value of the mean
# get the value of the mean

makeCacheMatrix <- function(x = matrix()) {
      inv <- NULL
      dataset <- function(y) {
      x <- y
      inv <- NULL
    }
  get <- function() x 
  makeinv <- function(inverse) inv <<- inverse
  getinv <- function() inv
  list(dataset=dataset, get=get, makeinv=makeinv, getinv=getinv)
}

# This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
# If the inverse has already been calculated (and the matrix has not changed),
# then the cachesolve returns the inverse from the cache.

cacheSolve <- function(x, ...) {
  inv <- x$getinv()
  if(!is.null(inv)) {
    print ("retriving cached data.")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data)
  x$makeinv(inv)
  inv
}


# Test run 

#> B = matrix(c(9, -3, -3, 9), nrow=2, ncol=2) 
#> m = makeCacheMatrix(B)
#> m$get()
#[,1] [,2]
#[1,]    9   -3
#[2,]   -3    9
#> cacheSolve(m)
#[,1]       [,2]
#[1,] 0.12500000 0.04166667
#[2,] 0.04166667 0.12500000

