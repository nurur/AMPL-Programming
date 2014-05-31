set ORIG; # origins
set DEST; # destinations
set PROD; # products

param supply {ORIG,PROD} >= 0; # availabilities at origins
param demand {DEST,PROD} >= 0; # requirements at destinations
param limit {ORIG,DEST} >= 0, default 625;; # capacities of links
param vcost {ORIG,DEST,PROD} >= 0; # variable shipment cost
param fcost {ORIG,DEST} > 0; # fixed usage cost
param minload >= 0;  # minimum shipment size
param maxserve integer > 0; # maximum destinations served


var Trans {ORIG,DEST,PROD} >= 0; # actual units to be shipped

var Use {ORIG, DEST} binary; # 1 if link used, 0 otherwise

minimize Total_Cost:
sum {i in ORIG, j in DEST, p in PROD} vcost[i,j,p] * Trans[i,j,p]
+ sum {i in ORIG, j in DEST} fcost[i,j] * Use[i,j];

subject to Supply {i in ORIG, p in PROD}:
sum {j in DEST} Trans[i,j,p] <= supply[i,p];

subject to Demand {j in DEST, p in PROD}:
sum {i in ORIG} Trans[i,j,p] = demand[j,p];

subject to Multi {i in ORIG, j in DEST}:
sum {p in PROD} Trans[i,j,p] <= limit[i,j] * Use[i,j];

subject to Min_Ship {i in ORIG, j in DEST}:
sum {p in PROD} Trans[i,j,p] >= minload * Use[i,j];

subject to Max_Serve {i in ORIG}:
sum {j in DEST} Use[i,j] <= maxserve;