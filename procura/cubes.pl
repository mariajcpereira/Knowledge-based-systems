:-[search].

% state representation: b(L1,L2), where L1 and L2 are lists with numbers
% initial state:
initial(b([1,2],[3,4])).
% goal all even or all odd numbers in L1:
goal(b([1,3],[_,_])).
goal(b([3,1],[_,_])).
goal(b([2,4],[_,_])).
goal(b([4,2],[_,_])).

% links s/2 with s/3:
s(S1,S2):- s(S1,_,S2).

% all state transitions: s(S1,Move,S2).
s(b(L,[A|R]),ba:[A],b([A|L],R)).
s(b(L,[A,B|R]),ba:[A,B],b([A,B|L],R)).
s(b(L,[A,B,C|R]),ba:[A,B,C],b([A,B,C|L],R)).
s(b([A|R],L),ab:[A],b(R,[A|L])).
s(b([A,B|R],L),ab:[A,B],b(R,[A,B|L])).
s(b([A,B,C|R],L),ab:[A,B,C],b(R,[A,B,C|L])).

% execute and show a search method result:
run(Method,Par):- search(Method,Par,S,Moves),
	          write('method:'),write(Method),writepar(Par),nl,
                  write('solution:'),write(S),nl,
		  length(Moves,N),write('solution steps:'),write(N),nl,
                  write('moves:'),write(Moves).

% write parameter (if any):
writepar(X):- integer(X),write(' par:'),write(X). % write X
writepar(_). % do not write X

% four different search execution examples:
q1:- run(depthfirst,_).
q2:- run(depthfirst2,3).
q3:- run(iterativedeepening,_).
q4:- run(breadthfirst,_).
