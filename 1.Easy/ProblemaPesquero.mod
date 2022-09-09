var x1>=0 integer;
var x2>=0 integer;

minimize z: 13000*x1 + 10000*x2;
s.t.
r1: 150*x1 + 100*x2 >= 1500;
r2: 100*x1 + 200*x2 >= 600;
r3: 50*x1 + 100*x2 >= 700;
