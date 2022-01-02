set T := {1..4};

param dem{T};
param h;
param ce;
param cap;
param capE;

var x{T} >= 0 integer;
var e{T} >= 0 integer;
var I{T union {0}} >= 0 integer;

minimize z: sum{t in T} (e[t]*ce + I[t]*h);
s.t.
r1{t in T}: x[t] <= cap;
r2{t in T}: e[t] <= capE;
r3{t in T}: I[t-1] + x[t] + e[t] = dem[t] + I[t];
r4: I[0] = 0;
r5: I[4] = 0;
