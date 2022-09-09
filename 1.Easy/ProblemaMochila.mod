set P := {1..9};

param U{P};
param V{P};

var x{P} binary;

maximize z: sum{i in P} U[i]*x[i];
s.t.
r1: sum{i in P} V[i]*x[i] <= 1.1;
 