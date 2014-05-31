
set A;
set B;


param UPA{A};
param UPB{B};
param XL{A};
param XU{A};
param YL{B};
param YU{B};


var X{A} >= 0;
var Y{B} >= 0;
var U{A} binary;
var V{B} binary;


minimize  purchaseCost : sum{i in A} (UPA[i]*X[i]) + 
                         sum{j in B} (UPB[j]*Y[j]);


#Requirement of Product 1 from vendor A and B
subject to prod1AB: 
X[1] + Y[1] + X[2] + Y[2] >=  500;

#Requirement of Product 2 from vendor A and B
subject to prod2AB:  
X[3] + X[4] + Y[3]        >= 1000;

#Requirement of Product 3 from vendor A and B
subject to prod3AB:  
X[5]+X[6]+X[7]+Y[4]+Y[5]  >= 2500;

#Vendor A can not provide more than 2500 unit of any product 
subject to capacityA:  
sum{i in A} X[i] <= 2500;

#Vendor B can not provide more than 2000 unit of any product 
subject to capacityB:  
sum{j in B} Y[j] <= 2000;

#Lower and Upper limit on X 
subject to constraint7a {i in A}:  
X[i] <= XU[i]*U[i];

subject to constraint7b {i in A}:  
X[i] >= XL[i]*U[i];

#Lower and Upper limit on Y
subject to constraint8a {j in B}:  
Y[j] <= YU[j]*V[j];

subject to constraint8b {j in B}:  
Y[j] >= YL[j]*V[j];


#Restriction on vendor A
subject to restrictionA:  
sum{i in A} (X[i]) <= (sum{i in A}(X[i]) + sum{j in B}(Y[j]));


subject to new1:
U[6] <= U[5];

subject to new2:
U[7] <= U[6];

