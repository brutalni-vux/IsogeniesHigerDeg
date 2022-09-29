Z4 := Integers(4);

//X_2a by Rouse, check that 4-iso is defined over sextic field

G := sub<GL(2, Z4) | {[1,1,1,2], [1,0,2,3]}>;

Gt := sub<GL(2, Z4)|[Transpose(g) : g in G]>;
S := LineOrbits(Gt);
"Orbit lengths of cyclic subgroups of order 4 of E[4]: ", [#o : o in S];


//X_2b by Rouse, check that 4-iso is defined over sextic field

G := sub<GL(2, Z4) | {[1,1,3,0], [1,0,6,7]}>;

Gt := sub<GL(2, Z4)|[Transpose(g) : g in G]>;
S := LineOrbits(Gt);
"Orbit lengths of cyclic subgroups of order 4 of E[4]: ", [#o : o in S];


//X_3a by Rouse, check that 4-iso is defined over sextic field

G := sub<GL(2, Z4) | {[2,3,3,1], [1,0,3,3]}>;

Gt := sub<GL(2, Z4)|[Transpose(g) : g in G]>;
S := LineOrbits(Gt);
"Orbit lengths of cyclic subgroups of order 4 of E[4]: ", [#o : o in S];


//X_3b by Rouse, check that 4-iso is defined over sextic field

G := sub<GL(2, Z4) | {[0,1,3,1], [1,0,3,3]}>;

Gt := sub<GL(2, Z4)|[Transpose(g) : g in G]>;
S := LineOrbits(Gt);
"Orbit lengths of cyclic subgroups of order 4 of E[4]: ", [#o : o in S];
