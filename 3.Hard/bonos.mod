set T := {1..4};
set I := {1..3};

param C{I};
param TC{I};

var Tengo{T union {0}} >= 0;
var Sobra{T} >= 0;
var x{I,T} integer >= 0;

maximize z: Tengo[4];
s.t.
rPres{t in T}: Sobra[t] = Tengo[t-1] - sum{i in I} x[i,t]*C[i];
rini1: Tengo[0] = 10000000;
r1: Tengo[1] = Sobra[1] + x[1,1]*TC[1]*C[1];
r2: Tengo[2] = Sobra[2] + x[1,1]*TC[1]*C[1] + 
				x[1,2]*TC[1]*C[1] + x[2,2]*TC[2]*C[2];
r3: Tengo[3] = Sobra[3] + x[1,1]*(1+TC[1])*C[1] + 
				x[1,2]*TC[1]*C[1] + x[2,2]*(1+TC[2])*C[2] +
				x[2,3]*TC[2]*C[2] + x[3,3]*(1+TC[3])*C[3];
r4: Tengo[4] = Sobra[4] + x[1,2]*(1+TC[1])*C[1] + 
				x[2,3]*(1+TC[2])*C[2] + x[3,4]*(1+TC[3])*C[3];
