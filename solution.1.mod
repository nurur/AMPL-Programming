#Define the set
set S;


#Define parameters 
param   VC{S};      #variable cost
param   FC{S};      #fixed cost
param NC{S,S};      #Average time to call on a doc in each of four district
param   TH{S};      #Total hours per month
param   TC{S};      #Total calls per monthly
param    M{S};      #Maxmimum number of reps that can be assigned (big-M) 



#Define decision variables 
var N{S}   >= 0;     #Number representative assigned to dist i 
var Y{S} binary;
var X{S,S} >= 0;     #Number of calls made to district j by rep assigned to dist i 



#Objective Function: Total cost of assigning reps (in unit of 1000)
minimize repCost : sum{i in S} (VC[i]*N[i] + FC[i]*Y[i]);


#Constraints
subject to supplyConstraint {i in S} :
sum{j in S} NC[i,j] * X[i,j] <= TH[i] * N[i];


subject to demandConstraint {i in S} :
sum{j in S} X[j, i] >= TC[i];


subject to switchConstraint {i in S} : 
N[i] - M[i]*Y[i] <= 0;
