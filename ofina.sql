

# criação do esquema do banco de dados:

CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(50),
    telefone VARCHAR(20),
    email VARCHAR(50)
);

CREATE TABLE Veiculo (
    id_veiculo INT PRIMARY KEY,
    marca VARCHAR(50),
    modelo VARCHAR(50),
    ano_fabricacao INT,
    placa VARCHAR(10),
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Servico (
    id_servico INT PRIMARY KEY,
    descricao VARCHAR(100),
    valor DECIMAL(10, 2)
);

CREATE TABLE OrdemServico (
    id_ordem_servico INT PRIMARY KEY,
    data_entrada DATE,
    data_saida DATE,
    status VARCHAR(20),
    id_cliente INT,
    id_veiculo INT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_veiculo) REFERENCES Veiculo(id_veiculo)
);

CREATE TABLE ItemServico (
    id_item_servico INT PRIMARY KEY,
    quantidade INT,
    id_servico INT,
    id_ordem_servico INT,
    FOREIGN KEY (id_servico) REFERENCES Servico(id_servico),
    FOREIGN KEY (id_ordem_servico) REFERENCES OrdemServico(id_ordem_servico)
);

#Recuperações simples com SELECT Statement:

SELECT * FROM Cliente;
:
SELECT * FROM Veiculo;

SELECT * FROM Servico;

SELECT * FROM OrdemServico;

SELECT * FROM ItemServico;

Filtros com WHERE Statement:

SELECT * FROM Cliente WHERE id_cliente = 1;

SELECT * FROM Veiculo WHERE marca = 'Ford';

SELECT * FROM Servico WHERE valor > 100.00;

SELECT * FROM OrdemServico WHERE status = 'Em andamento';

SELECT * FROM ItemServico WHERE id_ordem_servico = 1;

# comando para expressões para gerar atributos derivados:

SELECT CONCAT(nome, ' ', sobrenome) AS nome_completo FROM Cliente;

SELECT SUM(is.quantidade * s.valor) AS valor_total FROM ItemServico is JOIN Servico s ON is.id_servico = s.id_servico WHERE is.id_ordem_servico = 1;

#Definindo ordenações dos dados com ORDER BY:

SELECT * FROM Cliente ORDER BY nome;

SELECT * FROM Servico ORDER BY valor DESC;

#Condições de filtros aos grupos – HAVING Statement:

SELECT os.id_ordem_servico, COUNT(*) AS num_itens_servico FROM OrdemServico os JOIN ItemServico is ON os.id_ordem_servico = is.id_ordem_servico GROUP BY os.id_ordem_servico HAVING COUNT(*) > 2;

#Criando junções entre tabelas para fornecer uma perspectiva mais complexa dos dados:

SELECT v.*, c.nome, c.telefone, c.email FROM Veiculo v JOIN Cliente c ON v.id_cliente = c.id_cliente;

SELECTis.*, s.descricao, s.valor, os.data_entrada, os.data_saida, os.status FROM ItemServico is JOIN Servico s ON is.id_servico = s.id_servico JOIN OrdemServico os ON is.id_ordem_servico = os.id_ordem_servico;