set I := {0..7};
set A := {i in I,j in I: i <> j};

param c{(i,j) in A};
param puerta{I};

var x{I,I} binary;
var y{I} binary;

minimize z: sum{i in I, j in I: i <> j} c[i,j]*x[i,j] + sum{i in I} y[i]*puerta[i];
s.t.
r1: sum{i in I diff {0}} x[0,i] = 1;
r2: sum{i in I diff {7}} x[i,7] = 1;
r3{j in I diff {0,7}}: sum{i in I: i <> j} x[i,j] = sum{i in I: i <> j} x[j,i];
r4{i in I}: y[i] >= sum{j in I: j <> i} x[j,i];