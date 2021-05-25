:-dynamic(resultado/1).
:- set_prolog_flag(encoding, utf8).
:- [processo, hillclimbing].


%entrega(Cliente, Lucro)
entrega(cliente1, 5).
entrega(cliente2, 6).
entrega(cliente3, 7).
entrega(cliente4, 9).
entrega(cliente5, 10).

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


restaurant(restaurante, [cliente1, cliente2, cliente3, cliente4, cliente5],[5,6,7,9,10]).

% verifica qual é o metodo de pesquisa a utlizar e determina o melhor caminho de acordo com o metodo de pesquisa selecionado
% adicionalmente seleciona para qql objetivo um cliente random para entrega
resultado(Metodo) :-
    (Metodo == 'percurso_', restaurant(_,LE,_), random_member(E,LE), nl,write('Entregar para:'),write(E),nl,nl, processo(restaurante, E));
    (Metodo == 'hillclimbing', restaurant(_,LE,_), random_member(E,LE), nl,write('Entregar para:'),write(E),nl,nl, demo(restaurante, E,_)).

% retorna um caminho possivel entre a Origem e o Destino selecionados
caminho(X,Z,C):-caminho(X,Z,[X],C).
caminho(X,X,Caminho,Caminho).
caminho(X,Z,Percorrido,Caminho) :- percurso(X,Y,_),
    \+ member(Y,Percorrido), append(Percorrido, [Y], Percorrido2),
    caminho(Y,Z, Percorrido2,Caminho).

% verifica qual é a distancia total do caminho atual
distancia_total([_],0).
distancia_total([X,Y|Z],Total) :- percurso(X,Y,D1),
    distancia_total([Y|Z],D2), Total is D1 + D2.
    
