solve :- solve(10, 6, RES), writeln(RES).
solve(N, M, RES):- DIFF is N - M, fac(N, F1), fac(DIFF, F2), RES is F1 / F2.

fac(0, 1).
fac(N, F) :- N > 0, N1 is N - 1, fac(N1, F1), F is N * F1.


:- write("Total number of combinations: ").
:- solve.
