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
q1(Class):- classify([categoria=portuguesa,custo_medio=acessivel,takeaway=nao,entrega=sim, custo_entrega=sim],Class).
q2(Class):- classify([],Class).



