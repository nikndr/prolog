fill :- fill(9).
fill(-1) :- !.
fill(X) :- asserta(d(X)), X1 is X-1, fill(X1).

task1(X) :- d(A), A > 0, d(B), d(C),
            A mod 2 =\= 0,
            B mod 2 =\= 0,
            C mod 2 =\= 0,
            (100 * A + 10 * B + C) mod (10 * A + C) =:= 0,
            X is 100 * A + 10 * B + C.

task2(X) :- d(A), A > 0, d(B),
            X is (1000 * A + 100 * A + 10 * B + B),
            round(sqrt(X)) ** 2 =:= X.

task3 :- d(A), d(B), d(C), d(D),
            NUM is (1000 * A + 100 * B + 10 * C + D),
            NUM =< 1998,
            NUM mod 6  =\= 0,
            NUM mod 10 =\= 0,
            NUM mod 15 =\= 0.
task3(COUNT) :- aggregate_all(count, task3, COUNT).

task4(X) :- task4(X, 1).
task4(X, ELEM) :- SQ is ELEM * ELEM,
                  SQ1  is (ELEM + 1) ** 2,
                  SQ2  is (ELEM + 2) ** 2,
                  SQ3  is (ELEM + 3) ** 2,
                  SQ4  is (ELEM + 4) ** 2,
                  SQ5  is (ELEM + 5) ** 2,
                  SQ6  is (ELEM + 6) ** 2,
                  SQ7  is (ELEM + 7) ** 2,
                  SQ8  is (ELEM + 8) ** 2,
                  SQ9  is (ELEM + 9) ** 2,
                  SQ10 is (ELEM + 10) ** 2,
                  SUM is SQ + SQ1 + SQ2 + SQ3 + SQ4 + SQ5 + SQ6 + SQ7 + SQ8 + SQ9 + SQ10,
                  EXP is round(sqrt(SUM)),
                  (SUM =:= EXP * EXP -> X is ELEM ; NEXT is ELEM + 1, task4(X, NEXT)).

task5(RES) :- task5(1, 9, 9, 8, 0, RES).
task5(A1, A2, A3, A4, C, RES) :- (A1 * 1000 + A2 * 100 + A3 * 10 + A4) =:= 1998, C > 0
                                 -> RES is C
                                 ;  C1 is C + 1,
                                    NEXT_A is (A1 + A2 + A3 + A4) mod 10,
                                    task5(A2, A3, A4, NEXT_A, C1, RES).

:- fill. % comment this line after first file load
:- writeln("\nTask 1:").
:- forall(task1(X), writeln(X)).
:- writeln("\nTask 2:").
:- forall(task2(X), writeln(X)).
:- writeln("\nTask 3:").
:- forall(task3(X), writeln(X)).
:- writeln("\nTask 4:").
:- forall(task4(X), writeln(X)).
:- writeln("\nTask 5:").
:- forall(task5(X), writeln(X)).
