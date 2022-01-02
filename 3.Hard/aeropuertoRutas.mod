set M := {1..4};	#aviones
set I := {1..10};	#nodos
set ES := I diff {1,10}; #escalas
param DD = 6;
set T := {1..DD};	# Periodos de tiempo
set A := {(1,2),(1,3),(1,4),(2,3),(2,4),(2,5),(2,7),
		(2,9),(3,2),(3,7),(3,8),(4,2),(4,5),
		(5,2),(5,4),(5,6),(5,9),(6,5),(6,10),(7,2),(7,3),
		(7,8),(7,9),(8,3),(8,7),(8,9),(9,2),(9,5),(9,7),
		(9,10),(9,8)}; #conjunto de arcos factibles
set INI := {(1,2),(1,3),(1,4)};	#arcos de inici 6
set FIN := {(9,10),(6,10)};	#arcos de fin 1

param Dem;
param MaxPer{ES};
param CapAv;
param Dis{I,I};

var x{M,(i,j) in A,T} >= 0 binary;	#1 si avión m va de i a j en tiempo t
var y{M,(i,j) in A,T} >= 0 integer; # cantidad de personas que van en el avión m de i a j en el tiempo t
var Days >= 0; #días usados

minimize z: sum{m in M, (i,j) in A, t in T} x[m,i,j,t]*Dis[i,j] + 100*Days;	#costo por distancia y dias por su factor de conversion
s.t.
rdias{m in M, (i,j) in A, t in T}: Days >= x[m,i,j,t]*t; #calcular los días máximos
rMaxPer{k in ES, t in T}: sum{(i,j) in A, m in M : j=k} y[m,i,j,t] <= MaxPer[k]; #capacidad máxima de personas en cada nodo
rIni: sum{m in M, (i,j) in INI, t in T} y[m,i,j,t] = Dem; #garantizar que salen 20 pasajeros
rFIN: sum{m in M, (i,j) in FIN, t in T} y[m,i,j,t] = Dem; #garantizar que llegan 20 pasajeros
rBalanceNodos{k in ES, m in M, t in T}: sum{(i,j) in A: j=k} y[m,i,j,t] = sum{(j,i) in A: j=k} y[m,j,i,t]; #balance
rAviPeople1{m in M, (i,j) in A, t in T}: y[m,i,j,t] <= x[m,i,j,t]*CapAv;	#relación entre el uso del avión y la cantidad de personas
rAviPeople2{m in M, (i,j) in A, t in T}: y[m,i,j,t] >= x[m,i,j,t]; #relación entre el uso del avión y la cantidad de personas
avionesNodo{k in I, t in T, m in M}: sum{(i,j) in A : i=k} x[m,i,j,t] <= 1; # cada avión solo puede salir una vez de cada nodo 
