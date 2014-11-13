<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](http://doctoc.herokuapp.com/)*

- [R Programming](#r-programming)
  - [Lessons Notes from swirl R Programming](#lessons-notes-from-swirl-r-programming)
    - [Sequence](#sequence)
    - [Vector](#vector)
    - [Missing Values](#missing-values)
    - [Subsetting Vectors](#subsetting-vectors)
    - [Matrices and Data Frames](#matrices-and-data-frames)
    - [Logic](#logic)
    - [lapply and sapply](#lapply-and-sapply)
    - [vapply and tapply](#vapply-and-tapply)
    - [Looking at Data](#looking-at-data)
    - [Simulation](#simulation)
    - [Dates and Times](#dates-and-times)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# R Programming

## Lessons Notes from swirl R Programming

### Sequence

* colon operator, increment with 1, or decrement
* seq() func, flags covered:
  * along.with <- length(other_object)
  * length
  * by <- increment step
* rep() func, repetition, flags covered:
  * times <- times
  * each <- element wise rep of the given vector

Examples

```
x <- 1:1000
y <- rep(1,1000)
```


### Vector

Flavors:
* atomic
* list

char vector
* paste() : join the elements into one; argument (collapse string) is the concatinate element

```
paste(input []char, collapse char) // collapse elements of input into one
paste([...]char, sep char) // join ... []char into one
paste([...]object, sep char) // join ... []object into one (element-wise) (and coerced into char type)
```

### Missing Values

> Missing values play an important role in statistics and data analysis. Often, missing values must not be ignored, but rather they should be carefully studied to see if there's an underlying pattern or cause for their missingness.

```
//take 100 samples from a data set (randomly)
//continued with example from Section Sequence
my_sample <- sample(c(x,y),100)
```

* The key takeaway is to be cautious when using logical expressions anytime NAs might creep in, since a single NA value can derail the entire thing.


### Subsetting Vectors

> slices in golang

Index vectors come in four flavors --
* logical
* vectors of positive int
* vectors of negative int
* and vectors of char strings

```
x[!is.na(x) & x > 0]
```

**Question** regarding the above example:
* the evaluation of the subsetting (index vector) is occurred in a left-to-right order? so that condition/statement on the right will 'eat' the result from the left? or its just a vector of indices?

**My Answer** its just a vector of indices

>Suppose I have a vector x <- c(17, 14, 4, 5, 13, 12, 10) and I want to set all elements of this vector that are greater than 10 to be equal to 4. I can use `x[x>10]<-4`

**vectors of char strings** are just like map

```
names(vect2)<-c("foo","bar","norf")
vect2[c("foo","bar")]
```

### Matrices and Data Frames

> matrices can carry only 1 class of data, data frames on the other hand, can contain many different classes

```
dim(my_vector) <- c(4,5)
```

* the above example shows that dim() can both get and ***set*** the dimension of a R object
* and it will *transform* a 20 element vector into a 4x5 matrix. *hmm*...

```
class(my_vector) // yields "matrix"
```

the above example shows class() is like typeof()

> The example that we've used so far was meant to illustrate the point that a matrix is simply an atomic vector with a dimension attribute. A more direct method of creating the same matrix uses the matrix() function.

```
cbind(a vector, b matrix) // a', b  //column bind
```

```
colnames(my_data) <- cnames // the same way dim() can be set
```

*Matrices default are filled up column, this implies the rows are observations, cols are variables.*


### Logic

```
! 5 == 7
```
will work as if `(5==7)`

```
which(ints>7) // where in c#
```

### lapply and sapply

> *apply() offer a concise and convenient means of implementing the Split-Apply-Combine strategy analysis.

> Each of the *apply functions will SPLIT up some data into smaller pieces, APPLY a function to each piece, then COMBINE the results. A more detailed discussion of this strategy is found in Hadley Wickham's Journal of Statistical Software paper titled 'The Split-Apply-Combine Strategy for Data Analysis'.

> Both take a list as input, apply a function to each element of the list, then combine and return the result. lapply() always returns a list, whereas sapply() attempts to simplify the result.

```
lapply(data,class)
sapply(data,class)
sum(data$orange) // Sum(Select(d->d.orange))
```

```
lapply(unique_vals, function(elem) elem[2])
```

### vapply and tapply

vapply might stand for verbose apply: I need to specify the format I receive with the sapply

`table(data$variable)`formats the sums of each variables through data

> tapply Apply a function to each cell of a ragged array, that is to each (non-empty) group of values given by a unique combination of the levels of certain factors.

```
tapply(flags$population, flags$landmass, summary) // summary of populations of each of the landmasses
```

### Looking at Data

```
class(data)
dim(data)
nrow(data)
ncol(data)
names(data)
head(data,10)
tail(data,15)
```


### Simulation

```
flips <- sample(c(0,1),100,replace=TRUE,prob = c(0.3,0.7))
sum(flips)
```

* `rbinom`
* `rnorm`
* `rpois`
* `hist(colMeans(x))`


### Dates and Times

`unclass` to reveal whats internal of a variable

* weekdays()
* months()
* quarters()

`strptime(var, format="%B %Y ...")`

arithmetic operations can be performed on dates and times ` >, <, -`. And `difftime(Sys.time(),t1,units='days')` gives me the diff.

