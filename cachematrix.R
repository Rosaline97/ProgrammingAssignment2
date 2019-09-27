## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
##makeCacheMatrix function makes the matrix object can cache its own object
makeCacheMatrix <- function(x = matrix()) {##default mode "matrix"invMat <- NULL ##initialize invMat as NULL
  SetMat <- function(y) {##set the value of the matrix
    x <<- y ##<<- assign new value of matrix in parent environment
    invMat <<- NULL
  }
  getMat <- function() x
  setinverse <- function(inverse) invMat <<- inverse
  getinverse <- function() invMat
  list(SetMat=SetMat, getMat=getMat,
       setinverse=setinverse,
       getinverse=getinverse)
 }



## Write a short comment describing this function
##cacheSolve function takes the matrix makeCacheMatrix's output as an input and checks inverse matrix from makeCacheMatrix has any value in it. If that inverse matrix is empty, it gets the original matrix data. Otherwise, if that inverse matrix has some value in it, it returns a message and cached object.
cacheSolve <- function(x, ...) {invMat <- x$getinverse()
if(!is.null(invMat)){
  message("getting cached data")
  return(invMat)
}
Matdata <- x$getMat
invMat <- solve(Matdata, ...)
x$setinverse(invMat)
invMat ## Return a matrix that is the inverse of 'x'
}
        
