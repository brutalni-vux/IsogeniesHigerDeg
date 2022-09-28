_<t>:=RationalFunctionField(Rationals());

//form of j-invariant giving B(5) as image of Galois
f1 := (t^2 + 10*t + 5)^3/t;

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

TorsionSubgroup(E);


ptsE := Points(E: Bound:=100);
assert(#ptsE eq #TorsionSubgroup(E));

"All rational points on C are:";

for i in [1..#ptsE] do
    Points(ptsE[i]@@mp);
end for;

"Hence, two appropriate j-invariants exist";
"They are:";

assert Evaluate(f1, -20) eq Evaluate(f2, 2/41);
Evaluate(f1, -20);

assert Evaluate(f1, -25/4) eq Evaluate(f2, 8/59);
Evaluate(f1, -25/4);

"One can notice that 4-isogeny is defined only over sextic field."
