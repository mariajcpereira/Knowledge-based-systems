:-dynamic(fact/1),
[forward, recommendation3, proof].

lista([]).

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
			write('**  Gostaria de levantar o pedido ou que seja entregue a sua casa?'), nl,
			write('**'),nl,
			write('**  1 - TakeAway'), nl,
			write('**  2 - Entrega'), nl,nl,
			read(A2),
			(
			(A1 == 1),add(takeaway=sim), nl, questao2;
            (A1 == 2),add(takeaway=nao), nl, questao2).
	    
			
questao2:-	write('********************************************************************************************************'), nl,
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
			write('**  9 - Pizza'), nl,
			write('**  10 - Sushi'), nl,
			read(A3),
			(
			(A3 == 1), add(categoria=portuguesa), nl, questao4;
            (A3 == 2), add(categoria=churrasco), nl,questao4;
            (A3 == 3), add(categoria=hamburgueres), nl, questao4;
            (A3 == 4), add(categoria=sanduiches), nl, questao4;
            (A3 == 5), add(categoria=japonesa), nl, questao4;
            (A3 == 6), add(categoria=italina), nl, questao4;
            (A3 == 7), add(categoria=saudavel), nl, questao4;
	    (A3 == 8), add(categoria=mexicana), nl, questao4;
            (A3 == 9), add(categoria=pizza), nl, questao4;
            (A3 == 10), add(categoria=sushi), nl, questao4).
			

questao4:- 	write('********************************************************************************************************'), nl,
			write('**  Deseja um restaurante com que preco de refeicao?'), nl,
			write('**'),nl,
			write('**  1 - Preco acessivel'),nl, 
			write('**  2 - Preco medio'),nl, 
			write('**  3 - Preco elevado'),nl, nl,
			read(A4),nl,
		    (
		    (A4 == 1), add(custo_medio=acessivel), nl, questao5;
		    (A4 == 2), add(custo_medio=medio), nl, questao5;
			(A4 == 3), add(custo_medio=caro), nl, questao5).
			

questao5:- 	write('********************************************************************************************************'), nl,
			write('**  Pretende pagar custo de entrega?'), nl,
			write('**'),nl,
			write('**  1 - Sim'),nl, 
			write('**  2 - Não'),nl, nl,
			read(A5),nl,
		    (
		    (A5 == 1), add(custo_entrega=sim), nl, resultado;
		    (A5 == 2), add(custo_entrega=nao), nl, resultado.			
			
			
resultado :- 	write('********************************************************************************************************'), nl,
				write('**                                                                                                    **'), nl,			 
				write('**                                         Resultado Obtido                                           **'), nl, 
				write('**                                                                                                    **'), nl,			 
				write('********************************************************************************************************'),
				result.

resultadowrite(P):-	nl,
					write('     O seu perfil e o'),nl,
					write('     *** '),write(escolhe),write(' ***'),nl,nl,
					write('     Restaurantes aconselhados: '), escolhe ,nl,nl,
					write('********************************************************************************************************'),
					retractall(fact(_)).
