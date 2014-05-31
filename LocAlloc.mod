## Non-linear Example: Location Allocation

##SETS
set R; 							 # Set of Regions;
set D; 							 # Set of Depots;

##VARIABLES
var xdep{D};
var ydep{D};
var trips{R,D}>=0;

#PARAMETERS
param xreg{R};
param yreg{R};
param annualtrips{R};

#OBJECTIVE FUNCTION

minimize Distance: sum{d in D, r in R} (trips[r,d]*sqrt((xreg[r]-xdep[d])^2+(yreg[r]-ydep[d])^2));

#CONSTRAINTS

subject to Annualtrips{r in R}:
sum{d in D} trips[r,d] = annualtrips[r];
