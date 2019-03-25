% task1(tree(tree(nil,1,nil), 2, tree(tree(nil,3,nil),2,nil)),A).
% -> A = [3, 5, 5, 8].

task1(nil, []).
task1(tree(L, X, R), Xs) :- 
    task1(L, Ls),
    task1(R, Rs),
    append(Ls, [X|Rs], Xs).

% task2(tree(tree(nil,2,nil),5,tree(nil,6,tree(nil,5,nil))),2).
% -> true.

task2(tree(_, X, _), X) :- !.
task2(tree(L, _, _), X) :- 
    task2(L, X).
task2(tree(_, _, R), X) :- 
    task2(R, X).


% task3(tree(tree(nil,3,nil), 5, tree(tree(nil,5,nil),8,nil))).
% -> true.
% task3(tree(tree(tree(tree(tree(nil,4,nil)),3,nil),2,nil),1,nil, 0, nil)).
% -> false.

task3(TREE) :- task3(TREE, _).
task3(nil, 0).
task3(tree(L, _, R), HEIGHT) :- 
    task3(L, L_HEIGHT), 
    task3(R, R_HEIGHT),
    (L_HEIGHT is R_HEIGHT ; L_HEIGHT is R_HEIGHT + 1 ; L_HEIGHT is R_HEIGHT - 1),
    checkHeight(L_HEIGHT, R_HEIGHT, HEIGHT).

checkHeight(L_HEIGHT, R_HEIGHT, HEIGHT) :- 
    L_HEIGHT > R_HEIGHT, !, 
    HEIGHT is L_HEIGHT + 1; HEIGHT is R_HEIGHT + 1.

% task4(tree(tree(tree(nil,2,nil),2,nil),3,tree(nil,5,tree(nil,6,nil))),5,X).
% -> X = tree(tree(tree(nil, 2, nil), 2, nil), 3, tree(nil, 6, nil))
% ACCEPT LAST RESULT

task4(tree(nil, X, R), X, R).
task4(tree(L, X, _), X, L).
task4(tree(L, X, R), X, tree(L, Y, R1)) :- 
    lc_(R, Y, R1).
task4(tree(L, VAL, R), X, tree(L1, VAL, R)) :- 
    VAL > X, 
    task4(L, X, L1).
task4(tree(L, VAL, R), X, tree(L, VAL, R1)) :- 
    X >= VAL, 
    task4(R, X, R1). 

lc_(tree(nil, Y, R), Y, R).
lc_(tree(L, X, _), Y, tree(L1, X, _)) :- lc_(L, Y, L1).