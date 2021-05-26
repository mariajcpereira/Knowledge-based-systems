:-[satisfy,induce_ifthen,recommendation2].

% the goal is to classify recommendation
learn_rules:-
	learn(ma),  % negative examples
	learn(boa), % positive examples
        % save new rules:
	tell('recommendationifthen.pl'),
	listing(<==),
	told.

% example of classifying `new' objects:
list([categoria=portuguesa,custo_medio=acessivel,takeaway=nao,entrega=sim, custo_entrega=sim]).

q1:- learn_rules, list(L), classify(L,Class), write(Class).

q2:- learn_rules, classify([categoria=portuguesa,custo_medio=acessivel,takeaway=nao,entrega=sim, custo_entrega=sim], X), write(X).

adiciona(X, L, [X|L]).

add(A):- lista(L), adiciona(A, L, L2), retract(lista(L)), assert(lista(L2)).

escolhe:-  q1, nl, nl, fail.
