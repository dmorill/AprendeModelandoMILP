set L := {1..24};
set B := {1..22};

param C{L};
param A{L,B};

var x{L} binary;

minimize z: sum{i in L} C[i]*x[i];
s.t.
r1{j in B}: sum{i in L} x[i]*A[i,j] >= 1; 