% Adapted by Paulo Cortez @2017 (original code by Miguel Rocha and Rui Mendes)
% read the inference system:
:-[search].

% data base: --------------------------------------------------------------------
% initial and goal
initial(cm(0,0,3,3,boat)).
goal(cm(boat,3,3,0,0)).

% knowledge base: the state transitions: ----------------------------------------
% set the s predicate to work with 2 arguments (used in search methods)
s(S1,S2):- s(S1,_,S2).

% 10 transitions, 5 for left and 5 for right
% s(S1,move,S2)
s(cm(C1,M1,C2,M2,boat),left(2,0),cm(boat,NC1,M1,NC2,M2)):-
	C2 > 1,
	NC1 is C1 + 2,
	NC2 is C2 - 2,
	legal(NC1, M1),
	legal(NC2, M2).
s(cm(C1,M1,C2,M2,boat),left(1,0),cm(boat,NC1,M1,NC2,M2)):-
	C2 > 0,
	NC1 is C1 + 1,
	NC2 is C2 - 1,
	legal(NC1, M1),
	legal(NC2, M2).	
	s(cm(C1,M1,C2,M2,boat),left(1,1),cm(boat,NC1,NM1,NC2,NM2)):-
	C2 > 0, M2 > 0,
	NC2 is C2 - 1, NM2 is M2 - 1,
	NC1 is C1 + 1, NM1 is M1 + 1,
	legal(NC1, NM1), legal(NC2, NM2).
s(cm(C1,M1,C2,M2,boat),left(0,2),cm(boat,C1,NM1,C2,NM2)):-
	M2 > 1,
	NM1 is M1 + 2, NM2 is M2 - 2,
	legal(C1, NM1), legal(C2, NM2).
s(cm(C1,M1,C2,M2,boat),left(0,1),cm(boat,C1,NM1,C2,NM2)):-
	M2 > 0,
	NM1 is M1 + 1, NM2 is M2 - 1,
	legal(C1, NM1), legal(C2, NM2).
s(cm(boat,C1,M1,C2,M2),right(2,0),cm(NC1,M1,NC2,M2,boat)):-
	C1 > 1,
	NC1 is C1 - 2, NC2 is C2 + 2,
	legal(NC1, M1), legal(NC2, M2).
s(cm(boat,C1,M1,C2,M2),right(1,0),cm(NC1,M1,NC2,M2,boat)):-
	C1 > 0, NC1 is C1 - 1, NC2 is C2 + 1,
	legal(NC1, M1), legal(NC2, M2).	
s(cm(boat,C1,M1,C2,M2),right(1,1),cm(NC1,NM1,NC2,NM2,boat)):-
	C1 > 0, M1 > 0,
	NC1 is C1 - 1, NM1 is M1 - 1, NC2 is C2 + 1, NM2 is M2 + 1,
	legal(NC1, NM1), legal(NC2, NM2).
s(cm(boat,C1,M1,C2,M2),right(0,2),cm(C1,NM1,C2,NM2,boat)):-
	M1 > 1, NM1 is M1 - 2, NM2 is M2 + 2,
	legal(C1, NM1), legal(C2, NM2).
s(cm(boat,C1,M1,C2,M2),right(0,1),cm(C1,NM1,C2,NM2,boat)):-
	M1 > 0, NM1 is M1 - 1, NM2 is M2 + 1,
	legal(C1, NM1), legal(C2, NM2).
%------------------------------------------------------------------------ 
% auxiliary predicate: test if a state is legal (valid)
legal(_, 0).
legal(C, M):- C =< M.

% example of usage/interface ----------------------------------------------------
q1:- search(depthfirst,_,S,Moves),write('DP solution:'),mywrite(S),nl,write('moves:'),mywrite(Moves).
q2:- search(iterativedeepening,N,S,Moves),write('ID max depth:'),write(N),write(' solution:'),mywrite(S),nl,write('moves:'),mywrite(Moves).
q3:- search(breadthfirst,_,S,Moves),write('BF solution:'),mywrite(S),nl,write('moves:'),mywrite(Moves).

mywrite([]).
mywrite([X|R]):- write(X),write(' '),mywrite(R).
