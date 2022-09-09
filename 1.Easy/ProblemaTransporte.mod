set I := {1..3};
set J := {1..6};

param Cap{I};
param Dem{J};
param C{I,J};

var X{I,J} >=0 integer;

minimize Z: sum{i in I, j in J} X[i,j]*C[i,j];
s.t.
r1{j in J}: sum{i in I} X[i,j] >= Dem[j];
r2{i in I}: sum{j in J} X[i,j] <= Cap[i];
