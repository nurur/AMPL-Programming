##Non-linear Example: Location Allocation Problem 14.07

##SETS
set S; 				           # Set of Disposible Sites;
set C; 			                   # Set of Community;


##VARIABLES
var xS{S};
var yS{S};
var W{S,C} >= 0;


#PARAMETERS
param xC{C};                               # EW-coordinate of Community Location
param yC{C};                               # NS-coordinate of Community Location
param capacity{S};
param demand{C};



#OBJECTIVE FUNCTION
minimize tonMiles: sum{i in S, j in C} (W[i,j] * sqrt((xS[i] - xC[j])^2 + 
                                                      (yS[i] - yC[j])^2));

#CONSTRAINTS
subject to Capacity{i in S}:
sum{j in C} W[i,j] <= capacity[i];

subject to Demand{j in C}:
sum{i in S} W[i,j] = demand[j];
