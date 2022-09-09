var x1 >= 0 integer;
var x2 >= 0 integer;
var x3 >= 0 integer;
var x4 >= 0 integer;
var x5 >= 0 integer;
var x6 >= 0 integer;

minimize z: x1 + x2 + x3 + x4 + x5 + x6 ;
s.t.
r1: x1 + x6 >= 14;
r2: x1 + x2 >= 6;
r3: x2 + x3 >= 12;
r4: x3 + x4 >= 5;
r5: x4 + x5 >= 11;
r6: x5 + x6 >= 8;
