_<t>:=RationalFunctionField(Rationals());

//form of j-invariant giving B(5) as image of Galois
f1 := (t^2 + 10*t + 5)^3/t;

//form of j-invariant allowing curve X_22 as per Rouse for mod 8 image

tmp := (t^2/6 - 3)/(t^2 + 12*t + 30);
f2 := (32*tmp - 4)/tmp^4;

R<x,y> := PolynomialRing(Rationals(), 2);
C := ProjectiveClosure(Curve(AffineSpace(R),Numerator(Evaluate(f1,x)-Evaluate(f2,y))));

"We need to find rational points on C:";
C;
"";

"Genus is:", Genus(C);

tr, x1, mHyp := IsHyperelliptic(C);

"Is C hyperelliptic?", tr;
"";

"This is the hyperelliptic curve x1:";
x1;
SetClassGroupBounds("GRH");
J:=Jacobian(x1);

A, m := AutomorphismGroup(x1);
AA := [m(a) : a in A];
CQ, quotMap := CurveQuotient(AutomorphismGroup(x1, [AA[3]]));
"";

"Hyperelliptic curve x1 has this quotient CQ:";
CQ;
"";

pts := Points(CQ: Bound := 1000);
E, mpE := EllipticCurve(CQ, pts[1]);
"CQ is actually this rank 0 elliptic curve E:";
E;
"";
rk, b := Rank(E);
assert(rk eq 0 and b);

ptsE := Points(E: Bound := 100);
assert #ptsE eq #TorsionSubgroup(E);

ptsCQ := {@@};

for i in [1..#ptsE] do
    ptsCQ := ptsCQ join Points(ptsE[i]@@mpE);
end for;

"All points on CQ are:";
ptsCQ;
"";

ptsx1 := {@@};
for pt in ptsCQ do
    ptsx1 := ptsx1 join Points(pt@@quotMap);
end for;

"All points on x1 are:";
ptsx1;
"";
"Hence, there are no points on C, apart from singulars:";
SingularPoints(C);

"Hence, such Galois image combination is impossible";
