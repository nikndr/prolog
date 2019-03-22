b(X) :- make_tree([5,3,4,2,9,11,12,7,6,8], X).
% binary:
tree(tree(tree(nil, 2, nil), 3, tree(nil, 4, nil)), 5, tree(tree(tree(nil, 6, nil), 7, tree(nil, 8, nil)), 9, tree(nil, 11, tree(nil, 12, nil)))).
% 2-3:
v2(v2(v3(v2(nil,1,nil),3,v2(nil,3,nil),4,v2(nil,4,nil)),5,v2(v2(nil,5,nil),7,v2(nil,7,nil))),8,v2(v3(v2(nil,8,nil),10,v2(nil,10,nil),12,v2(nil,12,nil)),13,v2(nil,15,nil))). 

add(nil, X, tree(nil, X, nil)) :- !.
add(tree(L, A, R), X, tree(L1, A, R)) :-
    X =< A,
	add(L, X, L1), !.
add(tree(L, A, R), X, tree(L, A, R1)) :-
	X > A,
	add(R, X, R1).

make_tree(List, TREE) :- make_tree(List, nil, TREE).
make_tree([], TREE, TREE) :- !.
make_tree([H|T], TREE, TreeRes) :-
    add(TREE, H, Tree1),
    make_tree(T, Tree1, TreeRes).

% task1(tree(tree(tree(nil, 2, nil), 3, tree(nil, 4, nil)), 5, tree(tree(tree(nil, 6, nil), 7, tree(nil, 8, nil)), 9, tree(nil, 11, tree(nil, 12, nil))))).
% -> 2,3,4,5,6,7,8,9,11,12.

task1(X) :-
    task1(X, Xs),
    atomic_list_concat(Xs, ',', Atom),
    writeln(Atom), !.
task1(nil, []).
task1(tree(L, X, R1), Xs) :-
    task1(L, Ls), 
    task1(R1, Rs),
    append(Ls,[X|Rs],Xs).

% task2(tree(tree(tree(nil, 2, nil), 3, tree(nil, 4, nil)), 5, tree(tree(tree(nil, 6, nil), 7, tree(nil, 8, nil)), 9, tree(nil, 11, tree(nil, 12, nil)))), X).
% -> X = 5.

task2(nil,0).
task2(tree(nil, _, nil),1).
task2(tree(L, _, R1), Num) :-
    task2(L, Ls),
    task2(R1, Rs), 
    Num is Ls + Rs, !.

% task3(tree(tree(tree(nil, 2, nil), 3, tree(nil, 4, nil)), 5, tree(tree(tree(nil, 6, nil), 7, tree(nil, 8, nil)), 9, tree(nil, 11, tree(nil, 12, nil)))), X).
% -> X = 4.

task3(nil, 0).
task3(tree(L, _, R1), Height) :-
    task3(L, Ls), 
    task3(R1, Rs), 
    H is max(Ls, Rs), 
    Height is 1+H.

% task4(tree(tree(tree(nil, 2, nil), 3, tree(nil, 4, nil)), 5, tree(tree(tree(nil, 6, nil), 7, tree(nil, 8, nil)), 9, tree(nil, 11, tree(nil, 12, nil)))), X).
% -> X = 10.

task4(nil,0).
task4(tree(L, _, R1), Nodes) :-
    task4(L, Ls), 
    task4(R1, Rs), 
    Nodes is 1 + Ls + Rs.

% task5(v2(v2(v3(v2(nil,1,nil),3,v2(nil,3,nil),4,v2(nil,4,nil)),5,v2(v2(nil,5,nil),7,v2(nil,7,nil))),8,v2(v3(v2(nil,8,nil),10,v2(nil,10,nil),12,v2(nil,12,nil)),13,v2(nil,15,nil)))).
% -> 1, 3, 3, 4, 4, 5, 5, 7, 7, 8, 8, 10, 10, 12, 12, 13, 15, 

task5(TREE) :- show23(TREE).
show23(nil).
show23(tree(M)) :- format("~a, ", [M]).
show23(v2(T1, M, T2)) :- 
    show23(T1), 
    format("~a, ",[M]),
    show23(T2).
show23(v3(T1, M1, T2, M2, T3)) :- 
    show23(T1),
    format("~a, ",[M1]),
    show23(T2), 
    format("~a, ",[M2]),
    show23(T3).

% task6(5, v2(v2(v3(v2(nil,1,nil),3,v2(nil,3,nil),4,v2(nil,4,nil)),5,v2(v2(nil,5,nil),7,v2(nil,7,nil))),8,v2(v3(v2(nil,8,nil),10,v2(nil,10,nil),12,v2(nil,12,nil)),13,v2(nil,15,nil)))).
% -> true.
% task6(111, v2(v2(v3(v2(nil,1,nil),3,v2(nil,3,nil),4,v2(nil,4,nil)),5,v2(v2(nil,5,nil),7,v2(nil,7,nil))),8,v2(v3(v2(nil,8,nil),10,v2(nil,10,nil),12,v2(nil,12,nil)),13,v2(nil,15,nil)))).
% -> false.

task6(X, v2(_, X, _)) :- !.
task6(X, v3(_, X, _, _, _)) :- !.
task6(X, v3(_, _, _, X, _)) :- !.
task6(X, v2(T1, _, _)) :- task6(X, T1).
task6(X, v2(_, _, T2)) :- task6(X, T2).
task6(X, v3(T1, _, T2, _, T3)) :-
    task6(X,T1), 
    task6(X,T2), 
    task6(X,T3).

