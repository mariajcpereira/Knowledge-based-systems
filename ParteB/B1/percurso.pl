:-[search, basedados].

% -- database:
%   state representation: S, where S is a list with the full path followed by the person 
initial([restaurante]). % initial city

goal(X):- member(cliente1,X),member(cliente2,X). % destination city

% --- knowledge base:
%percurso(Origem, Destino, DistanciaEmMin)
percurso(restaurante, cliente1, 5).
percurso(cliente1, cliente2, 5).
percurso(cliente1, cliente4, 5).
percurso(cliente1, cliente5, 5).
percurso(cliente2, cliente3, 3).
percurso(cliente2, cliente4, 2).
percurso(cliente2, cliente5, 2).
percurso(cliente3, cliente4, 4).
percurso(cliente3, cliente5, 5).
percurso(restaurante, cliente4, 7).
% travel(City1,City2,distance):
travel(X,Y,D):-(percurso(X,Y,D);percurso(Y,X,D)). % true if road or symmetrical

% state transition rule s/2: s(City1,City2)
s(L1,L2):- last(L1,N1),travel(N1,N2,_),append(L1,[N2],L2). % link s(O,D,Dist) with s(O,D)

% evaluation function: (sum of distances for all pairs)
eval([_],0).
eval([City1,City2|R],DS):- 
	travel(City1,City2,D),
	eval([City2|R],DR),
	DS is D+DR.

% execute and show a search method result:
run(Method):- search(Method,Par,S),
	      write('method:'),write(Method),writepar(Par),nl,
              write('solution:'),write(S),nl,
	      length(S,N),N1 is N-1,write('solution steps:'),write(N1),nl,
              last(S,LS),
              eval(LS,D),write('distance:'),write(D).
% write parameter (if any):
writepar(X):- integer(X),write(' par:'),write(X). % write X
writepar(_). % do not write X

% execute 3 example searches:
q1:- run(depthfirst).
q2:- run(iterativedeepening).
q3:- run(breadthfirst).
