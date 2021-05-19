% maxsin2: reversed maxsin variant with hill climbing versus depthfirst2 (depthfirst with Maxdepth!)
:-[auxiliar,hill,search], dynamic(dimension/1).

% evaluate a solution: reverse binary for max bin, best solution is: 0,0,0,0,...,1
eval(S,R):- % reverse 
        reverse(S,S1),
	binary_number(S1,N), 
        length(S,D),
	R is sin(pi*N/2^D).

% hill climbing approach:
% random flip one bit of S1, return S2:
change(S1,S2):- length(S1,L),
                random(1,L,X),
	        nth1(X,S1,Point),
	        flip(Point,Point2),
	        replace_list(S1,X,Point2,S2).

% pure hill climbing, maximum of 1000 iterations, maximization task:
hrun(D,SF):- rep(D,0,S0),
             time( hill_climbing(S0,[1000,1000,0.0,max],SF) ).

% blind search approach, just get one valid solution:
initial([]).
goal(S):- dimension(D),length(S,D),eval(S,1.0). % 

% transition: flip a number 
s(S1,[0|S1]).
s(S1,[1|S1]).

brun(D,S):- retractall(dimension(_)),assert(dimension(D)),
            time(depthshow(D,S)).
depthshow(D,S1):- search(depthfirst2,D,S),last(S,S1),eval(S1,E1),show(final,1,S1,E1,_,_).

% test:
% N=8,16,18
run(N):-write('hill climbing:'),nl,hrun(N,_),write('depthfirst2'),nl,brun(N,_).

q1:-run(8).
q2:-run(16).
q3:-run(18).
