set T := {1..5};
set P := {0..8};
set SUC := {(0,2),(0,3),(1,3),(1,4),(2,5),(2,6),(3,6),(3,7),(4,7),(4,8)};

param C{P,T};

var x{P,T} binary;

maximize z: sum{p in P, t in T} C[p,t]*x[p,t];

s.t. 
r{p in P}: sum{t in T} x[p,t] = 1;
Suce{(i,j) in SUC}:  sum{t in T} t*x[j,t] <= sum{t in T} t*x[i,t];
