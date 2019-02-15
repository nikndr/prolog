% Аптеки міста
% pharmacy(pharm_id, address, phone).
% drugs(drugs_id, name, pharm_group).
% pharmacy_has_drugs(pharm_id, drugs_id, drugs_num, price, expiration_date).
% pharmacy_has_drugs(pharmacy(pharm_id, address, phone), drugs(drugs_id, name, pharm_group), drugs_num, price, expiration_date).
% pharmacy_has_eployees(pharmacy(pharm_id, address, phone), employee(name, salary), num_of_employees).

pharmacy_has_drugs(pharmacy(01, street_one, 245567), drugs(aspirin, gr1), 10, 100, not_expired).
pharmacy_has_drugs(pharmacy(02, street_one, 524656), drugs(alcohol, gr2), 1000, 99, not_expired).
pharmacy_has_drugs(pharmacy(02, street_one, 524656), drugs(another_alcohol, gr2), 10, 100, not_expired).
pharmacy_has_drugs(pharmacy(03, street_three, 848990), drugs(alcohol, gr2), 10, 100, not_expired).
pharmacy_has_drugs(pharmacy(03, street_three, 848990), drugs(some_drug, gr3), 1233, 10, expired).
pharmacy_has_drugs(pharmacy(02, street_one, 524656), drugs(other_drug, gr4), 11, 102, not_expired).
pharmacy_has_drugs(pharmacy(02, street_one, 524656), drugs(some_drug, gr3), 122, 110, not_expired).
pharmacy_has_drugs(pharmacy(03, street_three, 848990), drugs(other_drug, gr4), 123, 120, not_expired).
pharmacy_has_drugs(pharmacy(03, street_three, 848990), drugs(aspirin, gr1), 112, 20, not_expired).
pharmacy_has_drugs(pharmacy(02, street_one, 524656), drugs(aspirin, gr1), 102, 105, not_expired).
pharmacy_has_drugs(pharmacy(04, street_four, 997717), drugs(some_drug, gr3), 22, 21, expired).
pharmacy_has_drugs(pharmacy(04, street_four, 997717), drugs(other_drug, gr4), 13, 90, not_expired).
pharmacy_has_drugs(pharmacy(04, street_four, 997717), drugs(alcohol, gr2), 100, 19, not_expired).
pharmacy_has_drugs(pharmacy(01, street_one, 245567), drugs(other_drug, gr4), 88, 60, expired).
pharmacy_has_drugs(pharmacy(01, street_one, 245567), drugs(also_drug, gr4), 88, 60, expired).

pharmacy_has_eployees(pharmacy(01, street_one, 245567), employee(andrii, 12000), 4).
pharmacy_has_eployees(pharmacy(01, street_one, 245567), employee(anna, 10000), 4).
pharmacy_has_eployees(pharmacy(01, street_one, 245567), employee(olha, 11500), 4).
pharmacy_has_eployees(pharmacy(01, street_one, 245567), employee(serhii, 9000), 4).

pharmacy_has_eployees(pharmacy(02, street_one, 524656), employee(oksana, 12000), 3).
pharmacy_has_eployees(pharmacy(02, street_one, 524656), employee(oleksandr, 13000), 3).
pharmacy_has_eployees(pharmacy(02, street_one, 524656), employee(kyrylo, 12500), 3).

pharmacy_has_eployees(pharmacy(03, street_three, 848990), employee(vitalii, 8800), 5).
pharmacy_has_eployees(pharmacy(03, street_three, 848990), employee(panas, 9000), 5).
pharmacy_has_eployees(pharmacy(03, street_three, 848990), employee(oleh, 9100), 5).
pharmacy_has_eployees(pharmacy(03, street_three, 848990), employee(karyna, 8500), 5).
pharmacy_has_eployees(pharmacy(03, street_three, 848990), employee(olena, 10000), 5).

pharmacy_has_eployees(pharmacy(04, street_four, 997717), employee(tetyana, 8500), 5).
pharmacy_has_eployees(pharmacy(04, street_four, 997717), employee(lyudmyla, 8000), 5).
pharmacy_has_eployees(pharmacy(04, street_four, 997717), employee(stanislav, 9000), 5).
pharmacy_has_eployees(pharmacy(04, street_four, 997717), employee(rostyslav, 9100), 5).
pharmacy_has_eployees(pharmacy(04, street_four, 997717), employee(vyacheslav, 9500), 5).

% 1. Телефон аптеки, де є потрібні ліки;
q1(Q_PHONE, IN_DRUGS) :-
  pharmacy_has_drugs(pharmacy(_, _, Q_PHONE), drugs(IN_DRUGS, _), _, _, _).

% 2. В якій аптеці ціна на задані ліки є меншою за визначену величину
q2(Q_PHARM_ID, IN_DRUG_NAME, IN_PRICE) :-
  pharmacy_has_drugs(pharmacy(Q_PHARM_ID, _, _), drugs(IN_DRUG_NAME, _), _, PRICE, _),
  PRICE < IN_PRICE.

% 3. В яких ліків термін придатності перевищено
q3(Q_DRUG) :-
  pharmacy_has_drugs(_, drugs(Q_DRUG, _), _, _, EXP), EXP == expired.

% 4. На якій вулиці знаходиться аптека з певним номером телефону
q4(Q_STREET, IN_PHONE) :-
  pharmacy_has_drugs(pharmacy(_, Q_STREET, IN_PHONE), _, _, _, _).

% 5. У яких аптеках працюють фармацевти з заробітною платою більшою за певне число і які імена вони мають
q5(Q_PHARM_ID, Q_NAME, Q_SALARY, IN_SALARY) :-
  pharmacy_has_eployees(pharmacy(Q_PHARM_ID, _, _), employee(Q_NAME, Q_SALARY), _),
  IN_SALARY < Q_SALARY.

% 6. Який фармацевт продає певні ліки
q6(Q_EMPL_NAME, IN_DRUGS) :-
  pharmacy_has_drugs(pharmacy(PHARMACY, _, _), drugs(IN_DRUGS, _), _, _, _),
  pharmacy_has_eployees(pharmacy(PHARMACY, _, _), employee(Q_EMPL_NAME, _), _).

:- writeln("\nТелефон аптеки, де є потрібні ліки (aspirin)").
:- forall(q1(X, aspirin), writeln(X)).
:- writeln("\nВ якій аптеці ціна на задані ліки є меншою за визначену величину (aspirin, < 200)").
:- forall(q2(X, aspirin, 200), writeln(X)).
:- writeln("\nВ яких ліків термін придатності перевищено").
:- forall(q3(X), writeln(X)).
:- writeln("\nНа якій вулиці знаходиться аптека з певним номером телефону (997717)").
:- forall(q4(X, 997717), writeln(X)).
:- writeln("\nУ яких аптеках працюють фармацевти з заробітною платою більшою за певне число (11000) і які імена і зарплати вони мають").
:- forall(q5(X, Y, Z, 11000), format("аптека: ~a~nПрацівник: ~a~nЗарплата: ~a~n", [X, Y, Z])).
:- writeln("\nЯкий фармацевт продає певні ліки (aspirin)").
:- forall(q6(X, aspirin), writeln(X)).
