% 1. Напишіть предикат, який перетворює вихідний список у список позицій від'ємних елементів.
neg(X, RES) :- neg(X, [], 0, RES).
neg([], X, _, RES) :- reverse(X, RES), !.
neg([H|T], X, INDEX, RES) :- H < 0,
                             NEXT is INDEX + 1,
                             neg(T, [INDEX|X], NEXT, RES).
neg([H|T], X, INDEX, RES) :- H >= 0,
                             NEXT is INDEX + 1,
                             neg(T, X, NEXT, RES).

% 2. Напишіть предикат, що замінює всі входження заданого елемента на символ change_done.
replace(EL, XS, RES) :- replace(EL, "change_done", XS, RES).
replace(_, _, [], []).
replace(EL, REPL, [EL|T1], [REPL|T2]) :- replace(EL, REPL, T1, T2).
replace(EL, REPL, [H|T1], [H|T2]) :- H \= EL, replace(EL, REPL, T1, T2).

% 3. Напишіть предикат, що перетворює будь-який список арабських чисел (від 1 до 50) у список відповідних їм римських чисел.
roman__(N, _):- N < 0, !.
roman__(0, []).
roman__(N, ['I'|Roman]) :- N < 4,
                           M is N - 1,
                           roman__(M, Roman).
roman__(4, ['IV']).
roman__(5, ['V']).
roman__(N, ['V'|Roman]) :- N < 9,
                           M is N - 5,
                           roman__(M, Roman).
roman__(9, ['IX']).
roman__(N, ['X'|Roman]) :- N < 40,
                           M is N - 10,
                           roman__(M, Roman).
roman__(N, ['XL'|Roman]) :- N < 50,
                           M is N - 40,
                           roman__(M, Roman).
roman__(50, ['L']).
roman__(N, ["_"]) :- N > 50, writeln("Only numbers <= 50 are supported."), !.
roman(N, R) :- roman__(N, L),
                atomics_to_string(L, R).
romanList(N, R) :- maplist(roman, N, R).

% 4. Напишіть предикат, що здійснює циклічний зсув елементів списку на один вправо.
shift(L, [H|T]) :- append(T, [H], L).

% 5. Напишіть предикат, що реалізує множення матриці (список списків) на вектор.
dot([], [], X, X).
dot([EL|REST], [EL1|V], RES, R) :- R1 is RES + (EL * EL1),
                                   dot(REST, V, R1, R).

mult([], _, L, X) :- reverse(X, L), !.
mult([ROW|MAT], VEC, RES, X) :- dot(ROW, VEC, 0, Row),
                                mult(MAT, VEC, RES, [Row|X]).

task5(M, V, Res) :- mult(M, V, Res, []).

:- writeln("\ntask 1").
:- writeln("IN: [-1,-2,0,0,2,1,-1000]\nEXPECTED OUT: [0,1,6]").
:- write("OUT: "), neg([-1,-2,0,0,2,1,-1000], X), writeln(X).
:- writeln("\ntask 2").
:- writeln("IN: [1,2,3,1]\nEXPECTED OUT: [change_done,2,3,change_done] <~> replaced 1").
:- write("OUT: "), replace(1, [1,2,3,1], X), writeln(X).
:- writeln("\ntask 3").
:- writeln("IN: [49,48,11,22,51,1000,22]\nEXPECTED OUT: [XLIX,XLVIII,XI,XXII,_,_,XXII]").
:- write("OUT: "), romanList([49,48,11,22,51,1000,22], X), writeln(X).
:- writeln("\ntask 4").
:- writeln("IN: [1,2,3,4,5,4,2,1]\nEXPECTED OUT: [1,1,2,3,4,5,4,2]").
:- write("OUT: "), shift([1,2,3,4,5,4,2,1], X), writeln(X).
:- writeln("\ntask 5").
:- writeln("IN: [[1,2,3],[4,5,6],[7,8,9]] AND [2,3,0]\nEXPECTED OUT: [8,23,38]").
:- write("OUT: "), task5([[1,2,3],[4,5,6],[7,8,9]], [2,3,0], X), writeln(X).
