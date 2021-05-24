
:- [basedados,search].
:- dynamic(goal/1).

%fact inicial caixas(id,size, profit)
caixas([[1,4,5,7],[2,3,3.5,6],[3,6,8,2]]).
%Codigo da net (stackoverflow - http://stackoverflow.com/questions/8519203/prolog-replace-an-element-in-a-list-at-a-specified-index)
%replace(+List,+Index,+Value,-NewList).

replace([_|T], 0, X, [X|T]).
replace([H|T], I, X, [H|R]):- I > -1, NI is I-1, replace(T, NI, X, R), !.
replace(L, _, _, L). 

:- use_module(library(clpfd)).
% efficient replace of element in list:
% http://stackoverflow.com/questions/8519203/prolog-replace-an-element-in-a-list-at-a-specified-index
% replace_list(List,Position,NewElement,Result)

replace_list(Es, N, X, Xs) :-
   list_index0_index_item_replaced(Es,1,N,X,Xs).
list_index0_index_item_replaced([_|Es], I ,I, X, [X|Es]).
list_index0_index_item_replaced([E|Es], I0,I, X, [E|Xs]) :-
   I0 #< I,
   I1 #= I0+1,
   list_index0_index_item_replaced(Es, I1,I, X, Xs).

% By Paulo Cortez
% obter dados de uma dada caixa, em qualquer altura:
dadoscaixa(Tipo,Peso,Lucro,Maximo) :- caixas(L),member([Tipo,Peso,Lucro,Maximo],L).

% obter o lucro de uma dada solucao)
% lucro(Solucao,Iterador,Lucro)
% lucro 0 se solucao vazia

lucro([], _, 0). 
lucro([X|R], N, Lucro):-  N1 is N+1, lucro(R,N1,LucroR), dadoscaixa(N,P,Lc,_), Lucro is Lc*X + LucroR. 
initial([0,0,0]).
pesomax(15).
folga(0.1).

goal(S):- pesomax(P), folga(F), P1 is P-F*P, 
	  write(S),nl,
          peso(S,PS), 
          write('peso:'),write(PS),nl,
          PS >= P1, PS =< P, lucro(S,1,Lucro), write('Lucro: '),write(Lucro).

% lucro(S,1,Lucro) % usar isto para imprimir o lucro
s(L,S):- nth1(Pos,L,Elem), Elem1 is Elem+1, replace_list(L,Pos,Elem1,S), peso(S,PS).     % meter dentro do s a verificaçao do peso maximo, checkcaixas ou o goal lá dentro
peso(S,PS) :- caixas(Caixas),length(Caixas,Len), peso1(S,0,Len,PS),!.
peso1(S,PS,Len,Peso):- caixas(Caixas), (Len > 0 -> nth1(Len,S,A), nth1(Len,Caixas,B), nth1(4,B,Max), A =< Max, nth1(2,B,PesoCaixa), PS1 is PS + (PesoCaixa * A),  Len1 is Len - 1, peso1(S,PS1,Len1,Peso);  write(' Peso: '),write(PS),Peso is PS;!).




% example of usage/interface ----------------------------------------------------

q0:- search(depthfirst,_,Moves).
q1:- search(depthfirst,S,Moves).
q2:- search(breadthfirst,_,S).
q3:- search(iterativedeepening,S,Moves).
q4:- search(breadthfirst,S,Moves).

%Como chamar os metodos
%search2(breadthfirst,_,S),write('BF solution: '), mywrite(S).
%search2(breadthfirst,_,S).
%search2(depthfirst,_,S),write('DF solution:'),mywrite(S). 
%search2(iterativedeepening,N,S,_),write('ID max depth:'),write(N),write(' solution:'),mywrite(S). 

mywrite([]).
mywrite([X|R]):- write(X),write(' '),mywrite(R).
