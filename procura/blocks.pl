% Adapted by Paulo Cortez @2021 (original code by Ivan Bratko)
:-[search].

% state: 
%   a stack list with up to 3 boxes.
%   a box is a, b or c labels.
%   we need to store 3 stacks: current box and up to 3 individual boxes
%   an empty stack is the empty list []

% data base: --------------------------------------------------------------------
% initial state:
initial([ [c,a,b], [], [] ]).

% final goal:
goal(Situation):-member([a,b,c],Situation).

% knowledge base: the state transitions: ----------------------------------------
% state space: 2 arguments: start node state, end node state: 6 transitions
s([[X|R],L2,L3],[R,[X|L2],L3]). % from 1st to 2nd
s([[X|R],L2,L3],[R,L2,[X|L3]]). % from 1st to 3rd
s([L1,[X|R],L3],[[X|L1],R,L3]). % from 2nd to 1st
s([L1,[X|R],L3],[L1,R,[X|L3]]). % from 2nd to 1st
s([L1,L2,[X|R]],[[X|L1],L2,R]). % from 3rd to 1st
s([L1,L2,[X|R]],[L1,[X|L2],R]). % from 3rd to 2nd

% example of usage/interface ----------------------------------------------------
q1:- search(depthfirst,_,S),write('solution:'),mywrite(S).
% depthfirst2 with 5 Maxdepth:
q2:- search(depthfirst2,5,S),write('max depth:'),write(5),write(' solution:'),mywrite(S).
q3:- search(iterativedeepening,N,S),write('max depth:'),write(N),write(' solution:'),mywrite(S).
q4:- search(breadthfirst,_,S),write('solution:'),mywrite(S).

mywrite([]).
mywrite([X|R]):- write(X),write(' '),mywrite(R).
