set I := {1..3};
set J := {1..3};
set K := {1..3};

param PC{J,K};
param PG{I,K};
param CostoC{J};
param Presu;
param Disp{{2,3}};
param BA;
param DEM{{1,2}};

var X{I,J} >= 0;

maximize z: sum{j in J} X[3,j];
s.t.
r1{k in {1,3}}: sum{j in J} PC[j,k]*X[1,j] >= PG[1,k]*sum{j in J} X[1,j];
r2: sum{j in J} PC[j,2]*X[1,j] <= PG[1,2]*sum{j in J} X[1,j];
r3{k in {2,3}}: sum{j in J} PC[j,k]*X[2,j] <= PG[2,k]*sum{j in J} X[2,j];
r4: sum{j in J} PC[j,1]*X[2,j] >= PG[2,1]*sum{j in J} X[2,j];
r5{k in {2,3}}: sum{j in J} PC[j,k]*X[3,j] >= PG[3,k]*sum{j in J} X[3,j];
r6: sum{j in J} PC[j,1]*X[3,j] <= PG[3,1]*sum{j in J} X[3,j];
r7: sum{i in I, j in J} X[i,j]*CostoC[j] <= Presu;
r8: sum{i in I} X[i,1] >= BA;
r9{i in {1,2}} : sum{j in J} X[i,j] >= DEM[i];
