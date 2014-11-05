<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](http://doctoc.herokuapp.com/)*

- [Take Away Notes](#take-away-notes)
  - [Lessons from swirl R Programming](#lessons-from-swirl-r-programming)
    - [Sequence](#sequence)
    - [Vector](#vector)
    - [Missing Values](#missing-values)
    - [Subsetting Vectors](#subsetting-vectors)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

#Take Away Notes

## Lessons from swirl R Programming

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
cbind(a vector, b matrix) // a', b
```

```
colnames(my_data) <- cnames // the same way dim() can be set
```

### Logic