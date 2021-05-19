%:- dynamic /2 .
%:- dynamic /2 .
%:- dynamic /2 .
:-[basedados].

%ocupacaoEncomenda

ocupacaoEncomenda([],0).
ocupacaoEncomenda([X|R],Soma) :- passageiros(X,TotalParagem), 
ocupacaoEncomenda(R,TotalEncomenda), Soma is TotalParagem + TotalEncomenda.

guardarOcupacaoEncomenda(Caminho):- ocupacaoEncomenda(Caminho, Valor), 
assertz(ocupacao(Caminho, Valor)).

gerarOcupacoesCaminhos([]).
gerarOcupacoesCaminhos([C1|R1]):- guardarOcupacaoEncomenda(C1), gerarOcupacoesCaminhos(R1).




%DistanciaCaminho
calcularDistancia(_,[],0).
calcularDistancia(P1,[P2|R2], Soma):- percurso(P2,P1,Distancia), 
calcularDistancia(P2, R2, DistanciaPercorrida), Soma is Distancia + DistanciaPercorrida.

guardarDistancia([]).
guardarDistancia([P1|R1]):- calcularDistancia(P1,R1,Valor), assertz(comprimento([P1|R1], Valor)).

gerarDistanciasCaminhos([]).
gerarDistanciasCaminhos([C1|R1]):- guardarDistancia(C1), gerarDistanciasCaminhos(R1).

distanciaCaminho([P1|R1], Valor):-  calcularDistancia(P1,R1,Valor).





%GerarListaCaminhos
listaCaminhos(X,Y,Lista):- findall(C,caminho(X,Y,C),Lista).


%CaminhosDisponiveis

caminho(X,Z,Caminho):- caminho(X,Z,[X],Caminho).
caminho(X,X,Caminho,Caminho):- ocupacaoEncomenda(Caminho,Soma), Soma == 1.
caminho(X,Z,Visitado,Caminho):- percurso(X,Y,_), \+ member(Y,Visitado), 
caminho(Y,Z,[Y | Visitado],Caminho).

%QuestoesDoUtilizador

%CaminhoMaisCurto
caminhoMaisCurto(X,Y,Caminho):- retractall(comprimento(_,_)), listaCaminhos(X,Y,Lista), 
gerarDistanciasCaminhos(Lista), maisCurto(Caminho).

maisCurto(Caminho):- comprimento(Caminho, V), \+ (comprimento(_, V1), V > V1).


%CaminhoMaisLongo
caminhoMaisLongo(X,Y,Caminho):- retractall(comprimento(_,_)), listaCaminhos(X,Y,Lista), 
gerarDistanciasCaminhos(Lista), maisLongo(Caminho).

maisLongo(Caminho):- comprimento(Caminho, V), \+ (comprimento(_, V1), V1 > V).
