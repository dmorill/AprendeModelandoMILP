set I := {1,2};
set J := {1..4};
set K := {1..3};

param M;
param Cmax{K};
param Por{J,K};
param CT{K};
param PV{I};

var X{K,I} >=0;
var Y{K diff {3}} binary;
var Z binary;

maximize z: sum{i in I, k in K} PV[i]*X[k,i] - sum{i in I, k in K} CT[k]*X[k,i];
s.t.
r1{k in {1,2}}: sum{i in I} X[k,i] <= Cmax[k]*Y[k];
r2{k in {3}}: sum{i in I} X[k,i] <= Cmax[k];
r3:sum{k in K} X[k,1]*Por[1,k] <= sum{k in K} X[k,1]*0.4;
r4:sum{k in K} X[k,1]*Por[2,k] <= sum{k in K} X[k,1]*0.75;
r5:sum{k in K} X[k,1]*Por[4,k] >= sum{k in K} X[k,1]*0.3;
r6:sum{k in K} X[k,2]*Por[2,k] >= sum{k in K} X[k,2]*0.25;
r7:sum{k in K} X[k,2]*Por[2,k] <= sum{k in K} X[k,2]*0.8;
r8:sum{k in K} X[k,2]*Por[3,k] >= sum{k in K} X[k,2]*0.5;
r9:sum{k in K} X[k,2]*Por[4,k] <= sum{k in K} X[k,2]*0.66;
r10:Y[1] = 1-Y[2];
r11:X[3,1] <= Z*M;
r12:X[3,2] <= (1-Z)*M;