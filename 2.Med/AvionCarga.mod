set I:= {1..4};
set J:= {1..3};

param u{I};
param P{J};
param V{J};
param C{I};
param Vol{I};

var x{i in I, j in J} >= 0;
var G >= 0;

maximize U: sum{i in I, j in J} x[i,j]*u[i];

s.t.

r1{j in J}: sum{i in I} x[i,j] <= P[j];
r2{j in J}: sum{i in I} x[i,j]*Vol[i] <= V[j];
r3{i in I}: sum{j in J} x[i,j] <= C[i];
r4{j in J}: sum{i in I} x[i,j]/P[j] = G;

