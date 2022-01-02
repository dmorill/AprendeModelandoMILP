set I := {1..5};
set J := {1..4};
set K := {1..2};

param C{I};
param DEM{J,K};

var x{I,J,K} binary;

minimize z: sum{i in I, j in J, k in K} C[i]*x[i,j,k];
s.t. 
SabDem{j in J, k in K}: sum{i in I} x[i,j,k] >= DEM[j,k];
prece1{i in I, k in K}: x[i,4,k] >= x[i,1,k];
prece2{i in I, k in K}: x[i,2,k] + x[i,3,k] <= 1;
no3set1{i in I, k in K}: sum{j in {1..3}} x[i,j,k] <= 2;
no3set2{i in I, k in K}: sum{j in {2..4}} x[i,j,k] <= 2;


 