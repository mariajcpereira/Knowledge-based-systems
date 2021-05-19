:-[search, basedados].



initial(restaurante). % ponto de partida

%calcularDistancia(cliente1, cliente2, Distancia)
calcularDistancia(X,Y,Min):-(percurso(X,Y,Min);percurso(Y,X,Min)).

:- initialization(inicio).

inicio:- nl,nl ,write('*********************************************************************************************************'), nl,
				write('                                                                                                          '), nl,			 
				write('                         			TITULO  						  		                 '), nl,              
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
			write('**  Qual dos clientes pretende satisfazer com esta entrega?'), nl,
			write('**'),nl,
			write('**  1 - Cliente 1'), nl,
			write('**  2 - Cliente 2'), nl,
			write('**  3 - Cliente 3'), nl,
			write('**  4 - Cliente 4'), nl,
			write('**  5 - Cliente 5'), nl,nl,
			read(C),
			(
			(C == 1), assert(goal(client1)), tipoProcura;
            (C == 2), assert(goal(cliente2)), tipoProcura;
			(C == 3), assert(goal(cliente3)), tipoProcura;
			(C == 4), assert(goal(cliente4)), tipoProcura;
			(C == 5), assert(goal(cliente5)), tipoProcura).

execute(Method):- search(Method,Par,S).			

tipoProcura:-	write('********************************************************************************************************'), nl,
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
