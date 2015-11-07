## Non-linear Programming Example: Portfolio Selection
# Reference:
# http://orfe.princeton.edu/~rvdb/ampl/nlmodels/
# http://orfe.princeton.edu/~rvdb/ampl/nlmodels/markowitz/index.html


##SETS
set I; 		# Set of Investments;

##VARIABLES
var x{I}>=0;

#PARAMETERS
param cov{I,I};
param geom{I};
param reqreturn=0.11;

#OBJECTIVE FUNCTION

minimize variance: (sum{i in I, k in I} cov[i,k]*x[i]*x[k]);

#CONSTRAINTS

subject to return:
sum{i in I} x[i]*geom[i]>=reqreturn;

subject to one:
sum{i in I} x[i]=1;
