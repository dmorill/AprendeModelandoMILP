set I := {1,2};
set J := {1..4};

param Gas;
param kmGalon{I};
param Cap{I};
param Dis{J};
param pF{I,J};
param M;

var x{I,J} >=0 integer;
var y{J} binary;

minimize z: sum{i in I, j in J} log(pF[i,j])*x[i,j];
s.t.
cap{i in I}: sum{j in J} x[i,j] <= Cap[i];
Gaso: sum{i in I, j in J} (2*Dis[j]/kmGalon[i]+150)*x[i,j] <= Gas;
rela1{j in J}: sum{i in I} x[i,j] <= y[j]*M;
rela2{j in J}: sum{i in I} x[i,j] >= y[j];
min2: sum{j in J} y[j] >= 2;
