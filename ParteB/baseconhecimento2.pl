


%TempoCaminhoMinALTERAR

calcularTempoMin(Caminho):- guardarDistancia(Caminho), guardarOcupacaoAutocarro(Caminho), 
ocupacao(Caminho, OcupacaoCaminho), comprimento(Caminho, DistanciaCaminho), 
assertz(passageiroKM(Caminho, OcupacaoCaminho / DistanciaCaminho)).

gerarPassageirosKM([]).
gerarPassageirosKM([C1|R1]):- calcularPassageirosKM(C1), gerarPassageirosKM(R1).

passageiroKMCaminho(Caminho, Indice):- guardarDistancia(Caminho), guardarOcupacaoAutocarro(Caminho), 
ocupacao(Caminho, OcupacaoCaminho), comprimento(Caminho, DistanciaCaminho), Indice is OcupacaoCaminho / DistanciaCaminho.



%QuestoesDoUtilizador

%CaminhoMaisCurto
caminhoMaisCurto(X,Y,Caminho):- retractall(comprimento(_,_)), listaCaminhos(X,Y,Lista), 
gerarDistanciasCaminhos(Lista), maisCurto(Caminho).

maisCurto(Caminho):- comprimento(Caminho, V), \+ (comprimento(_, V1), V > V1).


%CaminhoMaisLongo
caminhoMaisLongo(X,Y,Caminho):- retractall(comprimento(_,_)), listaCaminhos(X,Y,Lista), 
gerarDistanciasCaminhos(Lista), maisLongo(Caminho).

maisLongo(Caminho):- comprimento(Caminho, V), \+ (comprimento(_, V1), V1 > V).






%CaminhosDisponiveis

caminho(X,Z,Caminho):- caminho(X,Z,[X],Caminho).
caminho(X,X,Caminho,Caminho):- ocupacaoEncomenda(Caminho,Soma), Soma == 1.
caminho(X,Z,Visitado,Caminho):- percurso(X,Y,_), \+ member(Y,Visitado), 
caminho(Y,Z,[Y | Visitado],Caminho).








%GerarListaCaminhosFEITO
listaCaminhos(X,Y,Lista):- findall(C,caminho(X,Y,C),Lista).

%QuestoesDoUtilizador

%CaminhoMaisCurtoFEITO
caminhoMaisCurto(X,Y,Caminho):- retractall(comprimento(_,_)), listaCaminhos(X,Y,Lista), 
gerarDistanciasCaminhos(Lista), maisCurto(Caminho).

maisCurto(Caminho):- comprimento(Caminho, V), \+ (comprimento(_, V1), V > V1).


%CaminhoMaisLongoFEITO
caminhoMaisLongo(X,Y,Caminho):- retractall(comprimento(_,_)), listaCaminhos(X,Y,Lista), 
gerarDistanciasCaminhos(Lista), maisLongo(Caminho).

maisLongo(Caminho):- comprimento(Caminho, V), \+ (comprimento(_, V1), V1 > V).


%CaminhoMenosLucroALTERAR
caminhoMenosPassageiros(X,Y,Caminho):- retractall(ocupacao(_,_)), listaCaminhos(X,Y,Lista), 
gerarOcupacoesCaminhos(Lista), menosPassageiros(Caminho).

menosPassageiros(Caminho):- ocupacao(Caminho, V), \+ (ocupacao(_, V1), V > V1).

%CaminhoMaisLucroALTERAR
caminhoMaisPassageiros(X,Y,Caminho):- retractall(ocupacao(_,_)), listaCaminhos(X,Y,Lista), 
gerarOcupacoesCaminhos(Lista), maisPassageiros(Caminho).

maisPassageiros(Caminho):- ocupacao(Caminho, V), \+ (ocupacao(_, V1), V1 > V).

%CaminhoMaisVantajosoALTERAR
caminhoMaisVantajoso(X,Y,Caminho):- retractall(passageiroKM(_,_)), listaCaminhos(X,Y,Lista), 
gerarPassageirosKM(Lista),!, maisVantajoso(Caminho).

maisVantajoso(Caminho):- passageiroKM(Caminho, V), \+ (passageiroKM(_, V1), V1 > V).
