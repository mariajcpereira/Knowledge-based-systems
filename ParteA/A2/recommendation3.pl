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
q2(Class):- classify([categoria=mexicana,custo_medio=caro,entrega=sim],Class).
q3(Class):- classify([categoria=pizza,custo_medio=medio,custo_entrega=sim],Class).
q4(Class):- classify([categoria=saudavel,custo_medio=caro, custo_entrega=nao],Class).
q5(Class):- classify([categoria=hamburgueres,custo_medio=acessivel, entrega=sim],Class).
