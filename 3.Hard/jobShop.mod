param m = 5;
param n = 6;
param M = 10000;
set I := {1..m};	#maquinas
set J := {1..n};	#jobs

param P{I,J};
param theta{I,J};

var x{I,J} >= 0;
var z{I,J,J} binary;
var Cmax >= 0;

minimize makespan: Cmax;
s.t.
Prec{j in J,h in {2..m}}: x[theta[h,j],j] >= x[theta[h-1,j],j] + P[theta[h-1,j],j];
Pj1{j in J, k in J, i in I: j < k}: x[i,j] >= x[i,k] + P[i,k] -M*z[i,j,k];
Pj2{j in J, k in J, i in I: j < k}: x[i,k] >= x[i,j] + P[i,j] -M*(1-z[i,j,k]);
FO{j in J}: Cmax >= x[theta[m,j],j] + P[theta[m,j],j];