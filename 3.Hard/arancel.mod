set I := {1..3}; 
set J := {1..3};

param C{J};
param V{J};
param PE{J};
param PRESU{I};
param M = 10000000;

var x{I,J} >= 0 integer;
var y{I} binary;
var A{I} >= 0;
var SP{I}>= 0;

maximize z: sum{i in I, j in J} x[i,j]*(V[j]-C[j]) - (sum{i in I}2000*SP[i] + sum{i in I} A[i]);
s.t.
rPeso{i in I}: sum{j in J} x[i,j]*PE[j] <= 50 + SP[i];
presu{i in I}: sum{j in J} x[i,j]*C[j] <= 3000000 + y[i]*PRESU[i];
impue{i in I}: A[i] >= sum{j in I} x[i,j]*C[j]*0.15 - (1-y[i])*M;
