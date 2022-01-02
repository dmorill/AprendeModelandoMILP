set T:={1..6};
set M:={1,2};

param C{T,T,M};

var X{T,T,M} binary;

minimize z: sum{i in T, j in T, m in M} X[i,j,m]*C[i,j,m];
s.t.
r1{j in T, m in M}: sum{i in T} X[i,j,m] <= 1;
r2{i in T}: sum{j in T, m in M} X[i,j,m] = 1;
r3{j in T diff {1}, m in M}: sum{i in T} X[i,j,m] <= sum{i in T} X[i,j-1,m]; 
