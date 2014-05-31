set FOODS;
set NUTRIENTS;

var x{FOODS} >= 0;

param cost{FOODS};

param amount{NUTRIENTS, FOODS};

param minimum{NUTRIENTS};

minimize total_cost: sum{j in FOODS} cost[j]*x[j];

subject to min_nutr_day{i in NUTRIENTS}:
sum{j in FOODS} amount[i,j]*x[j] >= minimum[i];

