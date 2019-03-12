search(X, tree(_, X, _)).
search(X, tree(L, _, _)) :- search(X,L).
search(X, tree(_, _, R)) :- search(X,R).

add(nil, X, tree(nil, X, nil)) :- !.
add(tree(L, A, R), X, tree(L1, A, R)) :-
    X =< A,
	add(L, X, L1), !.
add(tree(L, A, R), X, tree(L, A, R1)) :-
	X > A,
	add(R, X, R1).

make_tree(List, Tree) :- make_tree(List, nil, Tree).
make_tree([], Tree, Tree) :- !.
make_tree([H|T], Tree, TreeRes) :-
    add(Tree, H, Tree1),
    make_tree(T, Tree1, TreeRes).

in_tree(X, tree(_, X, _)) :- !.
in_tree(X, tree(L, Root, _)) :-
    X =< Root,
	in_tree(X, L),
    !.
in_tree(X, tree(_, Root, R)) :-
    X > Root,
	in_tree(X, R).
