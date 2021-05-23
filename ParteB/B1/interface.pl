:-[search, percurso].

inicio:- nl,nl ,write('*********************************************************************************************************'), nl,
				write('                                                                                                          '), nl,			 
				write('                   ACONSELHAMENTO DE TRAJETO PARA ENTREGA DE UMA REFEICAO 				'), nl,              
				write('                                                                                                          '), nl,			 
				write('*********************************************************************************************************'), nl,
				write('**'), nl,
				write('**   1- Comecar'), nl,
				write('**   2- Sair'), nl,nl,
				read(X),
				opcao(X).

opcao(1):- comecar.
opcao(2):- write(''), halt.
opcao(other):- write(''), inicio.


comecar:-	write('********************************************************************************************************'), nl,
			write('**  Que tipo de procura deseja aplicar nesta entrega?'), nl,
			write('**'),nl,
			write('**  1 - depthfirst'), nl,
			write('**  2 - iterativedeepening'), nl,
			write('**  3 - breadthfirst'), nl, nl,
			read(P),
			(
			(P == 1), run(depthfirst);
            (P == 2), run(iterativedeepening);
			(P == 3), run(breadthfirst)).
			


