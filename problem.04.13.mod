##Model file for Assignment 1 (Problem 4.13)

#### SET ####
set S;


#### PARAMETER ####
param C{S};


#### DECISION VARIABLE ####
# Non-negative constrained applied 
var X{S} >= 0;



#### OBJECTIVE FUNCTION ####
#minimize TotalCost : 28*(X[1]+ X[2]+ X[3]) + 20*(X[4]+ X[5]+ X[6]);
minimize TotalCost : sum{j in S} (C[j] * X[j]);


##### CONSTRAINTS ####
#5am Shift
subject to constraint1:
X[1] >= 2;

#6am Shift
subject to constraint2:
X[1] + X[2] >= 3;

#7am Shift
subject to constraint3:
X[1] + X[2] + X[3] >= 5;

#8am Shift
subject to constraint4:
X[1] + X[2] + X[3] + X[4] >= 5;

#9am Shift
subject to constraint5:
X[2] + X[3] + X[4] + X[5] >= 3;

#10am Shift
subject to constraint6:
X[3] + X[4] + X[5] + X[6] >= 2;

#11am 
subject to constraint7:
X[4] + X[5] + X[6] >= 4;

#12pm 
subject to constraint8:
X[5] + X[6] >= 6;

#1pm 
subject to constraint9:
X[6] >= 3;
