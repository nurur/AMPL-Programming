#Portfolio Optimization 


set S;

param MA;
param mean{S} >= 0;
param Q{S,S}  >= 0;


#Decision Variables
var X{S} >= 0;
var t    >= 0;
var Y{S} binary;



#Objective Function 
minimize portfolioRisk : t; 



# General Constraints 
subject to socConstraint: t >= sum{i in S , j in S} (Q[i,j]*X[i]*X[j]);


subject to budget: sum{i in S} X[i] = 1;
subject to portfolioReturn: sum{i in S} (mean[i]*X[i]) >= 11;


#### Cardinal Constraint
subject to cardinality1: sum{i in S} Y[i] <= MA; 
subject to cradinality2 {i in S}: X[i] <= 0.499*Y[i];
subject to cradinality3 {i in S}: X[i] >= 0.001*Y[i];


