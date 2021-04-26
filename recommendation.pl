:-[preprocess], dynamic(example/2),dynamic(data/1).

% the goal is to classify refeicoes

% input variables: pass all of them to basededados3.pl file:
attribute(localizacao, [braga, guimaraes]).
attribute(categoria, [portuguesa, churrasco, hamburgueres, sanduiches, japonesa, sushi, pizza, italiana, saudavel, mexicana]).
attribute(custo_medio, [acessivel, medio, caro]).
attribute(takeaway, [sim, nao]).
attribute(entrega, [sim, nao]).
attribute(custo_entrega, [sim, nao]).

% output target:
