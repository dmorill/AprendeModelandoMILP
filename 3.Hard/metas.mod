set I := {1..3}; #Objetivos
set J := {1..3}; #Productos

param a{I,J};
param meta{I};

var x{J} >=0;
var yma{I} >=0;
var yme{I} >=0;

minimize z: yme[1]*6 + 3*yma[2] + 4*yme[2] + 4*yma[3];
s.t.
rMetas{i in I}: sum{j in J} x[j]*a[i,j] - meta[i] = yma[i] - yme[i];
