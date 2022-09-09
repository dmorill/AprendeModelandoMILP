set I:={1..4};

param c{I};
param s{I};
param u{I};

var x{I}>=0 integer;

maximize Z:sum{i in I} x[i]*u[i];
s.t.
r1: sum{i in I} c[i]*x[i] <= 50000;
r2: sum{i in I} x[i] >= 30;
r3: sum{i in {1,2}} x[i] = sum{i in {3,4}} x[i];
r4: sum{i in I} s[i]*x[i] >= 250;
