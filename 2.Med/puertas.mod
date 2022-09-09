set T := {1..5};

param D{T};
param Ch;
param Cf;
param C1;
param C2;
param Num;

var x{T union {0}} >=0 integer;
var I{T union {0}} >=0 integer;
var y{T union {0}} >=0 integer;
var z{T union {0}} >=0 integer;
var m{T union {0}} >=0 integer;

minimize costo: sum{t in T} (C1*(y[t]+z[t]+(z[t]/5)) + C2*m[t]+ Ch*I[t] + Cf*x[t]);
s.t. 
r1{t in T}: I[t-1] + y[t]*Num = D[t] + x[t-1] + I[t] - x[t];
r2{t in T}: y[t] = y[t-1] - m[t-1] + z[t-1] - z[t]/5 + z[t-1]/5;
r3: x[0] = 0;
r4: I[0] = 10;
r5: y[0] = 20; 
r6: z[0] = 0;  
r7: m[0] = 0;
