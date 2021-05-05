%entrega(Cliente, Lucro)
entrega(cliente1, 5).
entrega(cliente2, 6).
entrega(cliente3, 7).
entrega(cliente4, 9).
entrega(cliente5, 10).



%percurso(Origem, Destino, DistanciaEmMin)
percurso(restaurante, cliente1, 5).
percurso(cliente1, restaurante, 5).
percurso(cliente1, cliente2, 5).
percurso(cliente2, cliente1, 5).
percurso(cliente1, cliente4, 5).
percurso(cliente4, cliente1, 5).
percurso(cliente1, cliente5, 5).
percurso(cliente5, cliente1, 5).
percurso(cliente2, cliente3, 3).
percurso(cliente3, cliente2, 3).
percurso(cliente2, cliente4, 2).
percurso(cliente4, cliente2, 2).
percurso(cliente2, cliente5, 2).
percurso(cliente5, cliente2, 2).
percurso(cliente3, cliente4, 4).
percurso(cliente4, cliente3, 4).
percurso(cliente3, cliente5, 5).
percurso(cliente5, cliente3, 5).
percurso(restaurante, cliente4, 7).
percurso(cliente4, restaurante, 7).


%arco(Origem, Destino)
arco(restaurante, cliente1).
arco(restaurante, cliente4).
arco(cliente1, restaurante).
arco(cliente1, cliente2).
arco(cliente1, cliente4).
arco(cliente1, cliente5).
arco(cliente2, cliente1).
arco(cliente2, cliente3).
arco(cliente2, cliente4).
arco(cliente2, cliente5).
arco(cliente3, cliente2).
arco(cliente3, cliente4).
arco(cliente3, cliente5).
arco(cliente4, restaurante).
arco(cliente4, cliente1).
arco(cliente4, cliente2).
arco(cliente4, cliente3).
arco(cliente5, cliente1).
arco(cliente5, cliente2).
arco(cliente5, cliente3).
