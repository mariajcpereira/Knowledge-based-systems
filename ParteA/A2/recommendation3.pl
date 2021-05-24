:-[satisfy,induce_ifthen,recommendation2, basedados].

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

q1(Class):- list(L), classify(L,Class).

adiciona(X, L, [X|L]).

add(A):- lista(L), adiciona(A, L, L2), retract(lista(L)), assert(lista(L2)).

%lista_refeicao(R,LR):- lista(C), classify(C,Class), restaurante(R,[Class|_],L),findall(Nome,Preco), member(refeicao(Nome,Preco),L), LR).

escolhe:- q1, write(R), nl, write(LR), nl, nl, fail.
