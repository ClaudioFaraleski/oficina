# bancoo de dados oficina desafio dio 
 abaixo foi criado um banco de dados com suas respectivas tabelas para representar uma oficina de automoveis

Tabela Cliente:
- id_cliente (PK)
- nome
- telefone
- email

Tabela Veículo:
- id_veiculo (PK)
- marca
- modelo
- ano_fabricacao
- placa
- id_cliente (FK)

Tabela Servico:
- id_servico (PK)
- descricao
- valor

Tabela OrdemServico:
- id_ordem_servico (PK)
- data_entrada
- data_saida
- status
- id_cliente (FK)
- id_veiculo (FK)

Tabela ItemServico:
- id_item_servico (PK)
- quantidade
- id_servico (FK)
- id_ordem_servico (FK)
