##Model file for Example 4.08 (Ronald Rardin)

### SET ####
set S;
set P;

#### PARAMETER ####
param C{P};


#### DECISION VARIABLE ####
var X{S}  >= 0;
var Y{S}  >= 0;
var Sp{P} >= 0;
var Sm{P} >= 0;



#### OBJECTIVE FUNCTION ####
minimize polePosition : sum{j in P} C[j]*(Sp[j] + Sm[j]);



##### CONSTRAINTS ####
subject to constraint1:
X[1] - X[2] - 0 = Sp[1] - Sm[1];

subject to constraint2:
Y[1] - Y[2] - 0 = Sp[2] - Sm[2];

subject to constraint3:
X[1] - 0 - 300 = Sp[3] - Sm[3];

subject to constraint4:
Y[1] - 0 -1200 = Sp[4] - Sm[4];

subject to constraint5:
X[1] - 0 - 0   = Sp[5] - Sm[5];

subject to constraint6:
Y[1] - 0 - 600 = Sp[6] - Sm[6];

subject to constraint7:
X[2] - 0 - 0  = Sp[7] - Sm[7];

subject to constraint8:
Y[2] - 0 - 600 = Sp[8] - Sm[8];

subject to constraint9:
X[2] - 0 - 600 = Sp[9] - Sm[9];

subject to constraint10:
Y[2] - 0 - 0   = Sp[10] - Sm[10];
