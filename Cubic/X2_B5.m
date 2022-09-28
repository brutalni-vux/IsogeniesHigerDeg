_<t>:=RationalFunctionField(Rationals());

//form of j-invariant giving B(5) as image of Galois
f1 := (t^2 + 10*t + 5)^3/t;

//form of j-invariant allowing mod 2 image to have 3 elements (curve X_2 as per Rouse)
f2 := t^2 + 1728;

R<x,y> := PolynomialRing(Rationals(), 2);
C := ProjectiveClosure(Curve(AffineSpace(R),Numerator(Evaluate(f1,x)-Evaluate(f2,y))));

"We need to find rational points on C:";
C;
"";

"Genus is:", Genus(C);

pts := Points(C : Bound := 10);

E, mp := EllipticCurve(C, pts[1]);
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

"Hence, no appropriate j-invariants exist";
