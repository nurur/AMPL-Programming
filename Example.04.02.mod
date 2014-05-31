##Model file for Example 4.02 (Ronald Rardin)

#######
set S;   #Ingredients (scrap1 scrap2 scrap3 scrap4 nickel chromium molybdenum)
set P;   #Elements    (number of constraints)


#### PARAMETER ####
param   C{S} >= 0.;
param   A{S} >= 0.;
param D{P,S} >= 0.;
param  RL{P} >= 0.;
param  RG{P} >= 0.;


#### DECISION VARIABLE ####
var X{S} >= 0.;


#### OBJECTIVE FUNCTION ####
minimize totalCost : sum{j in S} C[j]*X[j];



##### CONSTRAINTS ####
subject to totalWeight:
 sum{j in S}  X[j] = 1000.0;

subject to constraint1 {i in P}:
 sum{j in S} D[i,j]*X[j] >= RL[i];

subject to constraint2 {i in P}:
 sum{j in S} D[i,j]*X[j] <= RG[i];

subject to availability {j in S}:
 X[j] <= A[j];


#subject to constraint3:
# X[1] <= 75.;

#subject to constraint4:
# X[2] <= 250.;

#subject to nonNegativity {j in S}:
# X[j] >= 0.0
