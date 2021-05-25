:-dynamic(resultado/1).
:- set_prolog_flag(encoding, utf8).
:- [basedados, caminho_mais_rapido, hillclimbing].

restaurant(restaurante, [cliente1, cliente2, cliente3, cliente4, cliente5],[5,6,7,5,7]).

% verifica qual é o metodo de pesquisa a utlizar e determina o melhor caminho de acordo com o metodo de pesquisa selecionado
% adicionalmente seleciona para qql objetivo um cliente random para entrega
resultado(Metodo) :-
    (Metodo == 'mais_rapido', restaurant(_,LE,_), random_member(E,LE), nl,write('Entregar para:'),write(E),nl,nl, caminho_mais_rapido(restaurante, E));
    (Metodo == 'hillclimbing', restaurant(_,LE,_), random_member(E,LE), nl,write('Entregar para:'),write(E),nl,nl, demo(restaurante, E,_)).

% retorna um caminho possivel entre a Origem e o Destino selecionados
caminho(X,Z,C):-caminho(X,Z,[X],C).
caminho(X,X,Caminho,Caminho).
caminho(X,Z,Percorrido,Caminho) :- road(X,Y,_),
    \+ member(Y,Percorrido), append(Percorrido, [Y], Percorrido2),
    caminho(Y,Z, Percorrido2,Caminho).

% verifica qual é a distancia total do caminho atual
distancia_total([_],0).
distancia_total([X,Y|Z],Total) :- road(X,Y,D1),
    distancia_total([Y|Z],D2), Total is D1 + D2.
    
