:-[auxiliar,hill,search].
:- dynamic(dimension/1). % number of bits to optimize 

%%% hill climbing approach: ----------------------------------------
% evaluate a solution:
eval(S,Bits):- sum_list(S,Bits).

% random flip one bit of list S1, return S2: 
change(S1,S2):- binary_change(S1,S2).

% D is the dimension, number of bits to optimize % S is the solution
hrun1(D,S):- % standard hill climbing
	rep(D,0,S0), % initial solution S0
	% 100 iterations, report every 10 iterations:
	time(hill_climbing(S0,[100,20,0,max],S)).
hrun2(D,S):- % stochastic hill climbing Prob=0.2 
	rep(D,0,S0), % initial solution S0
	% 100 iterations, report every 10 iterations 
	time(hill_climbing(S0,[100,20,0.2,max],S)).

%%% blind search approach: ----------------------------------------
initial([]). % empty binary list
goal(S):- dimension(D),length(S,D),eval(S,D).

% transition s/2 s(S1,S2) - add a binary number 0 or 1:
s(S1,[0|S1]).
s(S1,[1|S1]).

brun(D,S):- 
	retractall(dimension(_)),
	assert(dimension(D)), % update D 
	time(blindsearch(D,S)).

blindsearch(D,S):- 
	search(depthfirst2,D,S1),
	last(S1,S),
	eval(S,E1),
	show(final,1,S1,E1,_,_).

q1:-brun(20,S),write(S). % blind search
q2:-hrun1(20,S),write(S). % hill climbing
q3:-hrun2(20,S),write(S). % stochastic hill climbing
