set I = {1..4};
set J = {1..3};

param c{I,J};
param of{I};
param dem{J};

var x{I,J} >= 0;
var H{I,I} >= 0;

minimize z: sum{i in I, j in J} c[i,j]*x[i,j];
s.t.
rDem{j in J}: sum{i in I} x[i,j] >= dem[j];
rOf{i in I}: sum{j in J} x[i,j] <= sum{k in I} H[k,i];
pasar1{i in I}: sum{k in I} H[i,k] <= of[i];
pasar2{i in I}: sum{k in I} H[k,i] >= 10;