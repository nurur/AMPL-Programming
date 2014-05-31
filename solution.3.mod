
set S;

param C{S};
param P{S};
param Q{S};


var X{S} binary;

maximize Objective : sum{i in S} (C[i]*X[i]);


subject to supply:
sum{i in S} (P[i]* X[i]) <= 1;

subject to demand:
sum{i in S} (Q[i]* X[i]) >= 2;


