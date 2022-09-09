set I = {1..2}; # Tipos de espadas 
set J = {1..2}; # Modalidades de procesamiento
set K = {1..2}; # Máquinas
set M = {1..2}; # Materia prima

param Pe{I}; # Precio de venta de las espadas 
param Ph; # Precio de venta de las espadas 
param C{M}; # Costo de la materia prima 
param Me{M}; # Requerimiento de materia prima de las espadas 
param Mh{M}; # Requerimiento de materia prima de las hachas 
param CapE; # Capacidad máxima de producción espadas
param CapH; # Capacidad máxima de producción hachas 
param CapT; # Capacidad de producción espadas templadas 
param Te{K,J}; # Tiempo de procesamiento espadas 
param Th{K}; # Tiempo de procesamiento hachas 
param Horas; # Tiempo de procesamiento disponible 
param Res{M}; # Reserva de materia pr  

var E{I, J} >=0; # Cantidad de espadas a producir  
var H >=0; #Cantidad de hachas a producir 

maximize z: sum {i in I, j in J} Pe[i]*E[i, j] + Ph*H - sum {m in M} C[m]*(Me[m]*sum {i in I, j in J}E[i, j] + Mh[m]*H);
s.t.
Capacidad: (1/CapE)*sum {i in I, j in J}E[i, j] + (1/CapH)*H <= 1;
Templado: sum {j in J}E[1, j] <= CapT;
HorasMaq{k in K}: sum {j in J, i in I}(Te[k, j]*E[i, j])+ Th[k]*H <= Horas;
CapacidadMP{m in M}: Me[m]*sum {i in I, j in J}E[i, j]+ Mh[m]*H <= Res[m];