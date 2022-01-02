set I:={1,2};
set J:={1..3};
set K:={1,2};

param Dem{I};
param C{I,J,K};
param CapH;
param CapHE;
param CHE;
param T{I,J};

var X{I,J,K} >=0 integer;
var H >=0;

minimize z: sum{i in I, j in J, k in K} C[i,j,k]*X[i,j,k] + CHE*H;
s.t.
Demanda{i in I, j in J}: sum{k in K} X[i,j,k] >= Dem[i];
Extra: H <= CapHE;
Horas: sum{i in I, j in J} (T[i,j]/60)*X[i,j,1] <= H + CapH; 
