## We use the format that has been used in the example to create the special "vector".

## The function makeCacheMatrix creates a special "matrix" that is really a list containing a function to:
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of the inverse
## 4. get the value of the inverse

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


}



## The following function calculates the inverse of the special "Matrix" created with makeCacheMatrix.
## However, it first checks to see if the inverse has already been computed.
## If so it gets the inverse from the cache and skips the computation.
## Otherwise it calculates the inverse of the matrix and sets the value of the inverse in the cache via the 
## set inverse function.



cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
         m <- x$getinverse()

  if(!is.null(m)) {

    message("cached data is being loaded")

    return(m)

  }

  data <- x$get()

  m <- inverse(data, ...)

  x$setinverse(m)

  m

}