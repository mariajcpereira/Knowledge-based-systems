:-dynamic(fact/1),
[forward, basedados, proof, baseconhecimento].

menu:- nl,nl , 	write('********************************************************************************************************'), nl,
				write('           O que lhe apetece hoje? Temos aqui um guia de restaurantes para si! Antes de iniciar, qual o seu nome?'),nl,
				read(X) ,nl,
				write('********************************************************************************************************'), nl,nl,
				write('  Prazer em estar a ajuda-lo/a Sr./a '), write(X) ,nl,nl,nl,
				write('********************************************************************************************************'), nl,
				write('**                                                                                                    **'), nl,			 
				write('**                          Descubra qual/quais o/s melhor/es restaurantea/s para si!                        **'), nl,
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
			read(A1),
			(
			(A1 == 1),assert(fact(take_away)), questao3;
            (A1 == 2),assert(fact(entrega)), questao2).

questao2:-	write('********************************************************************************************************'), nl,
			write('**  Qual o nome do ator/atriz?'), nl,
			write('**'),nl,nl,
			read(A4),assert(variavel(A4)),resultado.
			
questao3:-	write('********************************************************************************************************'), nl,
			write('**  Que tipo de alimentacao deseja? Destas opcoes, introduza o numero correspondente:'), nl,
			write('**'),nl,
			write('**  1 - Portuguesa'), nl,
			write('**  2 - Churrasco'), nl, 
			write('**  3 - Hamburgueres'),nl,
			write('**  4 - Sanduiches'), nl,
			write('**  5 - Japonesa'), nl,
			write('**  6 - Sushi'), nl,
			write('**  7 - Pizza'), nl,
			write('**  8 - Italiana'), nl,
			write('**  9 - Saudavel'), nl,
			write('**  10 - Mexicana'), nl,
			read(A3),
			(
			(A3 == 1), assert(fact(portuguesa)), questao4;
            (A3 == 2), assert(fact(churrasco)), questao4;
            (A3 == 3), assert(fact(hamburgueres)), questao4;
            (A3 == 4), assert(fact(sanduiches)), questao4;
            (A3 == 5), assert(fact(japonesa)), questao4;
            (A3 == 6), assert(fact(sushi)), questao4;
            (A3 == 7), assert(fact(pizza)), questao4;
            (A3 == 8), assert(fact(italiana)), questao4;
            (A3 == 9), assert(fact(saudavel)), questao4;
            (A3 == 10), assert(fact(mexicana)), questao4.
			

questao4:- 	write('********************************************************************************************************'), nl,
			write('**  '), nl, 
			write('**'),nl,nl,			
			read(A4), assert(variavel(A4)),
			questao5.
			

questao5:- 	write('********************************************************************************************************'), nl,
			write('**  E maior de idade?'), nl,
			write('**'),nl,
			write('**  1 - Sim, tenho mais de 18 anos'),nl, 
			write('**  2 - Nao, tenho menos de 18 anos' ),nl, nl,
			read(A5),nl,
		    (
		    (A5 == 1), assert(fact(maior18)), resultado;
			(A5 == 2), assert(fact(menor18)), resultado).
			
			
resultado :- 	write('********************************************************************************************************'), nl,
				write('**                                                                                                    **'), nl,			 
				write('**                                         Resultado Obtido                                           **'), nl, 
				write('**                                                                                                    **'), nl,			 
				write('********************************************************************************************************'),
				result.

resultadowrite(P):-	variavel(A4),nl,
					write('     O seu perfil e o'),nl,
					write('     *** '),write(P),write(' ***'),nl,nl,
					write('     Filmes aconselhados: '),perfil(P,A4),nl,nl,
					write('********************************************************************************************************'),
					retract(variavel(A4)), retractall(fact(_)).
