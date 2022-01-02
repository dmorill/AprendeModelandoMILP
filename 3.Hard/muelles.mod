set I := {1..6}; #muelle
set J := {1..10}; #Productos
set A := {(1,2), (1,9), (2,8), (8,9)};

param Cap{J}; #Cantidad de producto j que se puede almacenar en cada muelle
param Dem{J}; #Cantidad requeridad de producto j en bodega
param C{I,J}; #Costo manejo y mantenimiento de producto j en el muelle i
param M = 100000;

var X{I,J} >= 0; #Cantidad de producto j a almacenar en muelle i
var Y{I,J} binary; #1: Si el producto j se almacena en la muelle i, 0: E.O.C
var CONmas{I} >= 0; #Esta variable funciona como contador para la restricción 7
var CONmen{I} >= 0; #Esta variable funciona como contador para la restricción 7
var CostoReal >= 0;

minimize CostoTotal: CostoReal + sum{i in I}(CONmas[i] + CONmen[i]);
s.t.
r1{i in I, j in J}: X[i,j] <= Cap[j];
r2{j in J}: sum{i in I} X[i,j] >= Dem[j];
r3{i in I, j in J}: X[i,j] <= Y[i,j]*M;
r4{i in I, j in J}: X[i,j] >= Y[i,j];
r5{i in I, (k,m) in A}: Y[i,k] <= 1- Y[i,m];
r6{i in I}: X[i,5] = X[i,6];
r7{i in I}: X[i,3] - X[i,4] = CONmas[i] - CONmen[i];
r8: CostoReal = sum{i in I, j in J} C[i,j]*X[i,j];
