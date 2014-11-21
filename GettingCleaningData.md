# Getting and Cleaning Data

## Lessons Notes from swirl Programming

> In this lession, you'll learn how to manipulate data using dplyr. (manipulate 
tabular data)

_the techniques acquired from this swirl Programming session will help me dealing
with data types other than data frames, such as data tables, databases and multi-
dim arrays_

First, I recapped on `read.csv` function, and I was exposed to a bool argument
`stringsAsFactors = F`. At this moment, I don't know what it was for. 

It's a good habit to memorize several routines when it comes to getting data and
cleaning data. Such as `head()` call, `dim()` call, and `str()` etc.

There's also side notes about making sure you are using the right version of the
library: 
> `packageVersion("libraryName")`

The first step is to load data into a *data frame tbl*. (`tbl_df(R_Object)`)
> The main advantage to using a tbl_df over a regular data frame is the printing.

**dplyr supplies five 'verbs' that cover all fundamental data manipulation tasks:
 `select()`, `filter()`, `arrange()`, `mutate()`, and `summarize()`.**

  - `select()` `// select columns`
    - `select(df, variable1, variable2 ...)` I don't need to wrap `variable1` into 
    a `""`, nor must I type `df$variable1`
    - I can also use `:` operator to query a range of columns (variables) very 
    quickly
    - and `-` will specify the negation I want in the selection
  - `filter()` `// select rows`
    - `filter(data, colName == "someThing", anotherColName == "AnotherThing", ...)`
  - ~~`Comparison()` `// with a capital C`~~
  - `arrange()` `// order the rows of a dataset according to the values of a particular variable`
    - to sort in ascending order, just speicify the variable like `arrange(data, var)`
    - the same for descending is `desc(var)`
    - multiple arguments will arrange from left to right, prioritized.
  - the `mutate()` function will create a new variable based on the value of one or more variables already in a dataset (we often want this)
    - `mutate(data, new_column = old_column * 3.14159)`
  - `summarize()` `// collapses the dataset to a single row`
    - for example `summarize(dataset, avg_size = mean(size))` will return a row called
    `avg_size` (and its value, of course)

> end of 1st session