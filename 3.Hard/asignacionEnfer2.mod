set I := {1..10};
set J := {1..4};
param C{I};
param DEM{J};
param M;
var x{I,J} binary;
var P{J} >= 0;
var yma{I,J} >= 0;
var yme{I,J} >= 0; 
var aux{I,J};
minimize z: sum{i in I, j in J} (yma[i,j] + yme[i,j]);
s.t.
Dem{j in J}: sum{i in I} x[i,j] >= DEM[j];
costos{i in I, j in J}: aux[i,j] = yma[i,j] - yme[i,j];
aux1{i in I, j in J}: aux[i,j] <= C[i] - P[j] + M*(1-x[i,j]);
aux2{i in I, j in J}: aux[i,j] >= C[i] - P[j] - M*(1-x[i,j]);
salarioTurno{i in I, j in J}: P[j] <= C[i]*x[i,j] + M*(1-x[i,j]);
CosT: sum{j in J} DEM[j]*P[j] <= 600;