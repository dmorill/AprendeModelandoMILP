set I := {1..20};
param Tmax = 40;
set T := {1..Tmax};
set FIN := {17, 18, 19, 20};
set SUCE := {(6, 1), (6, 2), (7, 2), (7, 3), (8, 3), (8, 4), 
			(9, 4), (9, 5), (10, 6), (11, 6), (11, 7), (12, 8), 
			(12, 9), (13, 9), (14, 11), (15, 14), (15, 16), 
			(16, 12), (17, 14), (18, 14), (18, 15), (19, 15), 
			(19, 16), (20, 16)};
param D{I};
param M = 100000;
var x{I,T} binary;
var horas >= 0;
minimize z : sum{i in I, t in T} x[i,t]*D[i] + horas;
s.t.
r1{i in I}: sum{t in T} x[i,t] <= 1;
r2: sum{t in T, i in FIN} x[i,t] >= 1;
r3{(i,j) in SUCE}: sum{t in T} x[j,t]*(t+D[j]) <= M*(1 - sum{t in T} x[i,t]) + sum{t in T} x[i,t]*t;
r4{(i,j) in SUCE}: sum{t in T} x[j,t] >= sum{t in T} x[i,t]; 
r5: horas = sum{i in FIN, t in T} x[i,t]*(t+D[i]);
