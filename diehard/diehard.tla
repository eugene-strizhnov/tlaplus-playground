---- MODULE diehard ----
EXTENDS TLC, Integers
VARIABLES small, big   

Min(a, b) == IF a < b THEN a ELSE b
Max(a, b) == IF a < b THEN b ELSE a

Init == (small = 0) /\ (big = 0)
TypeOk == /\ small \in 0..3
          /\ big \in 0..5
Not4 == /\ big /= 4


FillSmall == small' = 3 /\ big' = big
FillBig == big' = 5 /\ small' = small

EmptySmall == small' = 0 /\ big' = big
EmptyBig == big' = 0 /\ small' = small

FromSmallToBig == big' = Min(5, big + small) /\ small' = Max(0, big + small - 5)
FromBigToSmall == big' = Max(0, big + small - 3) /\ small' = Min(3, big + small)


Fill == FillSmall \/ FillBig
Empty == EmptySmall \/ EmptyBig
Pour == FromSmallToBig \/ FromBigToSmall

Next == Empty \/ Fill \/ Pour

====