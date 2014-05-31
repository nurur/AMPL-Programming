##Model file for Assignment 3 (Problem 4.20)

#### SET ####
set S;


#### PARAMETER ####
param C{S};


#### DECISION VARIABLE ####
var X >= 0;
var Y >= 0;
var Wp{S} >= 0;
var Wm{S} >= 0;



#### OBJECTIVE FUNCTION ####
#We assume that the length of the longest cable is Y
minimize longestCable : Y;



##### CONSTRAINTS ####
subject to constraint1 {j in S}:
X - C[j] = Wp[j] - Wm[j];

subject to constraint2 {j in S}:
Y >= C[j] + Wp[j] + Wm[j];
