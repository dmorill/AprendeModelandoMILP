set L := {1..24};
set B := {1..22};

param P{B};
param A{L,B};

var x{L} binary;

maximize z: sum{i in L, j in B} A[i,j]*P[j]*x[i];
s.t.
r1: sum{i in L} x[i] <= 4; 