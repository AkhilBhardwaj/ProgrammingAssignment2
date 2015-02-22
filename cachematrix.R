## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
# The function makeCacheMatrix takes a matrix as an input
# This function creates 4 sub-functions set,get,setsolve & getsolve
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
# set function caches the value of the dataset 
        get <- function() x
# get function will return the dataset
        setsolve <- function(solve) m <<- solve
# setsolve function caches the value of the solve function
        getsolve <- function() m
# getsolve function returns the cached value of solve function
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)

# This function returns a list of 4 functions as an output
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getsolve()
# Above line of code calls for cached value of inverse matrix for the input matrix  
# Next line checks if there indeed was an inverse matrix cached earlier. 
# If an inverse matrix was cached earlier, then the same value will be reprinted
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
# The below lines are arrived at only if there was no cached inverse matrix earlier
# In below lines, the inverse would be computed and then cached for future use
        data <- x$get()
        m <- solve(data, ...)
        x$setsolve(m)
        m
        
        
}
