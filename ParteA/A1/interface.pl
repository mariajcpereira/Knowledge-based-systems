:-dynamic(fact/1),
[forward, basedados, proof, baseconhecimento].

:- initialization(menu).

menu:- nl,nl , 	write('********************************************************************************************************'), nl,
				write('           O que lhe apetece hoje? Temos aqui um guia de restaurantes para si! Antes de iniciar, qual o seu nome?'),nl,
				read(X) ,nl,
				write('********************************************************************************************************'), nl,nl,
				write('  Prazer em estar a ajuda-lo/a Sr./a '), write(X) ,nl,nl,nl,
				write('********************************************************************************************************'), nl,
				write('**                                                                                                    **'), nl,			 
				write('**                          Descubra o/s  melhor/es restaurante/s para a sua escolha de refeicao!                        **'), nl,
				write('**                      Faremos algumas perguntas para o/a ajudar na sua escolha!                     **'), nl, 
				write('**                                                                                                    **'), nl,			 
				write('********************************************************************************************************'), nl,
				write('**   Menu:'), nl,
				write('**'), nl,
				write('**   1- Iniciar'), nl,
				write('**   2- Sair'), nl,nl,
				read(Y),
				avaliarEscolha(Y).

avaliarEscolha(1):- questao1.
avaliarEscolha(2):- write('Foi um prazer ajuda-lo!'), halt.
avaliarEscolha(other):- write('Introduza uma opcao valida, por favor comece de novo'), menu.

	    
questao1:-	write('********************************************************************************************************'), nl,
			write('**  Deseja um restaurante de Braga ou Guimaraes?'), nl,
			write('**'),nl,
			write('**  1 - Braga'), nl,
			write('**  2 - Guimaraes'), nl,nl,
			read(A1),
			(
			(A1 == 1),assert(fact(braga)), questao2;
            (A1 == 2),assert(fact(guimaraes)), questao2).
	    
questao2:-	write('********************************************************************************************************'), nl,
			write('**  Gostaria de levantar o pedido ou que seja entregue a sua casa?'), nl,
			write('**'),nl,
			write('**  1 - TakeAway'), nl,
			write('**  2 - Entrega'), nl,nl,
			read(A2),
			(
			(A2 == 1),assert(fact(takeaway_sim)), questao4;
            (A2 == 2),assert(fact(entrega_sim)), questao3).
	    
			
questao3:-	write('********************************************************************************************************'), nl,
			write('**  Que tipo de alimentacao deseja? Destas opcoes, introduza o numero correspondente:'), nl,
			write('**'),nl,
			write('**  1 - Portuguesa'), nl,
			write('**  2 - Churrasco'), nl, 
			write('**  3 - Hamburgueres'),nl,
			write('**  4 - Sanduiches'), nl,
			write('**  5 - Japonesa'), nl,
			write('**  6 - Italiana'), nl,
			write('**  7 - Saudavel'), nl,
			write('**  8 - Mexicana'), nl,
			read(A3),
			(
			(A3 == 1), assert(fact(portuguesa)), questao4;
            (A3 == 2), assert(fact(churrasco)), questao4;
            (A3 == 3), assert(fact(hamburgueres)), questao4;
            (A3 == 4), assert(fact(sanduiches)), questao4;
            (A3 == 5), assert(fact(japonesa)), questao4;
            (A3 == 6), assert(fact(sushi)), questao4;
            (A3 == 7), assert(fact(pizza)), questao4;
            (A3 == 8), assert(fact(italiana)), questao4).
			

questao4:- 	write('********************************************************************************************************'), nl,
			write('**  Deseja um restaurante com que preco de refeicao?'), nl,
			write('**'),nl,
			write('**  1 - Preco acessivel'),nl, 
			write('**  2 - Preco medio'),nl, 
			write('**  3 - Preco elevado'),nl, nl,
			read(A4),nl,
		    (
		    (A4 == 1), assert(fact(acessivel)), resultado;
		    (A4 == 2), assert(fact(medio)), resultado;
			(A4 == 3), assert(fact(caro)), resultado).
			
			
resultado :- 	write('********************************************************************************************************'), nl,
				write('**                                                                                                    **'), nl,			 
				write('**                                         Resultado Obtido                                           **'), nl, 
				write('**                                                                                                    **'), nl,			 
				write('********************************************************************************************************'),
				result.

resultadowrite(P):-	nl,
					write('     O seu perfil e o'),nl,
					write('     *** '),write(P),write(' ***'),nl,nl,
					write('     Restaurantes aconselhados: '),perfil(P),nl,nl,
					write('********************************************************************************************************'),
					retractall(fact(_)).
