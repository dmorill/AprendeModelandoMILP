set I:= {1..5};

param U{I};

var x{I} binary;

maximize z: sum{i in I}(U[i]*x[i]);
s.t.
r1: x[1]<=x[4];
r2: x[1]<=2-x[2]-x[3];
r3: x[2]=1-x[5];
r4: x[4]+x[3]<=1+x[2];
r5: x[2]<=x[4];
r6: x[2]<=x[3];
