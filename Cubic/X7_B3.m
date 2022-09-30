_<t>:=RationalFunctionField(Rationals());

//form of j-invariant giving B(3) as image of Galois
f1 := (t + 27)*(t + 3)^3/t;

//form of j-invariant allowing curve X_7 as per Rouse for mod 4 image
f2 := (32*t - 4)/t^4;

R<x,y> := PolynomialRing(Rationals(), 2);
C := ProjectiveClosure(Curve(AffineSpace(R),Numerator(Evaluate(f1,x)-Evaluate(f2,y))));

"We need to find rational points on C:";
C;
"";

"Genus is:", Genus(C);

pts := Points(C : Bound := 100);
E, mp := EllipticCurve(C, pts[2]);
E;

rk, b := Rank(E);
assert(rk eq 0 and b);

G, mE := TorsionSubgroup(E);
ptsE := {@@};

for i in [1..#G] do
    ptsE := ptsE join {mE(i*G.1)};
end for;

assert(#ptsE eq #TorsionSubgroup(E));
ptsC := {@@};

"";
"All rational points on C are:";

for i in [1..#ptsE] do
    ptsC := ptsC join Points(ptsE[i]@@mp);
end for;

ptsC;
"";

"Hence, five appropriate j-invariants exist";
"They are:";

assert Evaluate(f1, -27) eq Evaluate(f2, 1/8);
Evaluate(f1, -27);

assert Evaluate(f1, -243) eq Evaluate(f2, -1/40);
Evaluate(f1, -243);

assert Evaluate(f1, -36) eq Evaluate(f2, -2/11);
Evaluate(f1, -36);

assert Evaluate(f1, -81/4) eq Evaluate(f2, 4/23);
Evaluate(f1, -81/4);

assert Evaluate(f1, -3) eq Evaluate(f2, 1/8);
Evaluate(f1, -3);

"Three of those are CM, other two have 4-iso over cubic field, but 8-iso over sextic field.";
