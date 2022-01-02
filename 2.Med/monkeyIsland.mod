set I := {'A','B','C','D','E','F','G','H','I'};
set J := {1,2};
set Pred := {('A','C'),('A','D'),('B','E'),('C','E'),('E','F'),('D','G'),('F','H'),('G','I')}; 

param dueDate;
param P{I,J};
param costo{I};

var x{I} >= 0 integer;
var y{I} binary;

minimize z: sum{i in I} costo[i]*y[i];
s.t.
r2{i in I}: x[i] + P[i,1]*(1-y[i]) + P[i,2]*y[i] <= dueDate;
r3{(i,k) in Pred}: x[k] >= x[i] + P[i,1]*(1-y[i]) + P[i,2]*y[i]; 
