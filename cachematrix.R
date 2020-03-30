## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {  #first of all I create 2 objects, x and s, that are a matrix and a null value by default 
    s=NULL
    set<- function(y) {         #I create a set object that allows me to change the value of the matrix.
        x<<-y                   #the value that I assign to Y change the value of x that is in the parent enviroment, I can do this thanks to <<-
        s<<-NULL                #when a new value of the matrix occurs, s (in the parent enviroment, <<-) became null
        
    }
    get<- function() x                  #I create a "get" object that retrieve the value assigned to x from the parent enviroment (that is were x is defined)
    
    setsolve<-function(solve) s<<-solve    # we use <<- too assign input argument to the value of s in the parent environment.
    getsolve<- function() s                  #retrieve the value of s
    list(set=set, get=get, setsolve=setsolve, getsolve=getsolve)  #print a list of the objects(will be helpfull to extract them with $)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    
    s<-x$getsolve #I use $ to extract the value of the solved matrix from from the previous created matrix
    if(!is.null(s)) { #if this value is NOT null (because I run the cachesolve function yet)
        message("getting cached data") #it returns a message in which inform the user that exist cached data about this
        s #and print these data
    }
    data <-x$get() #else it assign to the object data, the value of x (xtracted with x$get from the previous function)
    s<- solve(data,...) #and assign to s the value of the solved data (thus the inverted value of the matrix)
    x$setsolve(s) #set the solved value in the input object, 
    s 
     ## Return a matrix that is the inverse of 'x'
}
