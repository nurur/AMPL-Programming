# Set of crops;
set C;

# Set of scenarios
set S;

# Set of fields   set F;
param p{S} :=1/3;


# Number of acres of crop c to plant
var x{C} >= 0;

# Tons of crop c sold at most favorable price
var w{C} >= 0;

# Tons of crop c sold at unfavorable price
var e{C} >= 0;

# Tons of crop c purchased
var y{C} >= 0;


# Indicator on whether we plant crop c in field f. var z{C,F} binary;
param Yield{C};
param PlantingCost{C};  
param SalePrice{C};  # This is the *favorable* sales price
param MaxAtGoodPrice{C} default Infinity;
param LowSalePrice{C} default 0;
param PurchasePrice{C} default 10000;
param MinReq{C} default 0;
param TotalAcres;
#param Area{F};

maximize Profit:
	 sum{c in C} SalePrice[c]    * w[c] +
         sum{c in C} LowSalePrice[c] * e[c] - 
         sum{c in C} PlantingCost[c] * x[c] -
         sum{c in C} PurchasePrice[c]* y[c];

subject to Land:
	sum{c in C} x[c] <= TotalAcres;

subject to YieldDef{c in C}:
	Yield[c] * x[c] + y[c] - w[c] - e[c] - MinReq[c] = 0;

subject to QuotaRestrict{c in C}:
	w[c] <=  MaxAtGoodPrice[c];


#subject to Zdef{c in C}: 	x[c] = sum{f in F} Area[f] * z[c,f];
#subject to Onlyone{f in F}:  sum{c in C} z[c,f] <= 1;
