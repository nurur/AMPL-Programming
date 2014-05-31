
var x >= 0;
var t >= 0;
var u >= 0;


minimize Obj : t;

s.t. c1: t*u >= (1-x)^2;
s.t. c2:   x >= u^2;
