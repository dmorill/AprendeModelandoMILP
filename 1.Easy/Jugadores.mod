set I := {1..12};
set J := {1..3};
set A := {(1,3), (2,1), (4,1), (5,3), (6,3), (7,1), (7,2), (9,1), (11,1), (11,3), (12,1)};

param HB{I};
param D{I};
param V{I};
param HD{I};
param MinPlay{J};

var x{I, J} binary;

maximize z: sum{i in I, j in J} D[i]*x[i,j];
s.t.
r1{j in J}: sum{i in I} x[i,j] >= MinPlay[j];
r2: (sum{i in I, j in J} HB[i]*x[i,j])/10 >= 2;
r3: (sum{i in I, j in J} V[i]*x[i,j])/10 >= 2;
r4: sum{j in J} x[5,j] = 1 - sum{j in J} x[11,j] ;
r5: sum{j in J} x[1,j] = sum{j in J} x[6,j];
r6: sum{j in J} x[1,j] = sum{j in J} x[9,j];
r7: sum{j in J} x[2,j] = 1 - sum{j in J} x[4,j];
r8: sum{i in I, j in J} x[i,j]= 10;
r9{i in I}: sum{j in J} x[i,j]<= 1;
r10{(i,j) in A}: x[i,j]=0;
