neighbors(X, Y, Xs) :- 
    next_to(X, Y, Xs) ; next_to(Y, X, Xs) .
get([Elem | _], 0, Elem).
get([_ | Rest], N, Elem) :- 
    N >= 1, K is N-1, 
    get(Rest, K, Elem).

next_to(L, R, [L, R | _]).
next_to(L, R, [_ | Rest]) :- next_to(L, R, Rest).

ein2(X) :-
    sol2(H),
    member([X,fish,_,_,_], H).

sol2(Houses) :-
    % національність, тварина, сигарети, напій, будинок
    Houses = [_,_,_,_,_],
    % Англієць живе в червоному будинку
    member([englishman,_,_,_,red], Houses),
    % Швед тримає собаку
    member([swede,dog,_,_,_], Houses),
    % Датчанин п'є чай
    member([dane,_,_,tea,_], Houses),
    % Зелений будинок стоїть зліва від білого, поряд з ним
    next_to([_,_,_,_,green], [_,_,_,_,white], Houses),
    % Мешканець зеленого дома п'є каву
    member([_,_,_,coffee,green], Houses),
    % Людина, яка палить Pall Mall, тримає пташку
    member([_,bird,pallmall,_,_], Houses),
    % Мешканець з середнього будинку п'є молоко
    get(Houses, 2, [_,_,_,milk,_]),
    % Мешканець з жовтого будинку палить Dunhill
    member([_,_,dunhill,_,yellow], Houses),
    % Норвежець живе в першому будинку
    get(Houses, 0, [norwegian,_,_,_,_]),
    % Курець Marlboro живе біля того, хто тримає кицьку
    neighbors([_,_,marlboro,_,_], [_,cat,_,_,_], Houses),
    % Курець цигарок Winfield п'є пиво
    member([_,_,winfield,beer,_], Houses),
    % Норвежець живе біля блакитного будинку
    neighbors([norwegian,_,_,_,_], [_,_,_,_,blue], Houses),
    % Німець палить Rothmans
    member([german,_,rothmans,_,_], Houses),
    % Курець Marlboro - сусіда людини, яка п'є воду
    neighbors([_,_,marlboro,_,_], [_,_,_,water,_], Houses),
    % Людина, яка тримає коня, живе біля того, хто курить Dunhill
    neighbors([_,horse,_,_,_], [_,_,dunhill,_,_], Houses).
