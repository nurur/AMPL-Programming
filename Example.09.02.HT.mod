#Problem 9.2a.4  (Operations Research Hamdy Taha) 


param S := 4;


var X{1..S} integer >= 0; 
var Y integer >=0;


minimize Herd: Y;


subject to son1: X[1] >= 0.50*Y;
subject to son2: X[2] >= 0.33*Y;
subject to son3: X[3] >= 0.11*Y;
subject to char: X[4]  = 1;

subject to total: sum{i in 1..S} X[i] = Y; 
 
