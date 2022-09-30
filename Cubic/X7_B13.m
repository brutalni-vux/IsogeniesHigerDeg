_<t>:=RationalFunctionField(Rationals());

//form of j-invariant giving B(13) as image of Galois
f1 := (t^2 + 5*t + 13)*(t^4 + 7*t^3 + 20*t^2 + 19*t + 1)^3/t;

//form of j-invariant allowing curve X_7 as per Rouse for mod 4 image
f2 := (32*t - 4)/t^4;

R<x,y> := PolynomialRing(Rationals(), 2);
C := ProjectiveClosure(Curve(AffineSpace(R),Numerator(Evaluate(f1,x)-Evaluate(f2,y))));

"We need to find rational points on C:";
C;
"";

"Genus is:", Genus(C);
pts := Points(C : Bound := 100);

Phi := CanonicalMap(C);
CQ<X,Y,Z> := CanonicalImage(C, Phi);

"Canonical image is CQ:";
CQ;
"";
Points(CQ:Bound:=100);

P<X,Y,Z>:=ProjectiveSpace(Rationals(),2);
X:=Curve(P, [3*X^4 + 78*X^3*Y + 765*X^2*Y^2 + 3294*X*Y^3 + 5103*Y^4 - 8*X^3*Z - 180*X^2*Y*Z -
    1476*X*Y^2*Z - 4212*Y^3*Z - 20*X^2*Z^2 - 336*X*Y*Z^2 - 1332*Y^2*Z^2 -
    16*X*Z^3 - 96*Y*Z^3]);
RR<[u]>:=CoordinateRing(AmbientSpace(X));
dim:=Dimension(AmbientSpace(X));

cf:=[3,24,4,-1/3,-3,-2/3,0,0,1];

H:=Matrix(RationalField(), 3, 3, cf);
rows:=[[&+[RowSequence(H)[i][j]*u[j] : j in [1..dim+1]] : i in [1..dim+1]]] ;
w7:=map<X->X|rows>;
w7;
