set I := {1,2}; #Avión
set J := {1,2}; #Punto
set K := {1,2,3}; #Número de elementos

param c{I,J};
param cap{I,K};
param demA{K};
param demB;
param capAero{K};

var x{I,J} >= 0 integer;

minimize z: sum{i in I, j in J} c[i,j]*x[i,j];
 
r1{k in K}: sum{i in I} cap[i,k]*x[i,1] >= demA[k];
r2: sum{i in I} cap[i,1]*x[i,2] >= demB;
r3: sum{i in I} x[i,2]*cap[i,2]*1/120 + sum{i in I} x[i,2]*cap[i,3]*1/90 <= 1; 
r4: sum{j in J} x[1,j]*1/120 + sum{j in J} x[2,j]*1/85 <= 1;
r5{k in K}: sum{j in J, i in I} cap[i,k]*x[i,j] <= capAero[k];
