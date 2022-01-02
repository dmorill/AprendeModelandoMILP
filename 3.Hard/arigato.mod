set A :={1..6};
set T :={1..6};
set J :={1..8};
set AA :={1..6 by 2};

param Dem{A,T};
param Cap = 8*10;
param a{A,J};
param h{A};
param r{A};
param Dia{T};

var x{A,T} >= 0 integer;
var I{A,{0} union T} >= 0 integer;
var s{A,T} >= 0 integer;
var y binary;

maximize z: sum{i in A, t in T} (s[i,t]*r[i] - h[i]*I[i,t]);
s.t.
r1{i in A, t in T}: s[i,t] <= Dem[i,t];
r2_1{t in T}: sum{j in J, i in AA} x[i,t]*a[i,j] <= Cap*Dia[t]*y;
r2_2{t in T}: sum{j in J, i in A diff AA} x[i,t]*a[i,j] <= Cap*Dia[t]*(1-y);
r3_1{t in T, i in AA}: x[i,t] >= 10*y;
r3_2{t in T, i in A diff AA}: x[i,t] >= 10*(1-y);
r4{t in T, i in A}: I[i,t-1] + x[i,t] = s[i,t] + I[i,t];
r5{i in A}: I[i,0] = 0;