% task71(tree(tree(tree(nil, 2, nil), 3, tree(nil, 4, nil)), 5, tree(tree(tree(nil, 6, nil), 7, tree(nil, 8, nil)), 9, tree(nil, 11, tree(nil, 12, nil))))).
% -> true.
% task71(tree(tree(nil, nil), 1, tree(nil, 1, nil))).
% -> false.

task71(nil).
task71(tree(L, _, R1)) :-
    task71(L), 
    task71(R1).

% task72(v2(v2(v3(v2(nil,1,nil),3,v2(nil,3,nil),4,v2(nil,4,nil)),5,v2(v2(nil,5,nil),7,v2(nil,7,nil))),8,v2(v3(v2(nil,8,nil),10,v2(nil,10,nil),12,v2(nil,12,nil)),13,v2(nil,15,nil)))).
% -> true.
% task72(v3(v2(nil,1,nil),1,v2(nil,2,nil),2,v3(nil,3,nil,1,nil,         1))).
% -> false.

task72(nil).
task72(v2(T1, _, T2))
:-task72(T1),
 task72(T2).
task72(v3(T1, _, T2, _, T3)) :-
    task72(T1), 
    task72(T2), 
    task72(T3).

:- writeln("\ntask1:").
:- task1(tree(tree(tree(nil, 2, nil), 3, tree(nil, 4, nil)), 5, tree(tree(tree(nil, 6, nil), 7, tree(nil, 8, nil)), 9, tree(nil, 11, tree(nil, 12, nil))))).

:- writeln("\ntask2:").
:- task2(tree(tree(tree(nil, 2, nil), 3, tree(nil, 4, nil)), 5, tree(tree(tree(nil, 6, nil), 7, tree(nil, 8, nil)), 9, tree(nil, 11, tree(nil, 12, nil)))), X), writeln(X).

:- writeln("\ntask3:").
:- task3(tree(tree(tree(nil, 2, nil), 3, tree(nil, 4, nil)), 5, tree(tree(tree(nil, 6, nil), 7, tree(nil, 8, nil)), 9, tree(nil, 11, tree(nil, 12, nil)))), X), writeln(X).

:- writeln("\ntask4:").
:- task4(tree(tree(tree(nil, 2, nil), 3, tree(nil, 4, nil)), 5, tree(tree(tree(nil, 6, nil), 7, tree(nil, 8, nil)), 9, tree(nil, 11, tree(nil, 12, nil)))), X), writeln(X).

:- writeln("\ntask5:").
:- task5(v2(v2(v3(v2(nil,1,nil),3,v2(nil,3,nil),4,v2(nil,4,nil)),5,v2(v2(nil,5,nil),7,v2(nil,7,nil))),8,v2(v3(v2(nil,8,nil),10,v2(nil,10,nil),12,v2(nil,12,nil)),13,v2(nil,15,nil)))).

:- writeln("\n\ntask6:").
:- writeln("5 in 2-3: "), task6(5, v2(v2(v3(v2(nil,1,nil),3,v2(nil,3,nil),4,v2(nil,4,nil)),5,v2(v2(nil,5,nil),7,v2(nil,7,nil))),8,v2(v3(v2(nil,8,nil),10,v2(nil,10,nil),12,v2(nil,12,nil)),13,v2(nil,15,nil)))) -> writeln(true) ; writeln(false).
:- writeln("111 in 2-3: "),task6(111, v2(v2(v3(v2(nil,1,nil),3,v2(nil,3,nil),4,v2(nil,4,nil)),5,v2(v2(nil,5,nil),7,v2(nil,7,nil))),8,v2(v3(v2(nil,8,nil),10,v2(nil,10,nil),12,v2(nil,12,nil)),13,v2(nil,15,nil)))) -> writeln(true) ; writeln(false).

:- writeln("\ntask71:").
:- writeln("tree(tree(tree(nil, 2, nil), 3, tree(nil, 4, nil)), 5, tree(tree(tree(nil, 6, nil), 7, tree(nil, 8, nil)), 9, tree(nil, 11, tree(nil, 12, nil))))").
:- task71(tree(tree(tree(nil, 2, nil), 3, tree(nil, 4, nil)), 5, tree(tree(tree(nil, 6, nil), 7, tree(nil, 8, nil)), 9, tree(nil, 11, tree(nil, 12, nil))))) -> writeln("tree is binary") ; writeln("tree is not binary").
:- writeln("tree(tree(nil, nil), 1, tree(nil, 1, nil))").
:- task71(tree(tree(nil, nil), 1, tree(nil, 1, nil))) -> writeln("tree is binary") ; writeln("tree is not binary").

:- writeln("\ntask72:").
:- writeln("v2(v2(v3(v2(nil,1,nil),3,v2(nil,3,nil),4,v2(nil,4,nil)),5,v2(v2(nil,5,nil),7,v2(nil,7,nil))),8,v2(v3(v2(nil,8,nil),10,v2(nil,10,nil),12,v2(nil,12,nil)),13,v2(nil,15,nil)))").
:- task72(v2(v2(v3(v2(nil,1,nil),3,v2(nil,3,nil),4,v2(nil,4,nil)),5,v2(v2(nil,5,nil),7,v2(nil,7,nil))),8,v2(v3(v2(nil,8,nil),10,v2(nil,10,nil),12,v2(nil,12,nil)),13,v2(nil,15,nil)))) -> writeln("tree is 2-3") ; writeln("tree is not 2-3").
:- writeln("v3(v2(nil,1,nil),1,v2(nil,2,nil),2,v3(nil,3,nil,1,nil, 1))").
:- task72(v3(v2(nil,1,nil),1,v2(nil,2,nil),2,v3(nil,3,nil,1,nil, 1))) -> writeln("tree is 2-3") ; writeln("tree is not 2-3").