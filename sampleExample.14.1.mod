set M;
set N;


param D{N} >=0;
param H{N};          #latitude 
param K{N};          #longitude


#Decision Variables 
var X{N}   >= 0;     #X-coordinate 
var Y{N}   >= 0;     #Y-coordinate 
var W{M,N} >= 0;     #supply from i to j


minimize tonMiles: sum{i in M, j in N} ( W[i,j]*
					 sqrt((X[i]-H[j])**2+(Y[i]-K[j])**2) );


subject to supplies{j in N}:
sum{i in M} W[i,j] = D[j];
