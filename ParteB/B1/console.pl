q1:- write('Ola, bom dia!\n').

q2(X):- write('Como te chamas?\n'),read(X),write(X),nl.

q3(X,Y):- write('insira 2 chars e enter:'),get_char(X),get_char(Y).

