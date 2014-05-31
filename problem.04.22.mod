##Model file for Assignment 4 (Problem 4.22)

### SET ###
set S;  # number of component
set Q;  # number of quarter



### PARAMETER ###
param V{S};   #value of a component
param T{S};   #time to assemble a component 
param D{Q};   #demand of the final product 



#### DECISION VARIABLE ####
# Non-negative constrained applied 
var X{Q,S} >= 0;
var H{Q,S} >= 0;



#### OBJECTIVE FUNCTION ####
minimize holdingCost : sum{q in Q, j in S} (H[q,j] * 0.05 * V[j]);



#### CONSTRAINTS #####
## Production Hour Capacity
subject to constraint1 {q in Q}:
  sum{j in S} (X[q,j] * T[j]) <= 1150; 


## Balance constraints
## component 1
subject to balanceConstraint1a:
  H[4,1] + X[1,1] = X[1,4] + H[1,1];

subject to balanceConstraint1b {q in 2..4}:
  H[q-1,1] + X[q,1] = X[q,4] + H[q,1];


## component 2
subject to balanceConstraint2a:
  H[4,2] + X[1,2] = 4*X[1,4] + 8*X[1,5] + H[1,2];

subject to balanceConstraint2b {q in 2..4}:
  H[q-1,2] + X[q,2] = 4*X[q,4] + 8*X[q,5] + H[q,2];


## component 3
subject to balanceConstraint3a:
  H[4,3] + X[1,3] = X[1,5] + H[1,3];

subject to balanceConstraint3b {q in 2..4}:
  H[q-1,3] + X[q,3] = X[q,5] + H[q,3];


## component 4
subject to balanceConstraint4a:
  H[4,4] + X[1,4] = X[1,5] + H[1,4];

subject to balanceConstraint4b {q in 2..4}:
  H[q-1,4] + X[q,4] = X[q,5] + H[q,4];


## component 5
subject to balanceConstraint5a:
   H[4,5] + X[1,5] = D[1] + H[1,5];

subject to balanceConstraint5b {q in 2..4}:
   H[q-1,5] + X[q,5] = D[q] + H[q,5];


