set I:={1..5};
set J:={1..4};

param u{I};
param d{I};
param a{I,J};
param m{J};

var x{I} >=0 integer;

maximize z:sum{i in I} x[i]*u[i];
s.t.
r1{j in J}: sum{i in I} a[i,j]*x[i] <= m[j];
r2{i in I}: x[i] <= d[i];