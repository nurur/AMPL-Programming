#Minimizing the design cost by minimizing the volume 
 
param N = 2;
param pi= 3.14153;
 
q
#Decision Variables 
#X[1] diameter, X[2] height
var X{1..N} >= 0;        



#Objective Function 
minimize volume : 2*(pi*X[1]*X[2] + pi*(X[1]**2)/4) + 8*(pi*(X[1]**2)/4);



#Constraints
subject to heightDiam: X[2] <= 2*X[1];
 
subject to topBottom : pi * (X[1]**2/4) * X[2] >= 20;
