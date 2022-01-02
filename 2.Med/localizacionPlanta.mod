set I := {1..4};
set J := {1..4};

param CF{{3,4}};
param CT{I,J};
param DEM{J};
param CAP{I};

var x{I,J} >= 0 integer;
var y{{3,4}} binary;

minimize z: sum{i in I, j in J} x[i,j]*CT[i,j] + sum{i in {3,4}} y[i]*CF[i];
s.t.
rDem{j in J}: sum{i in I} x[i,j] >= DEM[j];
rCap{i in {1,2}} : sum{j in J} x[i,j] <= CAP[i];
rCap2{i in {3,4}} : sum{j in J} x[i,j] <= CAP[i]*y[i];
rFabri: sum{k in {3..4}} y[k] = 1;