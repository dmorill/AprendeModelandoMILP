var x integer >= 0;
var y integer >= 0;

minimize z: 30*x + 40*y;
s.t.
r1: x*20 + 30*y >= 900;
r2: x*40 + 30*y >= 1200;
