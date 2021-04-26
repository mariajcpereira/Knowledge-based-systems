:-[preprocess], dynamic(example/2),dynamic(data/1).

% the goal is to classify refeicoes

% input variables: pass all of them to basededados3.pl file:
attribute(categoria, [portuguesa, churrasco, hamburgueres, sanduiches, japonesa, sushi, pizza, italiana, saudavel, mexicana]).
attribute(custo_medio, [acessivel, medio, caro]).
attribute(takeaway, [sim, nao]).
attribute(entrega, [sim, nao]).
attribute(custo_entrega, [sim, nao]).

% output target: acessibilidade: boa or ma

data([portuguesa, acessivel, sim, sim, sim, boa]).
data([portuguesa, acessivel, nao, sim, sim, boa]).
data([portuguesa, acessivel, sim, sim, nao, boa]).
data([portuguesa, medio, sim, sim, sim, boa]).
data([portuguesa, medio, nao, sim, sim, ma]).
data([portuguesa, medio, sim, sim, nao, boa]).
data([portuguesa, caro, sim, sim, sim, boa]).
data([portuguesa, caro, nao, sim, sim, ma]).
data([portuguesa, caro, sim, sim, nao, ma]).
data([churrasco, acessivel, sim, sim, sim, boa]).
data([churrasco, acessivel, nao, sim, sim, boa]).
data([churrasco, acessivel, sim, sim, nao, boa]).
data([churrasco, medio, sim, sim, sim, boa]).
data([churrasco, medio, nao, sim, sim, ma]).
data([churrasco, medio, sim, sim, nao, boa]).
data([churrasco, caro, sim, sim, sim, ma]).
data([churrasco, caro, nao, sim, sim, ma]).
data([churrasco, caro, sim, sim, nao, boa]).
data([hamburgueres, acessivel, sim, sim, sim, boa]).
data([hamburgueres, acessivel, nao, sim, sim, boa]).
data([hamburgueres, acessivel, sim, sim, nao, boa]).
data([hamburgueres, medio, sim, sim, sim, boa]).
data([hamburgueres, medio, nao, sim, sim, ma]).
data([hamburgueres, medio, sim, sim, nao, boa]).
data([hamburgueres, caro, sim, sim, sim, ma]).
data([hamburgueres, caro, nao, sim, sim, ma]).
data([hamburgueres, caro, sim, sim, nao, boa]).
data([sanduiches, acessivel, sim, sim, sim, boa]).
data([sanduiches, acessivel, nao, sim, sim, boa]).
data([sanduiches, acessivel, sim, sim, nao, boa]).
data([sanduiches, medio, sim, sim, sim, boa]).
data([sanduiches, medio, nao, sim, sim, ma]).
data([sanduiches, medio, sim, sim, nao, boa]).
data([sanduiches, caro, sim, sim, sim, ma]).
data([sanduiches, caro, nao, sim, sim, ma]).
data([sanduiches, caro, sim, sim, nao, boa]).
data([italiana, acessivel, sim, sim, sim, boa]).
data([italiana, acessivel, nao, sim, sim, boa]).
data([italiana, acessivel, sim, sim, nao, boa]).
data([italiana, medio, sim, sim, sim, boa]).
data([italiana, medio, nao, sim, sim, ma]).
data([italiana, medio, sim, sim, nao, boa]).
data([italiana, caro, sim, sim, sim, ma]).
data([italiana, caro, nao, sim, sim, ma]).
data([italiana, caro, sim, sim, nao, boa]).
data([pizza, acessivel, sim, sim, sim, boa]).
data([pizza, acessivel, nao, sim, sim, boa]).
data([pizza, acessivel, sim, sim, nao, boa]).
data([pizza, medio, sim, sim, sim, boa]).
data([pizza, medio, nao, sim, sim, ma]).
data([pizza, medio, sim, sim, nao, boa]).
data([pizza, caro, sim, sim, sim, ma]).
data([pizza, caro, nao, sim, sim, ma]).
data([pizza, caro, sim, sim, nao, boa]).
data([japonesa, acessivel, sim, sim, sim, boa]).
data([japonesa, acessivel, nao, sim, sim, boa]).
data([japonesa, acessivel, sim, sim, nao, boa]).
data([japonesa, medio, sim, sim, sim, boa]).
data([japonesa, medio, nao, sim, sim, ma]).
data([japonesa, medio, sim, sim, nao, boa]).
data([japonesa, caro, sim, sim, sim, ma]).
data([japonesa, caro, nao, sim, sim, ma]).
data([japonesa, caro, sim, sim, nao, boa]).
data([sushi, acessivel, sim, sim, sim, boa]).
data([sushi, acessivel, nao, sim, sim, boa]).
data([sushi, acessivel, sim, sim, nao, boa]).
data([sushi, medio, sim, sim, sim, boa]).
data([sushi, medio, nao, sim, sim, ma]).
data([sushi, medio, sim, sim, nao, boa]).
data([sushi, caro, sim, sim, sim, ma]).
data([sushi, caro, nao, sim, sim, ma]).
data([sushi, caro, sim, sim, nao, boa]).
data([mexicana, acessivel, sim, sim, sim, boa]).
data([mexicana, acessivel, nao, sim, sim, boa]).
data([mexicana, acessivel, sim, sim, nao, boa]).
data([mexicana, medio, sim, sim, sim, boa]).
data([mexicana, medio, nao, sim, sim, ma]).
data([mexicana, medio, sim, sim, nao, boa]).
data([mexicana, caro, sim, sim, sim, ma]).
data([mexicana, caro, nao, sim, sim, ma]).
data([mexicana, caro, sim, sim, nao, boa]).
data([saudavel, acessivel, sim, sim, sim, boa]).
data([saudavel, acessivel, nao, sim, sim, boa]).
data([saudavel, acessivel, sim, sim, nao, boa]).
data([saudavel, medio, sim, sim, sim, boa]).
data([saudavel, medio, nao, sim, sim, ma]).
data([saudavel, medio, sim, sim, nao, boa]).
data([saudavel, caro, sim, sim, sim, ma]).
data([saudavel, caro, nao, sim, sim, ma]).
data([saudavel, caro, sim, sim, nao, boa]).
