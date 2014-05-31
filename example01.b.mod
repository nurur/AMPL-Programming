set P;
param a {P};
param b;
param c {P};
param u {P};

var X {P};

maximize TotalProfit: sum {j in P} c[j] * X[j];

subject to constraint1: sum {j in P} (1/a[j]) * X[j] <= b;
subject to constraint2 {j in P}: 0 <= X[j] <= u[j];


#subject to Time: sum {j in P} (1/a[j]) * X[j] <= b;
#subject to Limit {j in P}: 0 <= X[j] <= u[j];
