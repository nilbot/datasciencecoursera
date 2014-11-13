#  Data Scientist's Toolbox

<!-- skipping week 1 and 2 materials, will add them later -->

## Week 3

### Questions are more important than data

> And there are several types of Questions

1. Descriptive
> Goal: Describe a set of data

   1.1 The first kind of data analysis performed

   1.2 Commonly applied to census data

   1.3 The description and interpretation are *different* steps

   1.4 Descriptions can usually **not** be **generalized** without additional statistical modeling

2. Exploratory
> Goal: Find relationships you didn't know about

    2.1 Exploratory models are good for *discovering new connections*

    2.2 They are also useful for defining future studies

    2.3 Exploratory analyses are usually not the final say

    2.4 Exploratory analyses alone should **not** be used for **generalizing/predicting**

    2.5 ***Correlation does not imply causation***

3. Inferential
> Goal: Use a relatively small sample of data to say something about a bigger population

  3.1 ***Inference is commonly the goal of statistical models***

  3.2 Inference involves estimating both the quantity you care about and your uncertainty about your estimate (*hypothesis?*)


4. Predictive
> Goal: To use the data on some objects to predict values for another object

  4.1 ***If X predicts Y it does not mean that X causes Y***

  4.2 Accurate prediction depends heavily on measuring the **right** variables (i can image, but need more intuitions/examples)

  4.3 Although there are better and worse prediction models, more data and a simple model works really well

  4.4 Prediction is very hard, especially about the future references

5. Causual
> Goal: To find out what happens to one variable when you make another variable change.

  5.1 Usually **randomized** studies are required to identify causation

  5.2 There are approaches to inferring causation in non-randomized studies, but they are complicated and sensitive to assumptions

  5.3 Causal relationships are usually identified as average effects, but may not apply to every individual

  5.4 Causal models are usually the "gold standard" for data analysis (i can image, but need more intuitions/examples)

6. Mechanistic
> Goal: Understand the exact changes in variables that lead to changes in other variables for individual objects.

  6.1 Incredibly hard to infer, except in simple situations (i can image, but need more intuitions/examples)

  6.2  Usually modeled by a deterministic set of equations (physical/engineering science)

  6.3 Generally the random component of the data is measurement error (but what about NASA/ESA mission in which the spacecraft ***has*** to identify known pattern through noise? am I asking the wrong question?)

  6.4 If the equations are known but the parameters are not, they may be inferred with data analysis

These are ordered in ascending difficulty.