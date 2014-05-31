#Stochastic Linear Program


param w1 := (1.00 + 3.00*Uniform01());
param w2 := (0.33 + 0.67*Uniform01());


var X >=0;
var Y >=0;


minimize objFun:  X + Y;


s.t.  cond1: w1*X + Y >= 7;
s.t.  cond2: w2*X + Y >= 4;
