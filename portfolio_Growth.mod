set A;   		# asset categories
set T := {1973..1994}; 	# number of years


param lambda default 200;


param R {T,A};

param mean {j in A}
    := ( sum{i in T} R[i,j] )/card(T);

param Rtilde {i in T, j in A}
    := R[i,j] - mean[j];

param Cov {j in A, k in A}
    := sum {i in T} (Rtilde[i,j]*Rtilde[i,k]) / card(T);

param Corr {j in A, k in A}
    := Cov[j,k]/sqrt(Cov[j,j]*Cov[k,k]);



var x{A} >=0; 



minimize growth_rate:
    - sum{i in T} log (sum{j in A} x[j]*R[i,j]) / card{T};


subject to tot_mass:
    sum{j in A} x[j] = 1;
