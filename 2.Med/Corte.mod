set I:={1,2,3};
set J:={1,2};

param D{I};
param C{J};
param B;
param Vp{I,J};
param Cdes;

var Inv{J} >= 0 integer;
var x{I} >= 0 integer;	

minimize z: sum{i in I} x[i]*D[i]*Cdes + sum{j in J} Inv[j]*C[j];
s.t.
r1{j in J}: sum{i in I} x[i]*Vp[i,j] >= B;
r2{j in J}: Inv[j] = sum{i in I} x[i]*Vp[i,j]-B;