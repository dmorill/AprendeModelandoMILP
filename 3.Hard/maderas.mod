set I := {1..3};
set J := {1..3};
set K := {1..2};
param Dem{J};
param Costos{K,I};
param CuanMad{J};
var x{I,J,K} >= 0 integer;
var y{I,K} binary;

minimize z: sum{i in I, j in J, k in K} Costos[k,i]*x[i,j,k];
s.t. 
dem{j in J}: 0.9*(sum{i in I, k in K} x[i,j,k]) / CuanMad[j] >= Dem[j];
pre1{i in I}: sum{j in J} x[i,j,1] <= 100*y[i,1];
pre2{i in I}: sum{j in J} x[i,j,2] >= 101*y[i,2];
pre3{i in I}: sum{j in J} x[i,j,2] <= 500*y[i,2];
soloUno{i in I}: sum{k in K} y[i,k] <= 1;

 