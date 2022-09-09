set A:={1..4};
set C:={1..4};

param e {A,C};

var x{A,C} binary;

maximize z: sum{i in A, j in C} e[i,j]*x[i,j];
s.t.
r1{i in A}: sum{j in C} x[i,j] = 1;
r2{j in C}: sum{i in A} x[i,j] = 1;