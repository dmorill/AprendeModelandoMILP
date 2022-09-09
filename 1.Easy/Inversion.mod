set I:={1..3};
set J:={1..4};

param C{I}>=0;
param PV{I}>=0;

var x{I,J}>=0 integer;

maximize z: sum{i in I,j in J} PV[i]*x[i,j] - sum{i in I,j in J} C[i]*x[i,j];
s.t.
r1:sum{i in I,j in J} C[i]*x[i,j] <= 3000000;
r2{j in J}:sum{i in I} x[i,j] <= 12;
