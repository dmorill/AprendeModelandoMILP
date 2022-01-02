set I := {1..5};

param c{I,I};
param d{I};
param M;

var x{i in I, j in I: j<>i} binary;
var y{i in I, j in I: j<>i} >= 0;

minimize z: sum{i in I, j in I: i <> j} y[i,j]*c[i,j];
s.t.
rsalid{i in I}: sum{j in I: j <> i}x[i,j] = 1;
rllega{j in I}: sum{i in I: i <> j}x[i,j] = 1;
#balance{i in I}: sum{j in I: i <> j}x[j,i] = sum{j in I: i <> j}x[i,j]; 
rela{i in I, j in I: i <> j}: y[i,j] <= M*x[i,j];
rInv{j in I diff {1}}: sum{i in I: i <> j} y[i,j] = d[j] + sum{i in I: i <> j} y[j,i];
rini: sum{i in I: i <> 1} y[1,i] = 50;
