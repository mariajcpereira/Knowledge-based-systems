:-[search, basedados], dynamic(goal/1).

:- use_module(library(theme/dark)).

restaurant(restaurante, [cliente1, cliente2, cliente3, cliente4, cliente5],[5,6,7,9,10]).

% -- database:
%   state representation: S, where S is a list with the full path followed by the person 
initial(sol([E,E2],[R])):- restaurant(R,LE,_), random_member(E,LE), random_member(E2,LE), E2\==E. % initial destination

goal(sol([E,E2],LC)):- member(E,LC), member(E2,LC), last(LC,E2). % last destination

% state transition rule s/2: s(Cliente1,Cliente2)
s(sol(LE,LC),sol(LE,LC2)):- last(LC,C), travel(C,C2,_), \+ member(C2,LC), append(LC,[C2],LC2), write(LC). % link s(O,D,Dist) with s(O,D)

travel(X,Y,MIN):-(percurso(X,Y,MIN);percurso(Y,X,MIN)). % true if road or symmetrical

% evaluation function: (sum of distances for all pairs)
eval([_],0).
eval([Cliente1,Cliente2|R],DS):- 
	travel(Cliente1,Cliente2,D),
	eval([Cliente2|R],DR),
	DS is D+DR.

writeEntrega(sol(LE,_)):- write(LE).

writeTempo(sol(_,LC)):- eval(LC,D), D2 is D+1,write(D2).

writeLucro(sol(LE,_)):- member(A,LE), member(B,LE), B\==A,
lucro(A,Y),
lucro(B,Z), 
W is Y+Z, write(W).


% execute and show a search method result:
run(Method):- search(Method,Par,S), nl, nl,
	write('********************************************************************************************************'), nl,
        write('                                                                                                        '), nl,
        write('                                        Percurso Aconselhado                                            '), nl,
        write('                                                                                                        '), nl,
        write('********************************************************************************************************'), nl,
	      write('Metodo:'),write(Method),writepar(Par),nl,
	      last(S,Q), nl,
              write('Entregar para:'),writeEntrega(Q),nl,
              write('Solucao:'), last(S,L), write(L),nl,
	      %length(S,N),N1 is N-1,write('Percurso:'),write(N1),nl,
	      write('Tempo de percurso:'), writeTempo(Q), nl,
	      write('Lucro:'), writeLucro(Q), write('euros'), fail.
	      
% write parameter (if any):
writepar(X):- integer(X),write(' par:'),write(X). % write X
writepar(_). % do not write X

% execute 3 example searches:
q1:- run(depthfirst).
q2:- run(iterativedeepening).
q3:- run(breadthfirst).
