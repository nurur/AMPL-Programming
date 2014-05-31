##Model file for Assignment 2 (Problem 4.18)

#### SET ####
set S;


#### PARAMETER ####
param C{S};


#### DECISION VARIABLE ####
var X >= 0;
var Wp{S} >= 0;
var Wm{S} >= 0;



#### OBJECTIVE FUNCTION ####
minimize boxPosition : sum{j in S} (Wp[j] + Wm[j]);



##### CONSTRAINTS ####
subject to constraint {j in S}:
X - C[j] = Wp[j] - Wm[j];