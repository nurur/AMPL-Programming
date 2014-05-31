set METAL; 
set ALLOY; 


param avail   {METAL} >= 0; 
param portion {METAL,ALLOY} >= 0;
param price   {ALLOY} >= 0; 


var X {ALLOY} >= 0; 


maximize grossRevenue: sum {j in ALLOY} price[j] * X[j]; 


subject to metalAvail {i in METAL}: 
        sum {j in ALLOY} portion[i,j] * X[j] <= avail[i];
