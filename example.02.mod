# Model window for Example 02

param numBridges;
param numYears;


set Bridges := 1..numBridges; 
set Years   := 1..numYears;

param currentCondition{b in Bridges}; 
param deteriorationRate;


var maintenance{i in Bridges, t in Years} >= 0; 
var reliability{i in Bridges, t in Years};



####OBJECTIVE FUNCTION 
minimize totalCost: sum{i in Bridges, t in Years} maintenance[i,t];


#### CONSTRAINTS
s.t. initialCondition{i in Bridges}: reliability[i,1] = currentCondition[i];

s.t. deterioration{i in Bridges, t in 2..numYears}: 
reliability[i,t] = reliability[i,t-1] - deteriorationRate + maintenance[i,t]; 

s.t. reliabilityLB{i in Bridges, t in Years}: reliability[i,t] >= 70; 

s.t. reliabilityUB{i in Bridges, t in Years}: reliability[i,t] <= 100;
