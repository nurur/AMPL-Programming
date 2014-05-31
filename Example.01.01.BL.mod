
# Set 
set crops;
set purch;
set sell;


# Parameters
param TotalArea;
param plantCost{crops};
param purchaseCost{purch};
param sellCost{sell};
param yield{crops};


# Decision variables 
var X{crops} >=0;
var Y{purch} >=0;
var W{sell}  >=0;



# Objective function 
maximize profit : sum{s in sell}  sellCost[s]*W[s]  -
                  sum{c in crops} plantCost[c]*X[c] - 
                  sum{p in purch} purchaseCost[p]*Y[p]; 
                  


# Constraints 
s.t. totalArea : sum {c in crops} X[c] <= TotalArea;
s.t. yieldCrop1: yield[1]*X[1] + Y[1] - W[1] >= 200;
s.t. yieldCrop2: yield[2]*X[2] + Y[2] - W[2] >= 240;
s.t. yieldCrop3: yield[3]*X[3] + Y[3] - W[3]-W[4] >= 0;
s.t. quotaCrop3: W[3] <= 6000;
s.t. purchCrop3: Y[3] = 0;
