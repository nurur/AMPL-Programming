var XB; 
var XC; 

maximize TotalProfit: 25 * XB + 30 * XC; 

subject to constraint1: (1/200) * XB + (1/140) * XC <= 40; 
subject to constraint2: 10 <= XB <= 6000; 
subject to constraint3: 10 <= XC <= 4000;


#subject to Time: (1/200) * XB + (1/140) * XC <= 40; 
#subject to B_limit: 0 <= XB <= 6000; 
#subject to C_limit: 0 <= XC <= 4000;
