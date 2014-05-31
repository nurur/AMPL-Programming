
### SET ####
set S;
set P;


#### PARAMETER ####



#### DECISION VARIABLE ####
var X{S}  >= 0;
var Sp{S} >= 0;
var Sm{S} >= 0;



#### OBJECTIVE FUNCTION ####
minimize SW : sum{j in P} (Sp[j] + Sm[j]);



##### CONSTRAINTS ####
#subject to constraint {j in P}:
#sum{i in 1..3} C[i]*X[i] - D[j] = Sp[j] - Sm[j];

subject to constraint1:
4*X[1] - 1*X[2] + 7*X[3] - 100 = Sp[1] - Sm[1];

subject to constraint2:
9*X[1] - 10*X[2] + 1*X[3] - 150 = Sp[2] - Sm[2];
