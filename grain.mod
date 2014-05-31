#### SET #####

set GRAIN;        
set NUTRIENT;     


#### PARAMETER #####

#percentage of nutrients in grains 
param n_percent{GRAIN,NUTRIENT} >= 0;

#cost of grains 
param cost{GRAIN} >= 0;

#upperbound and lowerbound for the percentage grains 
param u_grain{GRAIN} >= 0;
param l_grain{GRAIN} >= 0;

#upperbound and lowerbound for the percentage nutrients
param u_nutrient{NUTRIENT} >= 0;
param l_nutrient{NUTRIENT} >= 0;


# decision variable 
var G_percent{GRAIN} >= 0;



# objective function 
minimize TotalCost: 
    sum{i in GRAIN} cost[i]*G_percent[i];



# total percentage should be 100% 
subject to Flour: 
    sum{i in GRAIN} G_percent[i] = 100;

# grain percentage <= upper bound 
subject to Grain_u{i in GRAIN}: 
    G_percent[i] <= u_grain[i];

# grain percentage >= lower bound 
subject to Grain_l{i in GRAIN}: 
    G_percent[i] >= l_grain[i];

# nutrient percentage <= upper bound 
subject to Nutri_u{j in NUTRIENT}: 
sum {i in GRAIN} G_percent[i] * n_percent[i,j] / 100 <= u_nutrient[j]; 

# nutrient percentage >= lower bound
subject to Nutri_l{j in NUTRIENT}: 
sum {i in GRAIN} G_percent[i] * n_percent[i,j] /100 >= l_nutrient[j]; 
