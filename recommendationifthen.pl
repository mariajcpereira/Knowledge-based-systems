:- dynamic (<==)/2.

boa<==[[custo_medio=acessivel], [takeaway=sim, entrega=sim], [custo_medio=medio, entrega=sim, custo_entrega=nao]].
ma<==[[custo_medio=medio, takeaway=nao, entrega=nao], [custo_medio=medio, custo_entrega=sim], [custo_medio=caro, custo_entrega=sim]].
