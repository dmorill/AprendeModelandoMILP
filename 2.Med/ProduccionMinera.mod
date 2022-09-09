set I:={1..5};
set J:={1..3};
set T:={1..3};

param C{I,J};
param CF{I,J};
param Cap{J,T};
param Dem{I,T};
param M := 10000000;

var X{I,J,T} >= 0;
var Y{I,J} binary;

minimize z: sum{i in I, t in T, j in J} X[i,j,t]*C[i,j] + sum{i in I, j in J} Y[i,j]*CF[i,j];
s.t.
r1{t in T, j in J}: sum{i in I} X[i,j,t] <= Cap[j,t];
r2{t in T, i in I}: sum{j in J} X[i,j,t] >= Dem[i,t];
r3{i in I, j in J}: sum{t in T} X[i,j,t] <= M*Y[i,j];
