:-[search].

% -- database:
%   simple state representation: S, where S is a city
initial(porto). % initial city
goal(guimaraes). % destination city

% --- knowledge base:
% road(Origin,Destination,Distance-in-km)
% data collected from: https://pt.distance.to/
road(porto,povoavarzim,37).
road(povoavarzim,barcelos,24).
road(povoavarzim,famalicao,30).
road(barcelos,braga,25).
road(barcelos,famalicao,23).
road(famalicao,porto,36).
road(famalicao,braga,24).
road(braga,guimaraes,25).
road(famalicao,guimaraes,29).

% travel(City1,City2,distance):
travel(X,Y,KM):-(road(X,Y,KM);road(Y,X,KM)). % true if road or symmetrical

% state transition rule s/2: s(City1,City2)
s(N1,N2):- travel(N1,N2,_). % link s(O,D,Dist) with s(O,D)

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
              eval(S,D),write('distance:'),write(D).
% write parameter (if any):
writepar(X):- integer(X),write(' par:'),write(X). % write X
writepar(_). % do not write X

% execute 3 example searches:
q1:- run(depthfirst).
q2:- run(iterativedeepening).
q3:- run(breadthfirst).
