set I := {1..3};
set T := {1..5};

param r{I,I,T};

var x{I,I,T} >= 0;

maximize z: sum{i in I} x[3,i,5];
#maximize z: sum{i in I} x[i,3,4]*r[i,3,4];
s.t.
r0: sum{i in I} x[1,i,1] <= 100000;
r1{j in {2,3}}: sum{i in I} x[j,i,1] = 0;
r2{j in I,t in {T} diff {5}}: sum{m in I} x[m,j,t]*r[m,j,t] = sum{m in I} x[j,m,t+1];  