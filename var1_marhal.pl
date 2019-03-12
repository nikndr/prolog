fill :- fill(9).
fill(-1) :- !.
fill(X) :- asserta(d(X)), X1 is X-1, fill(X1).


% task 11
task11(X).
%  task 12
task12(X).

female(agnes).
female(idit).
female(margo).
female(lussi).
female(sally).
female(holly).
female(gulia).
female(dori).
female(dayni).
female(matulda).
female(hortenzia).
female(depla).
female(flo).
female(agnes).

married(mcqueen, sally).
married(gry, lussi).
married(mater, holly).
married(ramone, flo).
married(mayk, selia).

parents(margo, gry).
parents(idit,gry).
parents(agnes,lussi).
parents(gry,gulia).
parents(dru, gulia).
parents(gulia, ghost).
parents(nafario, ghost).
parents(lussi, baltazar).
parents(rom, baltazar).
parents(kevin,rom ).
parents(idit,rom ).
parents(sally, ramon ).
parents(ramon, doluvay).
parents(luidgy, doluvay).
parents(gvido,luidgy).
parents(mcqueen, doc).
parents(sally, flo).
parents(carera, flo).
parents(holly,carera).
parents(dori, sally).
parents(mac, sally).
parents(donald, dak).
parents(dayni, dak).
parents(matulda, dayni).
parents(donald, hortenzia).
parents(depla,hortenzia).
parents(huey, matulda).
parents(dewey, matulda).
parents(louie, matulda).
parents(mayk, wazowski).
parents(selia, vantuz).
parents(wazowski, chak).
parents(duck, chak).

% task3
male(X) :- married(X, Y), female(Y).
father(X) :- male(X), parents(X, _).
mother(X) :- female(X), parents(X, _).
daughter(X) :- female(X), parents(_, X).
sister(X) :- female(X), parents(Z, X), parents(Z, Y).
brother(X) :- male(X), parents(Z, X), parents(Z, Y).
granny(X) :- female(X), parents(X, Y), parents(Y, Z).
uncle(X) :- male(X), parents(Z, X), parents(Z, Y), parents(Y, _).
brotherinLaw(X) :- male(X), married(X, Y), sister(Y).
motherinLaw(X, Y) :- female(X), parents(X, Z), female(Z), married(Y, Z).
match(X,Y) :- married(M,F), parents(X, F), parents(Y, M).
nephew(X) :- (brother(X); sister(X)), parents(_, X).


% task2 1)
task21(DVA, HUSLO) :-
                      d(D), d(V), d(A), d(H), d(U), d(S), d(L), d(O),
                      D \= V, D \= A, D \= H, D \= U, D \= S, D \= L, D \= O,
                              V \= A, V \= H, V \= U, V \= S, V \= L, V \= O,
                                      A \= H, A \= U, A \= S, A \= L, A \= O,
                                              H \= U, H \= S, H \= L, H \= O,
                                                      U \= S, U \= L, U \= O,
                                                              S \= L, S \= O,
                                                                      L \= O,
                      DVA is D*100 + V*10 + A,
                      HUSLO is H*10000 + U*1000 + S*100 + L*10 + O,
                      HUSLO is DVA * DVA.
% task2 2)
task22(FORTY, TEN, SIXTY) :- d(F), d(O), d(R), d(T), d(Y), d(E), d(N), d(S), d(I), d(X),
                             F \= O, F \= R, F \= T, F \= Y, F \= E, F \= N, F \= S, F \= I, F \= X,
                                     O \= R, O \= T, O \= Y, O \= E, O \= N, O \= S, O \= I, O \= X,
                                             R \= T, R \= Y, R \= E, R \= N, R \= S, R \= I, R \= X,
                                                     T \= Y, T \= E, T \= N, T \= S, T \= I, T \= X,
                                                             Y \= E, Y \= N, Y \= S, Y \= I, Y \= X,
                                                                     E \= N, E \= S, E \= I, E \= X,
                                                                             N \= S, N \= I, N \= X,
                                                                                     S \= I, S \= X,
                                                                                             I \= X,
                             FORTY is F*10000 + O*1000 + R*100 + T*10 + Y,
                             TEN is T*100 + E*10 + N,
                             SIXTY is S*10000 + I*1000 + X*100 + T*10 + Y.
% task 2 3)
task23(BYKVA, SLOVO) :- d(B), d(Y), d(K), d(V), d(A), d(S), d(L), d(O),
                        B \= Y, B \= K, B \= V, B \= A, B \= S, B \= L, B \= O,
                                Y \= K, Y \= V, Y \= A, Y \= S, Y \= L, Y \= O,
                                        K \= V, K \= A, K \= S, K \= L, K \= O,
                                                V \= A, V \= S, V \= L, V \= O,
                                                        A \= S, A \= L, A \= O,
                                                                S \= L, S \= O,
                                                                        L \= O,
                        BYKVA is B*10000 + Y*1000 + K*100 + V*10 + A,
                        SLOVO is S*10000 + L*1000 + O*100 + V*10 + O,
                        SLOVO is BYKVA * 6.


% task 4
% student(name, group(code, group_name(main, fac, univ))).
student(vasya, group(1, group_name(ipz, inf, kma))).
student(sanya, group(1, group_name(ipz, inf, kma))).
student(petya, group(5, group_name(biol, pr, knu))).
student(kolya, group(5, group_name(biol, pr, knu))).
student(vova, group(5, group_name(biol, pr, knu))).

% teacher(name, work(pos, cath, fac), lesson(name, gr_code, hrs)).
teacher(petro, work(vykl, inf, inf), lesson(prog, 1, 10)).
teacher(andrii, work(vykl, inf, inf), lesson(math, 1, 12)).
teacher(oleksandr, work(vykl, inf, inf), lesson(biol, 5, 15)).
teacher(tetyana, work(vykl, biol, pr), lesson(chem, 5, 8)).
teacher(serhii, work(vykl, biol, pr), lesson(phys, 4, 9)).

% який викладач викладає у кожного студента
find_teach(T, S) :- teacher(T, _, lesson(_, GR, _)), student(S, group(GR, _)).
% яке навантаження у кожного студента
sum([Item], Item).
sum([Item1,Item2|Tail], Total) :- X is Item1 + Item2, sum([X|Tail], Total).
hrs(ST, HRS, RES) :- findall(HRS, hrs(ST, HRS), TMP), sum(TMP, RES).
hrs(ST, HRS) :- teacher(_, _, lesson(LES, GR, HRS)), student(ST, group(GR, _)).
% хто з викладачів працює в якому університеті
univ(T, UN) :- teacher(T, work(_, _, FAC), _), student(_, group(_, group_name(_, _, UN))).

% task 5
powlog(_, 0, 1) :- !.
powlog(RES, 1, RES) :- !.
powlog(X, Y, RES) :- Y mod 2 = 0, X1 is X*X, Y1 is Y/2, powlog(X1, Y1, RES).
powlog(X, Y, RES) :- Y1 is Y-1, powlog(X, Y1, RES1), RES is RES1 * X.

div(X, Y, D, M) :- div(X, Y, D, M, 0).
div(X, Y, C, X, C) :- X < Y, !.
div(X, Y, D, M, C) :- X1 is X-Y, C1 is C+1, div(X1, Y, D, M, C1).
