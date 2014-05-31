#Canadian Forest Products Operation Planning
##CFPL.MOD


######### SETS
# Log Qualities;
set Q;

# Log Vendor Number;
set V;

# Veneer thickness
set T;

# Plywood sheets thickness (final)
set U;

# Veneer grade
set G;

# Veneer grade prime
set GP;

#Products per each final thickness u
set P;


########## VARIABLES
#Logs of quality q bought from vendor v and peeled into green veneer of thickness t per month
var w{Q,V,T}>=0; 

#Number of square feet of thickness t, grade g green veneer purchased directly per month 
var x{T,G}>=0;

#Number of sheets of thickness t veneer used as grade gp after drying and processing from 
#grade g green #veneer per month
var y{T,G,GP}>=0;

#Number of sheets of thickness u, final product p (look at p definition)
var z{U,P}>=0;		  



##PARAMETERS
#Square feet required for each sheet of finished veneer
param r = 35;

#Press capacity limit (hours)
param PressLimit = 4500;

#Logs availability
param AVAILOGS{V,Q};

#Cost per log ($ Canadian)
param COSTLOG{V,Q};

#Availability (sq.ft/month) for purchase of green veneer of t thickness and g grade
param AVAILVEN{T,G};

#Cost/sqft purchased
param COSTVEN{T,G};

#Estimated yield from peeling a log of certain grade and thickness
param YIELD{V,Q,T,G};

#Market per month
param MARKET{P,U};

#Final product price
param PRICE{P,U};

#Pressing time for final product (hours)
param PRESSTIME{P,U};

######################
# Objective Function #
######################

maximize Margin:
sum{u in U,p in P} PRICE[p,u]*z[u,p] - 
sum{v in V,q in Q,t in T} COSTLOG[v,q]*w[q,v,t] - 
sum{t in T,g in G} COSTVEN[t,g]*x[t,g];



###############
# Constraints #
######################################################################################################
# 1.  Log availability limits 
subject to LogAvailabilityLimit{v in V, q in Q}:
sum{t in T} w[q,v,t]<=AVAILOGS[v,q];
######################################################################################################
# 2. Purchased veneer availability limits
subject to PurchasedVeenerAvailability{t in T, g in G}:
x[t,g]<=AVAILVEN[t,g];
#####################################################################################################
# 3. Market size limits
subject to MarketSizeLimits{u in U, p in P}:
z[u,p]<=MARKET[p,u];
#####################################################################################################
# 4. Pressing capacity limit
subject to PressingCapacityLimit:
sum{u in U, p in P} PRESSTIME[p,u]*z[u,p]<=PressLimit;
#####################################################################################################
# 5a. Balance A
subject to BalanceA{t in T}:
sum{q in Q, v in V} YIELD[v,q,t,"A"]*w[q,v,t]+x[t,"A"]>=r*(y[t,"A","A"]+y[t,"A","B"]);
#####################################################################################################
# 5a. Balance B
subject to BalanceB{t in T}:
sum{q in Q, v in V} YIELD[v,q,t,"B"]*w[q,v,t]+x[t,"B"]>=r*(y[t,"B","A"]+y[t,"B","B"]+y[t,"B","C"]);
#####################################################################################################
# 5c. Balance C
subject to BalanceC{t in T}:
sum{q in Q, v in V} YIELD[v,q,t,"C"]*w[q,v,t]+x[t,"C"]>=r*(y[t,"C","B"]+y[t,"C","C"]);
####################################################################################################
# 6a. BalanceSheets A, 1/6
subject to BalanceSheets1:
y["1/16","A","A"]+y["1/16","B","A"]=z["1/4","AB"]+z["1/4","AC"]+z["1/2","AB"]+z["1/2","AC"];
####################################################################################################
# 6b. BalanceSheets B, 1/16
subject to BalanceSheets2:
y["1/16","A","B"]+y["1/16","B","B"]+y["1/16","C","B"]=z["1/4","AB"]+z["1/4","BC"]+z["1/2","AB"]+z["1/2","BC"];
####################################################################################################
# 6c. BalanceSheets C, 1/16
subject to BalanceSheets3:
y["1/16","B","C"]+y["1/16","C","C"]=z["1/4","AC"]+z["1/4","BC"]+z["1/2","AC"]+z["1/2","BC"];
####################################################################################################
# 6d. BalanceSheets B, 1/8
subject to BalanceSheets4:
y["1/8","A","B"]+y["1/8","B","B"]+y["1/8","C","B"]=z["1/2","AB"]+z["1/2","AC"]+z["1/2","BC"];
####################################################################################################
# 6e. BalanceSheets C, 1/8
subject to BalanceSheets5:
y["1/8","B","C"]+y["1/8","C","C"]=z["1/4","AB"]+z["1/4","AC"]+z["1/4","BC"]+(2)*z["1/2","AB"]+(2)*z["1/2","AC"]+(2)*z["1/2","BC"];
####################################################################################################



